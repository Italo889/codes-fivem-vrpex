fx_version 'cerulean'
game 'gta5'

author 'italo889'
description 'Reset de aparência do personagem para correção de bugs'
version '1.0.0'

client_scripts {
    'client.lua'
}

server_scripts {
    '@vrp/lib/utils.lua',
    'server.lua'
}

dependency 'vrp'