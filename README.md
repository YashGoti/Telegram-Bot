# Telegram-Bot
If you want to automate recon using telegram chat, then here you go!!!

### Flow
* **getUpdates.sh   >** it will get target or command from your telegram chat with bot and process it, also from here you can run your automate recon script.
* **sendUpdates.sh >** it will send a notification to your telegram bot.
* **keys.txt       >** it contains your API_KEY and CHAT_ID for get and send update to your telegram bot.
* **logs.txt       >** from this file this script get updates or target or command.

### Implementation
```
git clone https://github.com/YashGoti/Telegram-Bot.git
cd Telegram-Bot
chmod +x getUpdates.sh sendUpdates.sh recon.sh ./Tools/subdomain.sh
Modify keys.txt
```

### Usage
* **$~/Telegram-Bot:** _watch -n 60 ./getUpdates.sh_ #This will get input from your chat with bot, also this screen will run every 60 sec or 1 min.
* Now go to your chat with bot and give a one domain to test.

### Special Thanks to
![@crashskull](https://twitter.com/crashskull)
