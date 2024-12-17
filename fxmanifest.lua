--Main Information
fx_version "cerulean"
game "gta5"
lua54 'yes'

shared_script '@ox_lib/init.lua'

dependency "vrp"

server_script {
  "@vrp/lib/utils.lua",
  "server_vrp.lua",
}

client_script {
  "@vrp/lib/utils.lua",
  "client.lua",
}

-- NUI
ui_page 'nui/nui.html'

files{
  'nui/nui.html',
  'nui/script.js',
  'nui/style.css',
}
