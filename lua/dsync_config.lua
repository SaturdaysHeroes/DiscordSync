/*-----------------------------------------------------------
	Discord Sync

	Made by SaturdaysHeroes

-------------------------------------------------------------*/
dsync = {}
dsync.config = {}

-- Enter your discord webhook url here. 
dsync.config.webhook = ""

-- Should the script push notifications about players joining?
dsync.config.join = true 

-- Should the script push notifications about players leaving?
dsync.config.leave = true

-- Should the script send all chat to the discord?
dsync.config.chat = true

-- Should the script push notifications about players getting warned?
dsync.config.warns = true

-- What's your server's name? eg. "DarkRP", "TTT"
dsync.config.servername = "Test Server"