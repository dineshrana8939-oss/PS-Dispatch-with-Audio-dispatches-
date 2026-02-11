# 🎧 Custom Audio Dispatch for PS-Dispatch

Hi everyone,

I’m not a coder and I’m still new to GitHub, but I wanted to experiment and try something using AI. Based on **PS-Dispatch**, I created a small modification that adds **custom audio dispatch** to the existing dispatch notifications.

---

## 🙏 Credits
I do **not** claim any ownership of PS-Dispatch.  
Full credit goes to **PS Sloth** for the original resource.  
This release only adds custom audio support on top of the existing system.

---

## ✨ Features
- Plays custom `.ogg` audio along with normal PS-Dispatch alerts  
- Easy to add your own dispatch sounds  
- Includes admin test commands for quick verification  
- Works with existing PS-Dispatch setup  

---

## 📦 Installation

### 1. Add the provided files
Add these files to your **test server first** and verify everything works.  
(Audio dispatch has been tested and is working.)

---

### 2. Add custom audio (InteractSound)
Place your `.ogg` files inside:

InteractSound/client/html/sounds

Then include the file names inside **fxmanifest.lua**

---

### 3. Add audio to PS-Dispatch
Place your `.ogg` files inside:

ps-dispatch/sounds

Then include the file names inside **fxmanifest.lua**

---

### 4. Configure sound name
Edit:

ps-dispatch/shared/config.lua

Change the sound name to match your `.ogg` file.

---

## 🧪 Testing

You can test **all dispatch audio at once** using admin commands,  
or test normally by triggering events in-game.

---

### 🔐 Enable Admin Test Commands

Add this line in **server.cfg**:

add_ace group.admin command.ps-dispatch-test allow

Make sure:
- You are **Admin**
- You are on the correct **duty job**
- Restart the server after adding permission

---

## 🎮 Test Commands

### 🚓 Officer / Emergency
/test_officerdown  
/test_backup  
/test_emsdown  
/test_officerdistress  
/test_civdown  
/test_civdead  

---

### 🔫 Gun / Vehicle / Basic Crime
/test_shotsfired  
/test_vehicleshots  
/test_vehicletheft  
/test_speeding  
/test_fight  
/test_hunting  
/test_carjacking  
/test_carboosting  

---

### 💰 Robberies / Heists
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

---

### ⚠️ Other Events
/test_drugsale  
/test_suspicious  
/test_prisonbreak  
/test_explosion  

---

## 👮 Alternative Testing (Without Admin)

You can also test using another player:

- Join as **Police (PD)** or **EMS**
- Trigger real in-game events (robbery, shots fired, distress, etc.)
- Audio dispatch should play automatically

---

## 📝 Notes
- Use **.ogg format only**
- Keep audio short and optimized
- File names must match exactly in config and fxmanifest
- This is a simple customization built on top of PS-Dispatch

---

## 🚀 Future Improvements (Optional)
- Auto audio mapping
- Priority-based dispatch sounds
- Radio-style effects
- Volume / distance control
- Full dispatch audio pack

Feel free to improve and expand this resource.

Enjoy 🎧🚓
