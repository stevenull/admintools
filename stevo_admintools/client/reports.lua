local cooldown = false


RegisterCommand('report', function()
    if cooldown == true then 
        lib.notify({title = Config.Reports.CooldownActiveTitle, description = Config.Reports.CooldownActive, type = 'error', duration= 8000})
    else
        local input = lib.inputDialog('Create a Report', {
            { type = 'select', label = 'Report Type', options = {
                { value = 'option1', label = 'Report a player' },
                { value = 'option2', label = 'Report a bug' },
            }},
        })
        
        if input then
            ReportType = input[1]
            if ReportType == 'option1' then
                TriggerEvent('stevo_admintools:reports:createplayer')
                cooldown = true
                Wait(Config.Reports.Cooldown)
                cooldown = false
            else 
                TriggerEvent('stevo_admintools:reports:createbug')
                cooldown = true
                Wait(Config.Reports.Cooldown)
                cooldown = false
            end
        end
        if not type then return lib.notify({title = Config.Reports.NoTypeTitle, description = Config.Reports.NoType, type = 'error', duration= 8000}) end
    end
end)

TriggerEvent('chat:addSuggestion', '/report', 'Create a Report', {
    { name="PRESS ENTER!", help="DO NOT TYPE ISSUE HERE!" },
})



AddEventHandler('stevo_admintools:reports:createplayer', function()
    local input = lib.inputDialog(Config.Reports.PlayerMenuTitle, {'Player ID', 'Reason'})
    if input then
        local TargetID = tonumber(input[1])
        local reason = input[2]
    
        if TargetID == nil then
            lib.notify({title = Config.Reports.NoPlayerIDTitle, description = Config.Reports.NoPlayerID, type = 'error', duration= 8000})
        elseif reason == nil then
            lib.notify({title = Config.Reports.NoReasonTitle, description = Config.Reports.NoReason, type = 'error', duration= 8000})
        else
            TriggerServerEvent("stevo_admintools:reports:playerincoming", TargetID, reason)
        end
    end
end)

AddEventHandler('stevo_admintools:reports:createbug', function()
    local input = lib.inputDialog(Config.Reports.BugMenuTitle, {'Describe the bug', 'What were you doing when it occured?', 'Where were you when it occured?'})

    if input then
        local bug = input[1]
        local whatdoing = input[2]
        local where = input[3]
    
        if bug == nil then
            lib.notify({title = Config.Reports.NoBugTitle, description = Config.Reports.NoBug, type = 'error', duration= 8000})
        elseif whatdoing == nil then
            lib.notify({title = Config.Reports.NoDoingTitle, description = Config.Reports.NoDoing, type = 'error', duration= 8000})
        else
            TriggerServerEvent("stevo_admintools:reports:bugincoming", bug, whatdoing, where)
        end
    end
end)



