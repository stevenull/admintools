
lib.addCommand(Config.Warnings.RequiredGroup, {'warnplayer'}, function(source, args)
    TriggerClientEvent('stevo_admintools:warnings:warnplayer', source)
end)


RegisterNetEvent("stevo_admintools:warnings:warningincoming")
AddEventHandler("stevo_admintools:warnings:warningincoming", function(TargetID, reason)
    local name = GetPlayerName(source)
    local ids = ExtractIdentifiers(TargetID)
    local gameLicense = ids.license;
    local discord = ids.discord;  

    if TargetID ~= nil and reason ~= nil then
        if GetPlayerIdentifiers(TargetID)[1] == nil then
            TriggerClientEvent('ox_lib:notify', source, {title = Config.Warning.FailedPlayerReportTitle, description = Config.Reports.FailedPlayerReport, type = 'error', duration= 8000})
        else
           TriggerClientEvent('stevo_admintools:warnings:receivewarning', TargetID, reason)
        end
    end
end)
