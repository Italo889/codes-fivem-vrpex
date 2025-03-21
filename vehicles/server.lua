-- Servidor: server/permissions.lua
local vRP = Proxy.getInterface("vRP")

-- Comando /reparar
RegisterNetEvent("checkPermission:reparar")
AddEventHandler("checkPermission:reparar", function()
    local user_id = vRP.getUserId(source)
    if vRP.hasGroup(user_id, "Admin") or vRP.hasGroup(user_id, "Mod") then -- Grupos permitidos
        TriggerClientEvent("client:repararVehicle", source)
    else
        TriggerClientEvent("Notify", source, "negado", "Você não tem permissão!")
    end
end)

-- Comando /dv
RegisterNetEvent("checkPermission:dv")
AddEventHandler("checkPermission:dv", function()
    local user_id = vRP.getUserId(source)
    if vRP.hasGroup(user_id, "Admin") then
        TriggerClientEvent("client:deleteVehicle", source)
    else
        TriggerClientEvent("Notify", source, "negado", "Você não tem permissão!")
    end
end)

-- Comando /car
RegisterNetEvent("checkPermission:car")
AddEventHandler("checkPermission:car", function(model)
    local user_id = vRP.getUserId(source)
    if vRP.hasGroup(user_id, "Admin") then
        TriggerClientEvent("client:spawnVehicle", source, model)
    else
        TriggerClientEvent("Notify", source, "negado", "Você não tem permissão!")
    end
end)