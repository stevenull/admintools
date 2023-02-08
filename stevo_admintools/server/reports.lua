

RegisterNetEvent("stevo_admintools:reports:playerincoming")
AddEventHandler("stevo_admintools:reports:playerincoming", function(TargetID, reason)
    local name = GetPlayerName(source)
    local ids = ExtractIdentifiers(TargetID)
    local gameLicense = ids.license;
    local discord = ids.discord;  

    if TargetID ~= nil and reason ~= nil then
        if GetPlayerIdentifiers(TargetID)[1] == nil then
            TriggerClientEvent('ox_lib:notify', source, {title = Config.Reports.FailedPlayerReportTitle, description = Config.Reports.FailedPlayerReport, type = 'error', duration= 8000})
        else
            TriggerClientEvent('ox_lib:notify', source, {title = Config.Reports.SuccessPlayerReportTitle, description = Config.Reports.SuccessPlayerReport, type = 'inform', duration= 8000})
            PlayerReport(10950426, 'Incoming report for '..GetPlayerName(source)..'', 'ㅤㅤ\n**REASON:** '..reason..'\n \n**RULE BREAKER:** ['..TargetID..'] '..GetPlayerName(TargetID)..'\n \n**REPORTER:** '..GetPlayerName(source)..'', '')           
        end
    end
end)


local webhook = Config.Reports.PlayerReportWebhook
function PlayerReport(color, name, message, footer)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "".. name .."",
              ["description"] = message,
              ["footer"] = {
                ["text"] = footer,
              },
          }
      }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ embeds = embed, content = Config.Reports.PlayerReportRoles}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent("stevo_admintools:reports:bugincoming")
AddEventHandler("stevo_admintools:reports:bugincoming", function(bug, what, where)
    local name = GetPlayerName(source)

    TriggerClientEvent('ox_lib:notify', source, {title = Config.Reports.SuccessBugReportTitle, description = Config.Reports.SuccessBugReport, type = 'inform', duration= 8000})
    PlayerReport(10950426, 'Incoming Bug Report By '..name..'', 'ㅤㅤ\n**Bug Description:** '..bug..'\n \n**Current Activity:** '..what..' \n \n**Where they were:** '..where..'', '')           
end)

local webhook = Config.BugReportWebhook
function BugReport(color, name, message, footer)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "".. name .."",
              ["description"] = message,
              ["footer"] = {
                ["text"] = footer,
              },
          }
      }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ embeds = embed, content = Config.Reports.BugReportRoles}), { ['Content-Type'] = 'application/json' })
end

function GetAllPlayers()
    local players = {}

    for _, i in ipairs(GetPlayers()) do
        table.insert(players, i)    
    end

    return players
end

function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    --Loop over all identifiers
    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)

        --Convert it to a nice table.
        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end
