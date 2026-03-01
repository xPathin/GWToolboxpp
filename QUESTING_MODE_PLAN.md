# Fix Questing Mode bugs

Three bugs reported: "Evaluation timed out", "no path available", and line color not changing.

## Bug 1: Evaluation timed out

**Root cause**: `CalculatePath` returns `0` when `!ReadyForPathing()` (line 297-298 of PathfindingWindow.cpp). When called right after zone change in `OnMapLoaded()`, the navmesh may not be ready yet. When it returns 0, the callback is never called, so candidates never get marked `calculated = true`, and evaluation times out.

**Fix**: Check `PathfindingWindow::ReadyForPathing()` before calling `BeginQuestingModeEvaluation()`. If not ready, set a flag and retry in `Update()` until pathing is ready.

In `QuestModule.cpp`:
- Add `bool questing_mode_evaluation_queued = false;` to state vars
- In `OnMapLoaded()`: instead of calling `BeginQuestingModeEvaluation()` directly, set `questing_mode_evaluation_queued = true`
- In `Update()`, before the timeout check: if `questing_mode_evaluation_queued && PathfindingWindow::ReadyForPathing()`, call `BeginQuestingModeEvaluation()` and clear the flag
- Same for the hotkey toggle and kQuestRemoved handler: queue instead of calling directly

## Bug 2: "no path available" on auto-navigate

**Root cause**: In `Update()`, `cqp->IsCalculating()` is true while path is being computed. We immediately call `StopAutoNavigate("no path available")` instead of waiting. This kills auto-navigate the moment the path recalculates (which happens every 100 units of movement).

**Fix**: Skip the auto-navigate movement while calculating, but don't stop it:
```cpp
if (!cqp || cqp->waypoints.empty()) {
    StopAutoNavigate("no path available");
}
else if (!cqp->IsCalculating()) {
    // ... movement logic
}
```

## Bug 3: Line color doesn't change

**Root cause**: `DrawMinimapLines()` bakes `GetQuestLineColor()` into `l->color` at draw time. It's only called when waypoints change (`UpdateUI()`). Toggling auto-navigate doesn't trigger a redraw, so the cached color stays stale.

**Fix**: When `auto_navigate_active` changes, force a redraw of the active quest's minimap lines:
- In WndProc after toggling auto-navigate: get the active quest's `CalculatedQuestPath` and call `DrawMinimapLines()` on it
- In `StopAutoNavigate()`: same, redraw the active quest path lines

## Files to modify

- `GWToolboxdll/Modules/QuestModule.cpp`: All three fixes

## Verification

- Toggle questing mode via hotkey after zone change; should select closest quest (no timeout)
- Toggle auto-navigate; minimap line should turn cyan-green immediately
- Stop auto-navigate; line should revert to normal color
- Character should keep following path even when path recalculates
