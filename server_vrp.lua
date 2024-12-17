local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

local vRP = Proxy.getInterface("vRP")


async(function()
  vRP.loadScript("vrp_adminutils", "server")		-- change vrp_AdminUtils to file name of mod
end)
