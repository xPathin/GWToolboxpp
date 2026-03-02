#include <GWCA/stdafx.h>

#include <GWCA/GWCA.h>

#include <GWCA/Utilities/Debug.h>
#include <GWCA/Utilities/Hooker.h>
#include <GWCA/Utilities/Macros.h>
#include <GWCA/Utilities/Scanner.h>

#include <GWCA/Context/PreGameContext.h>
#include <GWCA/Context/GameContext.h>
#include <GWCA/Context/GameplayContext.h>
#include <GWCA/Context/WorldContext.h>
#include <GWCA/Context/PartyContext.h>
#include <GWCA/Context/CharContext.h>
#include <GWCA/Context/GuildContext.h>
#include <GWCA/Context/ItemContext.h>
#include <GWCA/Context/AgentContext.h>
#include <GWCA/Context/AccountContext.h>
#include <GWCA/Context/MapContext.h>
#include <GWCA/Context/TradeContext.h>

#include <GWCA/GameContainers/Hash.h>

#include <GWCA/Managers/Module.h>

#include <GWCA/Managers/UIMgr.h>
#include <GWCA/Managers/MapMgr.h>
#include <GWCA/Managers/ChatMgr.h>
#include <GWCA/Managers/ItemMgr.h>
#include <GWCA/Managers/StoCMgr.h>
#include <GWCA/Managers/AgentMgr.h>
#include <GWCA/Managers/GuildMgr.h>
#include <GWCA/Managers/PartyMgr.h>
#include <GWCA/Managers/TradeMgr.h>
#include <GWCA/Managers/CameraMgr.h>
#include <GWCA/Managers/EffectMgr.h>
#include <GWCA/Managers/RenderMgr.h>
#include <GWCA/Managers/PlayerMgr.h>
#include <GWCA/Managers/MemoryMgr.h>
#include <GWCA/Managers/MerchantMgr.h>
#include <GWCA/Managers/SkillbarMgr.h>
#include <GWCA/Managers/GameThreadMgr.h>
#include <GWCA/Managers/FriendListMgr.h>
#include <GWCA/Managers/EventMgr.h>
#include <GWCA/Managers/QuestMgr.h>

namespace GW
{
    static std::vector<Module *> modules;
    static uintptr_t base_ptr;
    static uintptr_t PreGameContext_addr;
    static uintptr_t GameplayContext_addr;
    static uintptr_t AvailableChars_addr;
    static bool _initialized = false;

    // Hash lookup table (256 entries, from .rdata)
    static const uint32_t hash_table[256] = {
        0x2EB3C21Du, 0xA6F1D482u, 0xBE24628Fu, 0x35699E30u, 0xC87EE224u, 0x04BA0097u, 0x791F0EAFu, 0xA162D466u,
        0x685B376Au, 0xF82133BAu, 0x4682D46Bu, 0xCB25C0C5u, 0xAC3F9D22u, 0xABF17202u, 0xEF987728u, 0x3E400B83u,
        0x63003108u, 0xD83F1C93u, 0x5058F507u, 0x032E9991u, 0x3518BC24u, 0x1F90D44Bu, 0x92508DCEu, 0x42DAA15Cu,
        0x5B4105A3u, 0x4D5026ADu, 0x07F838B0u, 0xE8C4D2A2u, 0xF9EF4F54u, 0x1FC1A85Fu, 0xB9041A40u, 0x446F6969u,
        0xACF1EE39u, 0x1828CC65u, 0xC2F6C59Du, 0x2456C3C0u, 0x64F70142u, 0x9C8ADB42u, 0xC76781BFu, 0x6AEA07E3u,
        0xE98B14BFu, 0x7DBCB35Eu, 0x6CE78C80u, 0x1E3F93DEu, 0x0954FEB7u, 0xB3103AEFu, 0x6DAAC1EEu, 0x6535E301u,
        0x4A221E68u, 0x819CDD81u, 0x5378CE3Bu, 0xE7348236u, 0x2C3A7BCCu, 0x31C50234u, 0x745319DAu, 0xF0897A0Bu,
        0x5C182968u, 0x48E018F4u, 0x593E3BB6u, 0xAB588C8Du, 0xF1101F1Fu, 0x1D36E8BCu, 0xABC7C7C9u, 0xF58AA6C8u,
        0xF75B4B98u, 0xC447B576u, 0x6E5290F2u, 0xD344EDF8u, 0x5E1BCAF1u, 0xEE892405u, 0x798F7609u, 0x8905CC29u,
        0x8977DEDCu, 0x007850BCu, 0x0AA3114Au, 0x2F61C8F2u, 0x376DFAA4u, 0x0BABFC12u, 0x98E64E82u, 0xE6743711u,
        0xE26B26B6u, 0xCBB10C72u, 0x87446F8Fu, 0x96E26C0Du, 0xCF140831u, 0x81F69B0Bu, 0x5C9DF30Bu, 0xB276F929u,
        0x2712C5B6u, 0x80EA90D6u, 0x8EB30322u, 0xCF7A705Au, 0x57A17E8Cu, 0x556A2425u, 0x15104549u, 0x5F3D549Fu,
        0x5D98FDEEu, 0x9D8FA73Eu, 0x9206C9EFu, 0xEDA0541Du, 0xA3164F2Du, 0x04C83543u, 0x9BB27230u, 0xEE97F0BAu,
        0xB6AEB38Cu, 0x41FF4DA7u, 0x4023EE54u, 0xECBB78BCu, 0xC2C54733u, 0x8850B63Fu, 0x93BF56EFu, 0xC80177D7u,
        0xE68B0C13u, 0x3C1E9D4Cu, 0x5CB3EACCu, 0xF16F5795u, 0xAC2B8A5Cu, 0x952E466Eu, 0x3095B0D5u, 0xEC9D3A43u,
        0x23D8FCF7u, 0x10C7A93Fu, 0x1B479FB5u, 0x3664CF8Fu, 0xA514A56Bu, 0xE16C4886u, 0x63828188u, 0xA47F14C1u,
        0x391C237Cu, 0xFB15911Fu, 0x29825A01u, 0xFC66DA40u, 0xB2719F4Eu, 0x7B0D1611u, 0x8F1EE7DEu, 0xA6A1E77Du,
        0xDFC25D30u, 0x76377036u, 0x8145DB82u, 0x2300A4E9u, 0xA2417F88u, 0x1B8C6AFCu, 0x68EBDC8Eu, 0x48FC0C41u,
        0x040C3DCDu, 0x17F02C44u, 0xCC40B026u, 0x5089EE1Eu, 0x2A594C28u, 0x0CC198ECu, 0x3F676F3Du, 0xCD0AA239u,
        0x274A31A4u, 0xC6B4D4FAu, 0x9480A62Fu, 0xAF8862EFu, 0x627CA44Du, 0x572E89D3u, 0x4C05136Cu, 0x60F36E8Cu,
        0x7DE31FEFu, 0x1B97FED3u, 0xED99E2BFu, 0xA034D418u, 0xBBDB3E04u, 0x1F198B71u, 0xED45E889u, 0xF7F1B0DCu,
        0x1592B9A5u, 0x96D60F96u, 0x03D616EEu, 0xA5EF679Du, 0x831D791Du, 0x579D5FD1u, 0x4B44DC48u, 0x38F7A2F0u,
        0x2BF34A28u, 0xAF14318Cu, 0xBD66D20Au, 0x9AC72D2Au, 0xC41ADB95u, 0x860B2205u, 0xE0E580E7u, 0x3A06669Cu,
        0x2D1A40A2u, 0x577EDF60u, 0x1A37693Au, 0x3E576C35u, 0xE3857565u, 0xE46E75EEu, 0x94E3625Du, 0x7D1B9280u,
        0x2A0CCCE1u, 0xBAB36163u, 0x66E4E087u, 0x940129BBu, 0x59C197CDu, 0xB0634139u, 0xBB2964E1u, 0x17207138u,
        0xD8BD3728u, 0xB324876Cu, 0x7C72FD04u, 0xBB5D9D82u, 0xD9B40236u, 0xC0045BF6u, 0xF85100EDu, 0x36493582u,
        0x8D0DF92Au, 0xC3328368u, 0xC202E412u, 0x7ADE0064u, 0xD01529C6u, 0x4445B2ADu, 0x0F6FC63Bu, 0xEF976FC5u,
        0x709EC6BEu, 0x69D31EA1u, 0x794BFEB4u, 0xB522DB95u, 0x700DE6DFu, 0x49098B71u, 0x38B7FA82u, 0x11EDDC04u,
        0x5BB21D9Fu, 0xB14BC6D4u, 0x3009D754u, 0x451F5F3Du, 0xFAA58575u, 0xFB190B0Du, 0x999DF79Fu, 0x6798A7AAu,
        0x0BC434FFu, 0x429E6C15u, 0xA1EA2298u, 0x55A57B81u, 0xD7D74B8Du, 0x8FECB38Bu, 0x658AD588u, 0xF0190227u,
        0xBE5D2B36u, 0x62C59613u, 0xC9FEDD64u, 0xADD07A1Eu, 0x757A7679u, 0xD78B6DCCu, 0x56F88B2Cu, 0x4CC020BBu,
        0xA88B51FEu, 0xF47F7691u, 0x48587EDDu, 0x3FCEC5DBu, 0xA7E127ACu, 0x561F6161u, 0x37AB9607u, 0xFE23282Bu,
    };

    // Hash seed (from .data section)
    static uint32_t hash_seed = 0x325D1EAEu;

    // Wide string hash table (16 entries, from .rdata)
    static const uint32_t hash_wtable[16] = {
        0x92B9A528u, 0x25D4FC88u, 0xEDCBEFB8u, 0x51063A80u,
        0x91341C61u, 0x0261229Du, 0x726F48EDu, 0xCE1C088Cu,
        0x76253EB5u, 0x31E3A0DEu, 0xA2AAD215u, 0xCA7D6D27u,
        0xA5F98970u, 0x0541C365u, 0x3C14FF04u, 0x5056AF4Fu,
    };

    // Wide string hash seed components (from .data)
    static uint32_t hash_wseed_a = 0xE2C15C9Du;
    static uint32_t hash_wseed_b = 0x2170A28Au;

    bool Initialize()
    {
        if (_initialized) return true;
        modules.push_back(&GameThreadModule);
        modules.push_back(&UIModule);
        modules.push_back(&MapModule);
        modules.push_back(&ChatModule);
        modules.push_back(&ItemModule);
        modules.push_back(&StoCModule);
        modules.push_back(&AgentModule);
        modules.push_back(&GuildModule);
        modules.push_back(&PartyModule);
        modules.push_back(&TradeModule);
        modules.push_back(&CameraModule);
        modules.push_back(&EffectModule);
        modules.push_back(&PlayerModule);
        modules.push_back(&RenderModule);
        modules.push_back(&MerchantModule);
        modules.push_back(&SkillbarModule);
        modules.push_back(&FriendListModule);
        modules.push_back(&EventMgrModule);
        modules.push_back(&QuestModule);

        Scanner::Initialize();

        // We could get it from thread ctx
        uintptr_t address = Scanner::Find("\x50\x6A\x0F\x6A\x00\xFF\x35", "xxxxxxx", +7);

        if (Verify(address))
            base_ptr = *(uintptr_t *)address;
        GWCA_INFO("[SCAN] base_ptr = %p, %p", (void *)base_ptr);

        Hook::Initialize();

        address = Scanner::FindAssertion("p:\\code\\gw\\ui\\uipregame.cpp", "!s_scene", 0, 0x34);
        if (Verify(address))
            PreGameContext_addr = *(uintptr_t*)address;
        GWCA_INFO("[SCAN] PreGameContext_addr = %p", PreGameContext_addr);

        // GameplayContext pointer
        address = Scanner::Find("\x85\xC0\x74\x50\x6A\x28", "xxxxxx", -4);
        if (Verify(address))
            GameplayContext_addr = *(uintptr_t*)address;
        GWCA_INFO("[SCAN] GameplayContext_addr = %p", GameplayContext_addr);

        // AvailableChars pointer (pregame character list)
        address = Scanner::Find("\x8B\x45\x0C\x56\x8B\x35", "xxxxxx", +6);
        if (Verify(address))
            AvailableChars_addr = *(uintptr_t*)address;
        GWCA_INFO("[SCAN] AvailableChars_addr = %p", AvailableChars_addr);

        for (const Module* module : modules) {
            GWCA_INFO("\nInitializing module '%s'\n", module->name);
            if (module->init_module)
                module->init_module();
        }

        Hook::EnableHooks();
        for (const Module* module : modules) {
            if (module->enable_hooks)
                module->enable_hooks();
        }

        _initialized = true;
        return true;
    }

    void EnableHooks()
    {
        if (!_initialized) return;
        Hook::EnableHooks();
        for (const Module* module : modules) {
            if (module->enable_hooks)
                module->enable_hooks();
        }
    }

    void DisableHooks()
    {
        if (!_initialized) return;
        Hook::DisableHooks();
        for (const Module* module : modules) {
            if (module->disable_hooks)
                module->disable_hooks();
        }
    }

    void Terminate()
    {
        if (!_initialized) return;
        DisableHooks();
        for (const Module* module : modules) {
            if (module->exit_module)
                module->exit_module();
        }

        Hook::Deinitialize();
        _initialized = false;
    }

    GameContext* GetGameContext()
    {
        uintptr_t** base_context = base_ptr ? *(uintptr_t***)base_ptr : nullptr;
        return base_context ? (GameContext*)base_context[0x6] : nullptr;
    }
    PreGameContext* GetPreGameContext()
    {
        return *(PreGameContext**)PreGameContext_addr;
    }
    WorldContext* GetWorldContext()
    {
        const auto* g = GetGameContext();
        return g ? g->world : nullptr;
    }
    PartyContext* GetPartyContext()
    {
        const auto* g = GetGameContext();
        return g ? g->party : nullptr;
    }
    CharContext* GetCharContext()
    {
        const auto* g = GetGameContext();
        return g ? g->character : nullptr;
    }
    GuildContext* GetGuildContext()
    {
        const auto* g = GetGameContext();
        return g ? g->guild : nullptr;
    }
    ItemContext* GetItemContext()
    {
        const auto* g = GetGameContext();
        return g ? g->items : nullptr;
    }
    AgentContext* GetAgentContext()
    {
        const auto* g = GetGameContext();
        return g ? g->agent : nullptr;
    }
    MapContext* GetMapContext()
    {
        const auto* g = GetGameContext();
        return g ? g->map : nullptr;
    }
    AccountContext* GetAccountContext()
    {
        const auto* g = GetGameContext();
        return g ? g->account : nullptr;
    }
    TradeContext* GetTradeContext()
    {
        const auto* g = GetGameContext();
        return g ? g->trade : nullptr;
    }

    GameplayContext* GetGameplayContext()
    {
        if (!GameplayContext_addr) return nullptr;
        return *(GameplayContext**)GameplayContext_addr;
    }

    Array<CharacterInformation>* GetAvailableChars()
    {
        return (Array<CharacterInformation>*)AvailableChars_addr;
    }

    // Hash functions using static lookup table
    uint32_t Hash8(uint8_t data)
    {
        uint8_t initial = (uint8_t)(hash_seed >> 24);
        uint32_t h = hash_table[initial] ^ hash_table[data];
        h ^= (hash_seed >> 6);
        h += hash_seed;
        return h;
    }

    uint32_t Hash16(uint16_t data)
    {
        uint8_t initial = (uint8_t)(hash_seed >> 24);
        uint8_t lo = (uint8_t)data;
        uint8_t hi = (uint8_t)(data >> 8);

        uint32_t h = hash_table[initial] ^ hash_table[lo];
        h ^= (hash_seed >> 6);
        h += hash_seed;

        uint32_t r = hash_table[hi] ^ hash_table[h >> 24];
        r ^= (h >> 6);
        r += h;
        return r;
    }

    uint32_t Hash32(uint32_t data)
    {
        uint8_t initial = (uint8_t)(hash_seed >> 24);
        uint8_t b0 = (uint8_t)data;
        uint8_t b1 = (uint8_t)(data >> 8);
        uint8_t b2 = (uint8_t)(data >> 16);
        uint8_t b3 = (uint8_t)(data >> 24);

        uint32_t h = hash_table[initial] ^ hash_table[b0];
        h ^= (hash_seed >> 6);
        h += hash_seed;

        uint32_t r = hash_table[b1] ^ hash_table[h >> 24];
        r ^= (h >> 6);
        h += r;

        r = hash_table[b2] ^ hash_table[h >> 24];
        r ^= (h >> 6);
        h += r;

        r = hash_table[b3] ^ hash_table[h >> 24];
        r ^= (h >> 6);
        h += r;
        return h;
    }

    uint32_t Hash(const void* data, size_t size)
    {
        uint32_t h = hash_seed;
        if (!size) return h;
        const uint8_t* bytes = (const uint8_t*)data;
        for (size_t i = 0; i < size; i++) {
            uint32_t r = hash_table[bytes[i]] ^ hash_table[h >> 24];
            r ^= (h >> 6);
            h += r;
        }
        return h;
    }

    uint32_t HashWString(const wchar_t* str, uint32_t maxLength)
    {
        uint32_t h = hash_seed;
        uint32_t a = hash_wseed_a;
        uint32_t b = hash_wseed_b;
        for (uint32_t i = 0; i < maxLength; i++) {
            if (!str) break;
            wchar_t c = str[i];
            if (!c) break;
            // Uppercase a-z
            uint32_t ch = (uint32_t)c;
            uint32_t upper = ch - 0x20;
            if ((ch - 0x61) > 0x19)
                upper = ch;
            a = (a << 3) ^ upper;
            b += hash_wtable[a & 0xF];
            h ^= (b + a);
        }
        return h;
    }
} // namespace GW
