RegisterNetEvent('stevo_admintools:warnings:warnplayer')
AddEventHandler('stevo_admintools:warnings:warnplayer', function()
    local input = lib.inputDialog('Warn player', {
        { type = "input", label = "Player ID", placeholder = "69" },
        { type = "input", label = "Warning Reason", placeholder = "Warning Reason... Hmm.." },
        { type = "checkbox", label = "Confirm Warning" },
    })
    if input then
        local TargetID = tonumber(input[1])
        local reason = input[2]
        local confirm = input[3]
    
        if TargetID == nil then
            
            lib.notify({title = Config.Warnings.NoPlayerIDTitle, description = Config.Warnings.NoPlayerID, type = 'error', duration= 8000})
        else
            if reason == nil then
                lib.notify({title = Config.Warnings.NoReasonTitle, description = Config.Warnings.NoReason, type = 'error', duration= 8000})
            elseif confirm == nil then
                lib.notify({title = Config.Warnings.NoConfirmTitle, description = Config.Warnings.NoConfirm, type = 'error', duration= 8000})
            else
                TriggerServerEvent("stevo_admintools:warnings:warningincoming", TargetID, reason)
            end
        end
    end
end)

RegisterNetEvent('stevo_admintools:warnings:receivewarning')
AddEventHandler('stevo_admintools:warnings:receivewarning', function(reason)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed,false)
    FreezeEntityPosition(vehicle, true)
    local alert = lib.alertDialog({        
        header = Config.Warnings.ReportReceiveTitle,
        content = ''..Config.Warnings.ReportReceiveDesc..' '..reason..'',
        centered = true,
        cancel = false
    })   
    print(alert)
    if alert == 'confirm' then
        FreezeEntityPosition(vehicle, false)
    end

end)


