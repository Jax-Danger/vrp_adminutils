--##########	VRP Main	##########--
-- init vRP server context
Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
local cvRP = module("vrp", "client/vRP")
vRP = cvRP()
local pvRP = {}
-- load script in vRP context
pvRP.loadScript = module
Proxy.addInterface("vRP", pvRP)
--local cfg = module("vrp_adminutils", "cfg/cfg")

local AdminUtils = class("AdminUtils", vRP.Extension)

function AdminUtils:__construct()
  vRP.Extension.__construct(self)

  RegisterCommand("togglecoords",function()
    isUIVisible = not isUIVisible
    SendNUIMessage({
      type = 'toggleCoordsUI',
      data = not isUIVisible
    })
  end, false)

  -- This updates the player's position and heading every 250ms/ quarter second
  CreateThread(function()
    while true do
      Wait(250)

      local playerId        = PlayerPedId()
      local playerCoords    = GetEntityCoords(playerId)
      local playerheading   = GetEntityHeading(playerId)

      SendNUIMessage({
        type    = 'position',
        x       = playerCoords.x,
        y       = playerCoords.y,
        z       = playerCoords.z,
        heading = playerheading
      })
    end
  end)
end

local isUIVisible = false

function AdminUtils:toggleCoordsUI()
  isUIVisible = not isUIVisible
  print('Toggled the coordinates UI', isUIVisible) -- debug print
  SendNUIMessage({
    type = 'toggleCoordsUI',
    data = not isUIVisible
  })
end

AdminUtils.tunnel = {}
AdminUtils.tunnel.toggleCoordsUI = AdminUtils.toggleCoordsUI

vRP:registerExtension(AdminUtils)
