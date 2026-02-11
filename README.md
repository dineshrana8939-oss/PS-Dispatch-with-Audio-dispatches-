# PS-Dispatch with Audio Dispatch Alerts

A free, open-source dispatch system for FiveM with custom audio alerts. This is a modified version of PS-Dispatch with added audio notifications for dispatch calls.

## 📢 Credits

**Full credit to [Project Sloth](https://github.com/Project-Sloth) for the original PS-Dispatch system.** This is a community modification that adds audio alerts to make dispatch calls more immersive and accessible.

## ✨ Features

- 🔊 **Custom Audio Alerts** - Different audio files for different dispatch types (police, EMS, fire, priority)
- 📱 **Multiple Dispatch Types** - Pre-configured dispatch codes for various emergency situations
- 🗺️ **GPS Blips** - Automatic map blips for dispatch locations
- 🎮 **Framework Support** - Compatible with QBCore, ESX, and standalone
- 🔧 **Easy Configuration** - Simple config file to customize dispatch codes and audio
- 🎵 **InteractSound Support** - Works with InteractSound or native audio
- 👮 **Job-Based Dispatches** - Only sends alerts to appropriate emergency services
- 🧪 **Admin Test Commands** - Easy testing of all dispatch types

## 📋 Requirements

- FiveM Server
- (Optional) QBCore or ESX Framework
- (Optional) InteractSound for better audio support

## 🚀 Installation

1. **Download and Extract**
   - Download this resource
   - Extract to your FiveM server's `resources` folder
   - Rename folder to `ps-dispatch-audio` (optional but recommended)

2. **Add Audio Files**
   - Place your custom `.ogg` audio files in the `sounds/` directory
   - Required audio files:
     - `dispatch_police.ogg` - For police dispatches
     - `dispatch_ems.ogg` - For EMS dispatches
     - `dispatch_fire.ogg` - For fire dispatches
     - `dispatch_general.ogg` - For general dispatches
     - `dispatch_priority.ogg` - For high-priority dispatches

3. **Configure the Resource**
   - Edit `shared/config.lua` to customize:
     - Dispatch codes and descriptions
     - Audio file names
     - Job permissions
     - Blip settings

4. **Setup ACE Permissions**
   - Add to your `server.cfg`:
   ```
   add_ace group.admin command.ps-dispatch-test allow
   ```

5. **Add to Server.cfg**
   - Add to your `server.cfg`:
   ```
   ensure ps-dispatch-audio
   ```

6. **Optional: InteractSound Setup**
   - If using InteractSound, copy the audio files to:
     - `interact-sound/client/html/sounds/`
   - Or configure InteractSound according to its documentation

## 🎵 Creating Audio Files

You can create custom dispatch audio in several ways:

### Method 1: Text-to-Speech
Use online TTS tools to generate dispatch audio:
- Example text: "Attention all units, code 10-10, fight in progress"
- Recommended TTS: Google TTS, Amazon Polly, or ElevenLabs

### Method 2: Record Custom Audio
- Use a microphone to record custom dispatch alerts
- Add radio effects using audio editing software
- Export as .ogg format

### Method 3: Sound Effects
- Find free police/emergency dispatch sound effects online
- Websites like Freesound.org or Zapsplat.com

### Converting to .OGG Format

**Using Audacity (Free):**
1. Open your audio file in Audacity
2. File → Export → Export as OGG
3. Choose quality settings (96-128 kbps recommended)

**Using FFmpeg (Command Line):**
```bash
ffmpeg -i input.mp3 -c:a libvorbis -q:a 4 output.ogg
```

## 🎮 Usage

### For Developers - Triggering Dispatches

You can trigger dispatches from any server-side script:

```lua
-- Method 1: Using the export
exports['ps-dispatch-audio']:SendDispatch('10-10', {x = 100.0, y = 200.0, z = 30.0}, 'Main Street')

-- Method 2: Using the event
TriggerEvent('ps-dispatch-audio:server:SendDispatch', {
    code = '10-31',
    coords = {x = 100.0, y = 200.0, z = 30.0},
    street = 'Main Street'
})
```

### For Admins - Testing Dispatches

Use test commands to verify dispatches work correctly:

```
/ps-dispatch-test 10-10          # Test a specific dispatch code
/ps-dispatch-test 10-31          # Test store robbery
/ps-dispatch-test EMS-1          # Test medical emergency
```

**Note:** Test commands require ACE permission `command.ps-dispatch-test`

## ⚙️ Configuration

### Audio Settings
```lua
Config.UseAudioAlerts = true     -- Enable/disable audio alerts
Config.AudioVolume = 0.5          -- Volume (0.0 to 1.0)
```

### Adding Custom Dispatch Codes

Edit `shared/config.lua` to add new dispatch codes:

```lua
['10-99'] = {
    displayCode = '10-99',
    description = 'Officer in Pursuit',
    message = 'Officer in vehicle pursuit',
    job = 'police',              -- Job type: 'police', 'ems', or 'fire'
    blipSprite = 229,            -- Blip icon ID
    blipColor = 3,               -- Blip color
    audioType = 'police'         -- Audio type to play
}
```

### Configuring Jobs

Define which jobs receive which dispatch types:

```lua
Config.DispatchJobs = {
    ['police'] = {'police', 'sheriff', 'state'},
    ['ems'] = {'ambulance', 'doctor'},
    ['fire'] = {'fire'}
}
```

## 📊 Default Dispatch Codes

### Police Codes
- `10-10` - Fight in Progress
- `10-11` - Traffic Stop
- `10-31` - Robbery in Progress
- `10-32` - Store Robbery
- `10-33` - Bank Robbery
- `10-60` - Suspicious Person
- `10-65` - Grand Theft Auto
- `10-66` - Suspicious Vehicle
- `10-71` - Shots Fired
- `10-90` - Officer Down (Priority)
- `10-99` - Officer in Pursuit

### EMS Codes
- `EMS-1` - Medical Emergency
- `EMS-2` - Vehicle Accident
- `EMS-3` - Mass Casualty (Priority)

### Fire Codes
- `FIRE-1` - Structure Fire
- `FIRE-2` - Vehicle Fire

## 🔧 Troubleshooting

### Audio Not Playing
1. Verify `.ogg` files are in the `sounds/` folder
2. Check file names match `Config.AudioFiles` in config.lua
3. If using InteractSound, ensure files are also in InteractSound's sounds folder
4. Check `Config.UseAudioAlerts = true`

### Dispatches Not Received
1. Verify player has correct job (police, ems, fire)
2. Check job names in `Config.DispatchJobs` match your framework
3. Test with admin command: `/ps-dispatch-test 10-10`

### Blips Not Showing
1. Verify coordinates are valid
2. Check `Config.BlipTime` setting
3. Ensure blip sprites and colors are valid

## 🤝 Contributing

This is a free, community-driven project. Feel free to:
- Submit improvements and bug fixes
- Add new dispatch codes
- Share custom audio files
- Improve documentation

## 📜 License

This modification maintains the same license as the original PS-Dispatch by Project Sloth. 

## ⚠️ Disclaimer

This is a community modification for educational and non-commercial use. Many commercial dispatch systems exist with advanced features - this project aims to provide a free alternative for the FiveM community.

## 💬 Support

For issues and questions:
- Check the troubleshooting section above
- Review the configuration examples
- Test with admin commands first

---

**Remember:** Full credit goes to [Project Sloth](https://github.com/Project-Sloth) for the original PS-Dispatch system. This is just a community modification adding audio alerts.
