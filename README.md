Hi everyone,

I am not a coder and I am new to GitHub, but I wanted to experiment with AI and try something different. Based on PS-Dispatch, I have added custom audio dispatch support so that audio alerts play along with the existing dispatch notifications.

Credits:
All original credit goes to PS Sloth for creating PS-Dispatch.
This is only a small modification adding custom audio functionality.

------------------------------------------------------------

What This Adds:
- Custom .ogg audio plays together with normal PS-Dispatch alerts
- Easy to add your own dispatch sounds
- Simple test commands included
- Works with existing PS-Dispatch system

------------------------------------------------------------

Installation / Setup:

1. Add the new files
Add the provided files to your test server first and verify everything works.
I have tested this and audio dispatch is working correctly.

2. Add your custom audio
Place your .ogg files in:
InteractSound/client/html/sounds

Then add the file names inside fxmanifest.lua

3. Do the same for PS-Dispatch sounds
Add your .ogg files inside:
ps-dispatch/sounds

Then include them in fxmanifest.lua

4. Configure the sound in PS-Dispatch
Go to:
shared/config.lua

Change the sound name to match your audio file.

5. Enable test commands (server.cfg)
Add this line:
add_ace group.admin command.ps-dispatch-test allow

Make sure you are admin and on the correct duty job before testing.

------------------------------------------------------------

Test Commands:

Officer / Emergency:
/test_officerdown
/test_backup
/test_emsdown
/test_officerdistress
/test_civdown
/test_civdead

Gun / Vehicle / Basic Crime:
/test_shotsfired
/test_vehicleshots
/test_vehicletheft
/test_speeding
/test_fight
/test_hunting
/test_carjacking
/test_carboosting

Robberies / Heists:
/test_storerobbery
/test_bankrobbery
/test_paletobank
/test_pacificbank
/test_vangelico
/test_houserobbery
/test_yachtheist
/test_artgallery
/test_humane
/test_trainrobbery
/test_vanrobbery
/test_undergroundrobbery
/test_drugboat
/test_unionrobbery
/test_signrobbery
/test_bobcat

Other Events:
/test_drugsale
/test_suspicious
/test_prisonbreak
/test_explosion

------------------------------------------------------------

Notes:
- Use .ogg format only for audio files
- Keep audio short and optimized for best performance
- Ensure file names match exactly in config and fxmanifest
- This is a basic modification intended for customization
