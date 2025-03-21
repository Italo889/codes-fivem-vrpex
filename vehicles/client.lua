-- Comando /reparar
RegisterCommand('reparar', function()
    TriggerServerEvent("checkPermission:reparar")
end)

-- Comando /dv
RegisterCommand('dv', function()
    TriggerServerEvent("checkPermission:dv")
end)

-- Comando /car
RegisterCommand('car', function(_, args)
    local model = args[1] or "adder"
    TriggerServerEvent("checkPermission:car", model)
end)

-- Evento para spawnar veículo
RegisterNetEvent("client:spawnVehicle")
AddEventHandler("client:spawnVehicle", function(model)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    
    if IsModelValid(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(10)
        end
        
        local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, GetEntityHeading(ped), true, false)
        TaskWarpPedIntoVehicle(ped, vehicle, -1)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    else
        TriggerEvent("Notify", "negado", "Modelo de veículo inválido!")
    end
end)