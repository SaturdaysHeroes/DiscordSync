## DiscordSync

**THIS CURRENTLY DOES NOT WORK DUE TO DISCORD BLOCKING GMOD'S USERAGENT**

This script pushes noficiations (Warnings, Connections, Disconnections and Chat) to your discord server using discord's webhooks. The script is rather simple but works as planned, I do not plan on adding any more "modules" to the script however if you decide to do so, feel free to send a pull request, you can find an example module below.

## Requirements
DiscordSync is based on Webhook, therefore you will need to create a webhook on discord in order to use this. 

## Preview
![Discord](https://i.saturdaysheroes.xyz/img/PAqx.png)

## Example 
```lua
local function dSyncWarnings(target_ply, ply, reason)
    if !ply then return end 
    if !target_ply then return end 
    if dsync.config.warns == false then return end 

    http.Post(dsync.config.webhook, {content = "Player **"..target_ply:Nick().."** [`"..ply:SteamID64().."`] ".."has been warned by **"..ply:Nick().."** for **"..reason.."**", username = dsync.config.servername.." - Warns"})

end
hook.Add("AWarnPlayerWarned", "dsync_awarn", dSyncWarnings)
```

