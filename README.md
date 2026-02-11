Here is a single clean copy-paste GitHub description 👇

Custom Audio Dispatch for PS-Dispatch

Hi everyone,

I’m not a coder and I’m new to GitHub, but I wanted to experiment and try something using AI. Based on PS-Dispatch, I created a small modification that adds custom audio dispatch to the existing dispatch notifications.

Credits:
I do not claim any ownership of PS-Dispatch. Full credit goes to PS Sloth for the original resource. This release only adds custom audio support on top of the existing system.

What This Does

Plays custom .ogg audio along with normal PS-Dispatch alerts

Allows you to easily add your own dispatch sounds

Includes test commands for quick verification

Works with the existing PS-Dispatch setup

Installation

Add the provided files to your test server first and verify everything works. I have tested this and audio dispatch is working correctly.

Add your custom .ogg audio files inside:

InteractSound/client/html/sounds


Then add those file names in fxmanifest.lua

Do the same for PS-Dispatch sounds:

ps-dispatch/sounds


Add the file names in fxmanifest.lua

Configure the sound in:

ps-dispatch/shared/config.lua


Change the sound name to match your audio file.

Testing

You can test all dispatch audio using admin commands or by triggering events normally in-game.

Enable Admin Test Commands (server.cfg)

Add:

add_ace group.admin command.ps-dispatch-test allow


Make sure:

You are admin

You are on the correct duty job

Restart server after adding permission

Test Commands
Officer / Emergency
/test_officerdown
/test_backup
/test_emsdown
/test_officerdistress
/test_civdown
/test_civdead

Gun / Vehicle / Basic Crime
/test_shotsfired
/test_vehicleshots
/test_vehicletheft
/test_speeding
/test_fight
/test_hunting
/test_carjacking
/test_carboosting

Robberies / Heists
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

Other Events
/test_drugsale
/test_suspicious
/test_prisonbreak
/test_explosion

Alternative Testing (Without Admin)

You can also test using another player:

Join as Police (PD) or EMS

Trigger real in-game events (robbery, shots fired, distress, etc.)

Audio dispatch should play automatically

Notes

Use .ogg format only

Keep audio short and optimized

File names must match exactly in config and fxmanifest

This is a simple customization built on top of PS-Dispatch
