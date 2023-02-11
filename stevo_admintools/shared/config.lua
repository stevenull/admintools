Config  = {}

Config.Reports = {
    
    --- Main
    Cooldown = 30000, -- Set this to 0 to not have a report cooldown
    CooldownActiveTitle = 'Cooldown Active',
    CooldownActive = 'You must wait before making another report!',

    --- Menus
    PlayerMenuTitle = 'Report a Player 👦',
    BugMenuTitle = 'Report a Bug 🐞',
 
    --- Notifications   
    NoTypeTitle = 'Invalid Entry', 
    NoType = 'You must select a Report Type!',
    NoPlayerIDTitle = 'Invalid Entry',
    NoPlayerID = 'You must include a valid player id!',
    NoReasonTitle = 'Invalid Entry',
    NoReason = 'You must include a reason in your player report!',
    SuccessPlayerReportTitle = 'Report Successfull',
    SuccessPlayerReport = 'Your report has been sent to our Staff Team, they will be with you shortly!',
    FailedPlayerReportTitle = 'Report Failed',
    FailedPlayerReport = 'The player you reported is not online, ensure you have the correct id!',
    SuccessBugReportTitle = 'Report Successfull',
    SuccessBugReport = 'Your report has been sent to our Development Team, they will investigate the issue as soon as possible!',
    NoBugTitle = 'Invalid Entry',
    NoBug = 'You must provide a description of the bug you experienced!',
    NoDoingTitle = 'Invalid Entry',
    NoDoing = 'You must provide a valid description of what you were doing when you experienced the bug!',
    PlayerReportRoles = '<@&put role id here>',
    PlayerReportWebhook = 'PUT WEBHOOK HERE',
    BugReportRoles = '<@&put role id here>', 
    BugReportWebhook = 'PUT WEBHOOK HERE',
}

Config.Warnings = {
    
    --- Menus
    ReportReceiveTitle = '⚠️ Warning ⚠️',
    ReportReceiveDesc = 'You have received a Warning from a Staff member for ',
    RequiredGroup = 'group.admin', -- Put your staff group here
    --- Notifications   
    NoPlayerIDTitle = 'Invalid Entry',
    NoPlayerID = 'You must include a valid player id!',
    NoReasonTitle = 'Invalid Entry',
    NoReason = 'You must include a reason to warn the player!',
    NoConfirmTitle = 'Invalid Entry',
    NoConfirm = 'You must confirm the warning!',
}

