# DiscordSync
A script that pushes notifications to your Discord Server. 

The config is located at `lua/dsync_config.lua`.

This script pushes noficiations (Warnings, Connections, Disconnections and Chat) to your discord server using discord's webhooks. The script is rather simple but works as planned, I do not plan on adding any more "modules" to the script however if you decide to do so, feel free to send a pull request. 

### Preview
![Discord](https://i.saturdaysheroes.me/img/PAqx.png)

### Example 
```lua
local function dSyncWarnings(target_ply, ply, reason)
    if !ply then return end 
    if !target_ply then return end 
    if dsync.config.warns == false then return end 

    http.Post(dsync.config.webhook, {content = "Player **"..target_ply:Nick().."** [`"..ply:SteamID64().."`] ".."has been warned by **"..ply:Nick().."** for **"..reason.."**", username = dsync.config.servername.." - Warns"})

end
hook.Add("AWarnPlayerWarned", "dsync_awarn", dSyncWarnings)
```
If you have minimal Lua knowledge you should be able to add your own things in with ease, if you're having problems you can add me but I don't promise to help. 

