#include <GWCA/stdafx.h>

#include <GWCA/Constants/Constants.h>
#include <GWCA/Constants/Maps.h>

#include <GWCA/Utilities/Debug.h>
#include <GWCA/Utilities/Macros.h>
#include <GWCA/Utilities/Scanner.h>
#include <GWCA/Utilities/Hooker.h>

#include <GWCA/GameContainers/GamePos.h>

#include <GWCA/GameEntities/Map.h>
#include <GWCA/GameEntities/Pathing.h>

#include <GWCA/Context/Cinematic.h>
#include <GWCA/Context/MapContext.h>
#include <GWCA/Context/CharContext.h>
#include <GWCA/Context/GameContext.h>
#include <GWCA/Context/AgentContext.h>
#include <GWCA/Context/WorldContext.h>

#include <GWCA/Managers/Module.h>
#include <GWCA/Managers/UIMgr.h>
#include <GWCA/Managers/MapMgr.h>


namespace {
    using namespace GW;

    // kSendEnterMission (0x30000002) was removed from the UIMessage enum in the current GWCA headers;
    // use the raw value to preserve the hook mechanism.
    constexpr UI::UIMessage kSendEnterMission = static_cast<UI::UIMessage>(0x30000002);

    int* region_id_addr = 0;
    AreaInfo* area_info_addr = 0;

    typedef float(__cdecl* QueryAltitude_pt)(
        const GamePos* point,
        float radius,
        float* alt,
        Vec3f* unk);
    QueryAltitude_pt QueryAltitude_Func;

    typedef void(__cdecl* DoAction_pt)(uint32_t identifier);
    DoAction_pt EnterChallengeMission_Func = 0;
    DoAction_pt EnterChallengeMission_Ret = 0;
    HookEntry EnterChallengeMission_Entry;

    void OnEnterChallengeMission_Hook(uint32_t identifier) {
        GW::UI::SendUIMessage(kSendEnterMission, (void*)identifier);
    }
    void OnEnterChallengeMission_UIMessage(GW::HookStatus* status, UI::UIMessage, void* wparam, void*) {
        if (!status->blocked && EnterChallengeMission_Ret)
            EnterChallengeMission_Ret((uint32_t)wparam);
    }

    typedef void(__cdecl* Void_pt)();
    Void_pt SkipCinematic_Func = 0;
    Void_pt CancelEnterChallengeMission_Func = 0;

    typedef GW::MapContext*(__cdecl* CreateMapContext_pt)(uint32_t map_file_id);
    typedef bool(__cdecl* DestroyMapContext_pt)(GW::MapContext*);
    CreateMapContext_pt CreateMapContext_Func = 0;
    DestroyMapContext_pt DestroyMapContext_Func = 0;

    GW::MissionMapContext* mission_map_context = 0;
    GW::WorldMapContext* world_map_context = 0;



    enum class EnterMissionArena : uint32_t {

        DAlessioArena = 0x13E,
        AmnoonArena = 0x13F,
        FortKoga = 0x140,
        HeroesCrypt = 0x141,
        ShiverpeakArena = 0x142,

        CurrentMap = 0x36d
    };
    enum class EnterMissionFoe : uint32_t {
        None = 0x0,
        IllusionaryWeaponry = 0x32,
        IWillAvengeYouWarriors = 0x33,
        ObsidianSpikeElementalists = 0x34,
        DegenerationTeam = 0x37,
        SmitingMonks = 0x39,
        VictoryIsMineTrappers = 0x3c
    };

    struct MapDimensions {
        uint32_t unk;
        uint32_t start_x;
        uint32_t start_y;
        uint32_t end_x;
        uint32_t end_y;
        uint32_t unk1;
    };

    MapTypeInstanceInfo* map_type_instance_infos = 0;
    uint32_t map_type_instance_infos_size = 0;

    struct InstanceInfo {
        MapDimensions* terrain_info1;
        GW::Constants::InstanceType instance_type;
        AreaInfo* current_map_info;
        uint32_t terrain_count;
        MapDimensions* terrain_info2;
    } *InstanceInfoPtr = 0;

    void Init() {

        DWORD address = 0;
        SkipCinematic_Func = (Void_pt)Scanner::Find("\x8b\x40\x30\x83\x78\x04\x00", "xxxxxxx", -0x5);

        address = GW::Scanner::Find("\x6a\x54\x8d\x46\x24\x89\x08", "xxxxxxx", -0x4);
        if(address && Scanner::IsValidPtr(*(uintptr_t*)(address)))
            region_id_addr = *(int**)(address);

        address = Scanner::Find("\x6B\xC6\x7C\x5E\x05", "xxxxx", 5);
        if (address && Scanner::IsValidPtr(*(uintptr_t*)address, Section_RDATA))
            area_info_addr = *(AreaInfo**)(address);

        address = Scanner::Find("\x6A\x2C\x50\xE8\x00\x00\x00\x00\x83\xC4\x08\xC7", "xxxx????xxxx", +0xd);
        if (address && Scanner::IsValidPtr(*(uintptr_t*)(address)))
            InstanceInfoPtr = *(InstanceInfo**)(address);

        address = Scanner::Find("\x8b\x58\x14\xff\x73\x78\xe8\x28\xbc\x02\x00\x83\xc4\x04\x85\xc0", "xxxxxxx????xxxxx", -0xd);
        if (Verify(address))
            QueryAltitude_Func = (QueryAltitude_pt)address;

        address = Scanner::Find("\xa9\x00\x00\x10\x00\x74\x3a", "xxxxxxx");
        CancelEnterChallengeMission_Func = (Void_pt)Scanner::FunctionFromNearCall(address + 0x19);
        EnterChallengeMission_Func = (DoAction_pt)Scanner::FunctionFromNearCall(address + 0x51);
        if (EnterChallengeMission_Func) {
            GW::Hook::CreateHook((void**)&EnterChallengeMission_Func, OnEnterChallengeMission_Hook, (void**)&EnterChallengeMission_Ret);
            UI::RegisterUIMessageCallback(&EnterChallengeMission_Entry, kSendEnterMission, OnEnterChallengeMission_UIMessage, 0x1);
        }

        address = Scanner::Find("\x83\xc0\x0c\x41\x3d\x68\x01\x00\x00", "xxxxxxxxx");
        if (address) {
            map_type_instance_infos = *(MapTypeInstanceInfo**)(address + 0x19);
            map_type_instance_infos_size = (*(uint32_t*)(address + 5)) / sizeof(MapTypeInstanceInfo);
        }

        address = Scanner::Find("\x8d\x45\x00\x6a\x2c\x50\xe8", "xx?xxxx", +0x6);
        if (address)
            CreateMapContext_Func = (CreateMapContext_pt)Scanner::FunctionFromNearCall(address);

        address = Scanner::Find("\x8b\x45\x00\x50\xe8\x00\x00\x00\x00\x83\xc4\x04\x84\xc0", "xx?xx????xxxxx", +0x4);
        if (address)
            DestroyMapContext_Func = (DestroyMapContext_pt)Scanner::FunctionFromNearCall(address);

        address = Scanner::Find("\x68\x48\x00\x00\x00\xe8\x00\x00\x00\x00\xa3", "xxxxx????xx", +0xa);
        if (address && Scanner::IsValidPtr(*(uintptr_t*)(address)))
            mission_map_context = *(GW::MissionMapContext**)(address);

        address = Scanner::Find("\x68\x24\x02\x00\x00\xe8\x00\x00\x00\x00\xa3", "xxxxx????xx", +0xa);
        if (address && Scanner::IsValidPtr(*(uintptr_t*)(address)))
            world_map_context = *(GW::WorldMapContext**)(address);

        GWCA_INFO("[SCAN] map_type_instance_infos address = %p, size = %d", map_type_instance_infos, map_type_instance_infos_size);
        GWCA_INFO("[SCAN] RegionId address = %p", region_id_addr);
        GWCA_INFO("[SCAN] AreaInfo address = %p", area_info_addr);
        GWCA_INFO("[SCAN] InstanceInfoPtr address = %p", InstanceInfoPtr);
        GWCA_INFO("[SCAN] QueryAltitude Function = %p", QueryAltitude_Func);
        GWCA_INFO("[SCAN] EnterChallengeMission_Func = %p", EnterChallengeMission_Func);
        GWCA_INFO("[SCAN] CancelEnterChallengeMission_Func = %p", CancelEnterChallengeMission_Func);
        GWCA_INFO("[SCAN] CreateMapContext_Func = %p", CreateMapContext_Func);
        GWCA_INFO("[SCAN] DestroyMapContext_Func = %p", DestroyMapContext_Func);
#ifdef _DEBUG
        GWCA_ASSERT(map_type_instance_infos);
        GWCA_ASSERT(region_id_addr);
        GWCA_ASSERT(area_info_addr);
        GWCA_ASSERT(InstanceInfoPtr);
        GWCA_ASSERT(QueryAltitude_Func);
        GWCA_ASSERT(EnterChallengeMission_Func);
        GWCA_ASSERT(CancelEnterChallengeMission_Func);
#endif
    }
    void EnableHooks() {
        if (EnterChallengeMission_Func)
            Hook::EnableHooks(EnterChallengeMission_Func);
    }
    void DisableHooks() {
        if (EnterChallengeMission_Func)
            Hook::DisableHooks(EnterChallengeMission_Func);
    }
    void Exit() {
        Hook::RemoveHook(EnterChallengeMission_Func);
    }
}

namespace GW {

    Module MapModule {
        "MapModule",    // name
        NULL,           // param
        ::Init,         // init_module
        ::Exit,           // exit_module
        ::EnableHooks,           // enable_hooks
        ::DisableHooks,           // disable_hooks
    };
    namespace Map {

        float QueryAltitudeInternal(const GamePos& pos, float radius, float& alt, Vec3f* terrain_normal) {
            if (QueryAltitude_Func)
                return QueryAltitude_Func(&pos, radius, &alt, terrain_normal);
            return 0;
        }

        float QueryAltitude(const GamePos* pos, float radius, GW::MapContext* context) {
            if (!pos)
                return 0.f;
            float alt = 0.f;
            QueryAltitudeInternal(*pos, radius, alt, nullptr);
            return alt;
        }

        bool GetIsMapLoaded() {
            auto* g = GetGameContext();
            return g && g->map != nullptr;
        }

        bool Travel(Constants::MapID map_id, GW::Constants::ServerRegion region, int district_number, GW::Constants::Language language) {
            struct MapStruct {
                GW::Constants::MapID map_id;
                GW::Constants::ServerRegion region;
                GW::Constants::Language language;
                int district;
            };
            MapStruct t;
            t.map_id = map_id;
            t.district = district_number;
            t.region = region;
            t.language = language;
            return UI::SendUIMessage(UI::UIMessage::kTravel, &t);
        }

        bool Travel(Constants::MapID map_id, Constants::District district, int district_number) {
            switch (district) {
            case Constants::District::Current:
                return Travel(map_id, GetRegion(), district_number, GetLanguage());
            case Constants::District::International:
                return Travel(map_id, Constants::ServerRegion::International, district_number, (Constants::Language)0);
            case Constants::District::American:
                return Travel(map_id, Constants::ServerRegion::America, district_number, (Constants::Language)0);
            case Constants::District::EuropeEnglish:
                return Travel(map_id, Constants::ServerRegion::Europe, district_number, Constants::Language::English);
            case Constants::District::EuropeFrench:
                return Travel(map_id, Constants::ServerRegion::Europe, district_number, Constants::Language::French);
            case Constants::District::EuropeGerman:
                return Travel(map_id, Constants::ServerRegion::Europe, district_number, Constants::Language::German);
            case Constants::District::EuropeItalian:
                return Travel(map_id, Constants::ServerRegion::Europe, district_number, Constants::Language::Italian);
            case Constants::District::EuropeSpanish:
                return Travel(map_id, Constants::ServerRegion::Europe, district_number, Constants::Language::Spanish);
            case Constants::District::EuropePolish:
                return Travel(map_id, Constants::ServerRegion::Europe, district_number, Constants::Language::Polish);
            case Constants::District::EuropeRussian:
                return Travel(map_id, Constants::ServerRegion::Europe, district_number, Constants::Language::Russian);
            case Constants::District::AsiaKorean:
                return Travel(map_id, Constants::ServerRegion::Korea, district_number, (Constants::Language)0);
            case Constants::District::AsiaChinese:
                return Travel(map_id, Constants::ServerRegion::China, district_number, (Constants::Language)0);
            case Constants::District::AsiaJapanese:
                return Travel(map_id, Constants::ServerRegion::Japan, district_number, (Constants::Language)0);
            }
            return false;
        }

        uint32_t GetInstanceTime() {
            auto* a = GetAgentContext();
            return a ? a->instance_timer : 0;
        }

        Constants::MapID GetMapID() {
            auto* c = GetCharContext();
            return c ? (Constants::MapID)c->current_map_id : Constants::MapID::None;
        }

        Constants::ServerRegion GetRegion() {
            return region_id_addr ? (Constants::ServerRegion)*region_id_addr : Constants::ServerRegion::Unknown;
        }

        bool GetIsMapUnlocked(Constants::MapID map_id) {
            auto* w = GetWorldContext();
            Array<uint32_t>* unlocked_map = w && w->unlocked_map.valid() ? &w->unlocked_map : nullptr;
            if (!unlocked_map)
                return false;
            uint32_t real_index = (uint32_t)map_id / 32;
            if (real_index >= unlocked_map->size())
                return false;
            uint32_t shift = (uint32_t)map_id % 32;
            uint32_t flag = 1u << shift;
            return (unlocked_map->at(real_index) & flag) != 0;
        }

        Constants::Language GetLanguage() {
            auto* c = GetCharContext();
            return c ? c->language : Constants::Language::Unknown;
        }

        bool GetIsObserving() {
            auto* c = GetCharContext();
            return c ? c->current_map_id != c->observe_map_id : false;
        }

        int GetDistrict() {
            auto* c = GetCharContext();
            return c ? (int)c->district_number : 0;
        }

        Constants::InstanceType GetInstanceType() {
            return InstanceInfoPtr ? InstanceInfoPtr->instance_type : Constants::InstanceType::Loading;
        }

        MissionMapIconArray* GetMissionMapIconArray() {
            auto* w = GetWorldContext();
            return w && w->mission_map_icons.valid() ? &w->mission_map_icons : nullptr;
        }

        PathingMapArray* GetPathingMap() {
            auto* map = GetMapContext();
            return map && map->path && map->path->staticData ? &map->path->staticData->map : nullptr;
        }

        uint32_t GetFoesKilled() {
            auto* w = GetWorldContext();
            return w ? w->foes_killed : 0;
        }

        uint32_t GetFoesToKill() {
            auto* w = GetWorldContext();
            return w ? w->foes_to_kill : 0;
        }

        AreaInfo* GetMapInfo(Constants::MapID map_id) {
            if (map_id == Constants::MapID::None) {
                map_id = GetMapID();
            }
            return area_info_addr ? &area_info_addr[(uint32_t)map_id] : nullptr;
        }

        bool GetIsInCinematic() {
            auto* g = GetGameContext();
            return g && g->cinematic ? g->cinematic->h0004 != 0 : false;
        }

        bool SkipCinematic() {
            return SkipCinematic_Func ? SkipCinematic_Func(), true : false;
        }

        bool EnterChallenge() {
            return UI::SendUIMessage(kSendEnterMission, (void*)0x36d);
        }

        bool CancelEnterChallenge() {
            return CancelEnterChallengeMission_Func ? CancelEnterChallengeMission_Func(), true : false;
        }
        MapTypeInstanceInfo* GetMapTypeInstanceInfo(RegionType map_region_type) {
            bool is_outpost = !(map_region_type == RegionType::ExplorableZone
                || map_region_type == RegionType::MissionArea
                || map_region_type == RegionType::Dungeon);
            for (size_t i = 0; i < map_type_instance_infos_size; i++) {
                if (map_type_instance_infos[i].map_region_type == map_region_type
                    && map_type_instance_infos[i].is_outpost == is_outpost) {
                    return &map_type_instance_infos[i];
                }
            }
            return nullptr;
        }

        MissionMapContext* GetMissionMapContext() {
            return mission_map_context;
        }

        WorldMapContext* GetWorldMapContext() {
            return world_map_context;
        }

        MapContext* CreateMapContext(uint32_t map_file_id) {
            return CreateMapContext_Func ? CreateMapContext_Func(map_file_id) : nullptr;
        }

        bool DestroyMapContext(MapContext* context) {
            return DestroyMapContext_Func ? DestroyMapContext_Func(context) : false;
        }

        Constants::ServerRegion RegionFromDistrict(const GW::Constants::District district) {
            switch (district) {
            case Constants::District::American:
                return Constants::ServerRegion::America;
            case Constants::District::EuropeEnglish:
            case Constants::District::EuropeFrench:
            case Constants::District::EuropeGerman:
            case Constants::District::EuropeItalian:
            case Constants::District::EuropeSpanish:
            case Constants::District::EuropePolish:
            case Constants::District::EuropeRussian:
                return Constants::ServerRegion::Europe;
            case Constants::District::AsiaKorean:
                return Constants::ServerRegion::Korea;
            case Constants::District::AsiaChinese:
                return Constants::ServerRegion::China;
            case Constants::District::AsiaJapanese:
                return Constants::ServerRegion::Japan;
            case Constants::District::International:
                return Constants::ServerRegion::International;
            default:
                return GetRegion();
            }
        }

        Constants::Language LanguageFromDistrict(const GW::Constants::District district) {
            switch (district) {
            case Constants::District::EuropeFrench:
                return Constants::Language::French;
            case Constants::District::EuropeGerman:
                return Constants::Language::German;
            case Constants::District::EuropeItalian:
                return Constants::Language::Italian;
            case Constants::District::EuropeSpanish:
                return Constants::Language::Spanish;
            case Constants::District::EuropePolish:
                return Constants::Language::Polish;
            case Constants::District::EuropeRussian:
                return Constants::Language::Russian;
            case Constants::District::AsiaKorean:
                return Constants::Language::Korean;
            case Constants::District::AsiaChinese:
                return Constants::Language::TraditionalChinese;
            case Constants::District::AsiaJapanese:
                return Constants::Language::Japanese;
            default:
                return Constants::Language::English;
            }
        }

    }
} // namespace GW

// ============================================================
// C Interop API
// ============================================================
extern "C" {
    GWCA_API void* GetMissionMapContext() {
        return GW::Map::GetMissionMapContext();
    }
    GWCA_API void* GetWorldMapContext() {
        return GW::Map::GetWorldMapContext();
    }
    GWCA_API void* CreateMapContext(uint32_t map_file_id) {
        return GW::Map::CreateMapContext(map_file_id);
    }
    GWCA_API bool DestroyMapContext(void* context) {
        return GW::Map::DestroyMapContext((GW::MapContext*)context);
    }
    GWCA_API float QueryAltitude(const float* x, const float* y, float radius, void* context) {
        if (!x || !y) return 0.f;
        GW::GamePos pos(*x, *y, 0);
        return GW::Map::QueryAltitude(&pos, radius, (GW::MapContext*)context);
    }
    GWCA_API bool GetIsMapLoaded() {
        return GW::Map::GetIsMapLoaded();
    }
    GWCA_API uint32_t GetMapID() {
        return (uint32_t)GW::Map::GetMapID();
    }
    GWCA_API bool GetIsMapUnlocked(uint32_t map_id) {
        return GW::Map::GetIsMapUnlocked((GW::Constants::MapID)map_id);
    }
    GWCA_API uint32_t GetRegion() {
        return (uint32_t)GW::Map::GetRegion();
    }
    GWCA_API uint32_t GetLanguage() {
        return (uint32_t)GW::Map::GetLanguage();
    }
    GWCA_API bool GetIsObserving() {
        return GW::Map::GetIsObserving();
    }
    GWCA_API int GetDistrict() {
        return GW::Map::GetDistrict();
    }
    GWCA_API uint32_t GetInstanceTime() {
        return GW::Map::GetInstanceTime();
    }
    GWCA_API uint32_t GetInstanceType() {
        return (uint32_t)GW::Map::GetInstanceType();
    }
    GWCA_API bool TravelByRegion(uint32_t map_id, uint32_t region, int district_number, uint32_t language) {
        return GW::Map::Travel((GW::Constants::MapID)map_id, (GW::Constants::ServerRegion)region, district_number, (GW::Constants::Language)language);
    }
    GWCA_API bool TravelByDistrict(uint32_t map_id, uint32_t district, int district_number) {
        return GW::Map::Travel((GW::Constants::MapID)map_id, (GW::Constants::District)district, district_number);
    }
    GWCA_API uint32_t RegionFromDistrict(uint32_t district) {
        return (uint32_t)GW::Map::RegionFromDistrict((GW::Constants::District)district);
    }
    GWCA_API uint32_t LanguageFromDistrict(uint32_t district) {
        return (uint32_t)GW::Map::LanguageFromDistrict((GW::Constants::District)district);
    }
    GWCA_API uint32_t GetFoesKilled() {
        return GW::Map::GetFoesKilled();
    }
    GWCA_API uint32_t GetFoesToKill() {
        return GW::Map::GetFoesToKill();
    }
    GWCA_API void* GetMapInfo(uint32_t map_id) {
        return GW::Map::GetMapInfo((GW::Constants::MapID)map_id);
    }
    GWCA_API bool GetIsInCinematic() {
        return GW::Map::GetIsInCinematic();
    }
    GWCA_API bool SkipCinematic() {
        return GW::Map::SkipCinematic();
    }
    GWCA_API bool EnterChallenge() {
        return GW::Map::EnterChallenge();
    }
    GWCA_API bool CancelEnterChallenge() {
        return GW::Map::CancelEnterChallenge();
    }
}
