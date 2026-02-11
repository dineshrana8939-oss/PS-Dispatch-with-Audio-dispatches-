# PS-Dispatch Audio - Installation Guide

## Quick Start Guide for Server Owners

### Step 1: Download and Install
1. Download the resource from GitHub
2. Place in your server's `resources` folder
3. Rename to `ps-dispatch-audio` (recommended)

### Step 2: Add Audio Files
You need to create or download 5 audio files in `.ogg` format:

1. **dispatch_police.ogg** - Plays for police-related calls
2. **dispatch_ems.ogg** - Plays for medical emergencies
3. **dispatch_fire.ogg** - Plays for fire-related calls
4. **dispatch_general.ogg** - Default fallback audio
5. **dispatch_priority.ogg** - Plays for high-priority emergencies

**Where to get audio:**
- Use Text-to-Speech (TTS) websites (Google TTS, Amazon Polly)
- Record your own with a microphone + radio effect
- Find free sound effects on Freesound.org

**Example TTS text:**
- "Attention all units, new dispatch alert"
- "Emergency services, code 10-10, respond"
- "Priority dispatch, all available units respond"

### Step 3: Configure Your Server

Add these lines to your `server.cfg`:

```cfg
# PS-Dispatch Audio
ensure ps-dispatch-audio

# Give admins access to test commands
add_ace group.admin command.ps-dispatch-test allow
```

### Step 4: Configure for Your Framework

Edit `shared/config.lua` and update the job names to match your server:

**For QBCore:**
```lua
Config.DispatchJobs = {
    ['police'] = {'police', 'sheriff', 'state'},
    ['ems'] = {'ambulance', 'ems'},
    ['fire'] = {'fire'}
}
```

**For ESX:**
```lua
Config.DispatchJobs = {
    ['police'] = {'police', 'sheriff'},
    ['ems'] = {'ambulance'},
    ['fire'] = {'fire'}
}
```

### Step 5: Optional - InteractSound Integration

If you have InteractSound installed:

1. Copy audio files to: `interact-sound/client/html/sounds/`
2. Restart InteractSound: `restart interact-sound`
3. Restart ps-dispatch-audio: `restart ps-dispatch-audio`

### Step 6: Test the System

1. Start your server
2. Join as an admin
3. Make sure you have a police/ems/fire job
4. Run test command: `/ps-dispatch-test 10-10`
5. You should see a notification and hear audio!

## Troubleshooting

### ❌ "Audio not playing"
- Check audio files are in `sounds/` folder
- Verify files are named exactly as config (dispatch_police.ogg, etc.)
- Make sure files are `.ogg` format (not .mp3 or .wav)
- Check `Config.UseAudioAlerts = true` in config.lua

### ❌ "Not receiving dispatches"
- Verify your character has the correct job
- Check job names in config match your framework
- Use `/ps-dispatch-test 10-10` to test

### ❌ "Command not working"
- Verify ACE permission in server.cfg: `add_ace group.admin command.ps-dispatch-test allow`
- Restart server after adding ACE permission
- Make sure you're in the admin group

### ❌ "Blip not showing on map"
- Check coordinates are valid
- Verify `Config.BlipTime` is set (default 30 seconds)
- Blip should appear at your current location during tests

## Integration with Other Scripts

To trigger dispatches from your custom scripts:

```lua
-- In any server-side script
exports['ps-dispatch-audio']:SendDispatch('10-31', coords, streetName)

-- Or using event
TriggerEvent('ps-dispatch-audio:server:SendDispatch', {
    code = '10-31',
    coords = {x = 100.0, y = 200.0, z = 30.0},
    street = 'Main Street'
})
```

### Example: Robbery Script Integration

```lua
-- In your robbery script (server-side)
RegisterNetEvent('myrob:server:startRobbery', function()
    local source = source
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
    
    -- Trigger dispatch
    exports['ps-dispatch-audio']:SendDispatch('10-32', coords, street)
end)
```

## Creating Custom Dispatch Codes

1. Open `shared/config.lua`
2. Add your new dispatch code to `Config.DispatchCodes`:

```lua
['10-69'] = {
    displayCode = '10-69',
    description = 'Your Custom Call',
    message = 'Your custom message here',
    job = 'police',              -- Who receives it
    blipSprite = 58,             -- Icon on map
    blipColor = 1,               -- Color of blip
    audioType = 'police'         -- Which audio to play
}
```

3. Restart the resource: `restart ps-dispatch-audio`
4. Test it: `/ps-dispatch-test 10-69`

## Need Help?

- Read the main README.md for full documentation
- Check configuration examples in `shared/config.lua`
- Test commands work even without audio files (for testing logic)

---

**Note:** This is a free community resource. For advanced features, consider exploring paid alternatives or contributing improvements to this project!
