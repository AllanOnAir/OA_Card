fx_version 'adamant'
games {'gta5'}

author 'AllanOnAir'
description ''
version '1.0'

ui_page 'html/index.html'

files {
    'html/img/*.png',
    'html/index.html',
    'html/style.css',
    'html/script.js',
}


client_scripts {
    'client/*.lua'
}

shared_scripts {
    'config/*.lua',
}

dependencies {
}

server_script 'server/*.lua'