/*-----------------------------------------------------------
	Discord Sync

	Made by SaturdaysHeroes

-------------------------------------------------------------*/
if !SERVER then return end 

include("dsync_config.lua")

local function dSyncPJoin(ply)
    if !ply then return end 
    if dsync.config.join == false then return end
    
    http.Post(dsync.config.webhook, {content = "Player **"..ply:Nick().."** [`"..ply:SteamID64().."`] ".."has joined the server.", username = dsync.config.servername.." - Connections"})
end
hook.Add("PlayerInitialSpawn", "dsync_pjoin", dSyncPJoin)

local function dSyncPLeave(ply)
    if !ply then return end 
    if dsync.config.leave == false then return end

    http.Post(dsync.config.webhook, {content = "Player **"..ply:Nick().."** [`"..ply:SteamID64().."`] ".."has left the server.", username = dsync.config.servername.." - Disconnections"})
end
hook.Add("PlayerDisconnected", "dsync_pleave", dSyncPLeave)


local function dSyncChat(ply, text, team)
    if !ply then return end 
    if !text then return end 
    if dsync.config.chat == false then return end 

    http.Post(dsync.config.webhook, {content = "Player **"..ply:Nick().."** [`"..ply:SteamID64().."`]"..": "..text, username = dsync.config.servername.." - Chat"})
end
hook.Add("PlayerSay", "dsync_chat", dSyncChat)


local function dSyncWarnings(target_ply, ply, reason)
    if !ply then return end 
    if !target_ply then return end 
    if dsync.config.warns == false then return end 

    http.Post(dsync.config.webhook, {content = "Player **"..target_ply:Nick().."** [`"..ply:SteamID64().."`] ".."has been warned by **"..ply:Nick().."** for **"..reason.."**", username = dsync.config.servername.." - Warns"})

end
hook.Add("AWarnPlayerWarned", "dsync_awarn", dSyncWarnings)

