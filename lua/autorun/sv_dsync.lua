/*-----------------------------------------------------------
	Discord Sync

	Made by SaturdaysHeroes

-------------------------------------------------------------*/
if !SERVER then return end 

include("dsync_config.lua")

-- Used to remove any attempts at taggin people. We know how gmod trolls can be.
function dsync.Validate(msg)
	return string.gsub(msg, "%@", "")
end

-- Best to have a handler function. Easier for editing later down the line.
function dsync.Post(msg, cat)
	http.Post(dsync.config.webhook, {content = msg, username = dsync.config.servername.." - "..cat})
end

local function dSyncPJoin(ply)
    if !ply then return end 
    if dsync.config.join == false then return end
    
    dsync.Post("Player **"..dsync.Validate(ply:Nick()).."** [`"..ply:SteamID64().."`] ".."has joined the server.", "Connections")
end
hook.Add("PlayerInitialSpawn", "dsync_pjoin", dSyncPJoin)

local function dSyncPLeave(ply)
    if !ply then return end 
    if dsync.config.leave == false then return end

    dsync.Post("Player **"..dsync.Validate(ply:Nick()).."** [`"..ply:SteamID64().."`] ".."has left the server.", "Disconnections")
end
hook.Add("PlayerDisconnected", "dsync_pleave", dSyncPLeave)


local function dSyncChat(ply, text, team)
    if !ply then return end 
    if !text then return end 
    if dsync.config.chat == false then return end 

    dsync.Post("Player **"..dsync.Validate(ply:Nick()).."** [`"..ply:SteamID64().."`]"..": "..dsync.Validate(text), "Chat")
end
hook.Add("PlayerSay", "dsync_chat", dSyncChat)


local function dSyncWarnings(target_ply, ply, reason)
    if !ply then return end 
    if !target_ply then return end 
    if dsync.config.warns == false then return end 

    dsync.Post("Player **"..dsync.Validate(target_ply:Nick()).."** [`"..ply:SteamID64().."`] ".."has been warned by **"..dsync.Validate(ply:Nick()).."** for **"..dsync.Validate(reason).."**", "Warns")
end
hook.Add("AWarnPlayerWarned", "dsync_awarn", dSyncWarnings)

