
author "Stevo Scripts"
description "Admin Tools Including Reports & Warnings!"
version "1.0"

fx_version "cerulean"
game "gta5"
lua54 'yes'

shared_scripts { 
    '@ox_lib/init.lua',
    'shared/config.lua'
}

client_scripts {
    "client/*.lua"
}
server_scripts {
    "server/*.lua"
}

dependency "ox_lib"