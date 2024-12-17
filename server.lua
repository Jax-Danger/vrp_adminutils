local AdminUtils = class("AdminUtils", vRP.Extension)

local function spawnCar(self)
  local user = vRP.users_by_source[source]
  if user then
    local prompt = user:prompt("Vehicle model name (e.g. adder) to spawn:", "")
    print(prompt) -- debug print
    if prompt == '' then
      return vRP.EXT.Base.remote._notify(user.source, "Invalid vehicle model name.")
    end
    print('we should be good now')
    local uvehicles = user:getVehicles()
    if uvehicles == nil then return print('uvechicles is nil') end
    --uvehicles[prompt] = 1
    -- print(json.encode(uvehicles))  debug print
    vRP.EXT.Garage.remote._spawnVehicle(user.source, prompt)
    vRP.EXT.Base.remote._notify(user.source, prompt .. " has been spawned.")
  end
end

local function toggleUI(self)
  local user = vRP.users_by_source[source]
  if not user then return print('error in admin utils.') end
  self.remote._toggleCoordsUI(user.source)
end

function AdminUtils:__construct()
  vRP.Extension.__construct(self)

  vRP.EXT.GUI:registerMenuBuilder("admin", function(menu)
    menu.title = "Admin"
    menu.css = {top = "75px", header_color = "rgba(0,125,255,0.75)"}

    menu:addOption("Spawn Vehicle", function(player)
      spawnCar(self)
      print('spawn vehicle option selected') -- debug print
    end)
  end)

  vRP.EXT.GUI:registerMenuBuilder("admin", function(menu)
    menu.title = "Admin"
    menu.css = {top = "75px", header_color = "rgba(0,125,255,0.75)"}

    menu:addOption("Toggle Coords UI", function(player)
      toggleUI(self)
      print('Toggled the coordinates UI') -- debug print
    end)
  end)
end

vRP:registerExtension(AdminUtils)
