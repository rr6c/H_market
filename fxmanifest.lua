fx_version "cerulean"

game "gta5"

client_script {
    "lua/Client.lua", 
    "lua/Config.lua"
}

server_scripts{
    "@vrp/lib/utils.lua",
    "lua/Server.lua",
    "lua/Config.lua"
}

ui_page {
    'html/index.html'
}

files {
    'html/*.html',
    'html/*.js',
    'html/*.css',
    'html/img/*.*'
}