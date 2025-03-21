-- Notificações para vRP
function TriggerNotify(type, msg)
    if type == "sucesso" then
        SetNotificationTextEntry("STRING")
        AddTextComponentString(msg)
        SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "Sucesso", "")
        DrawNotification(false, true)
    elseif type == "negado" then
        BeginTextCommandThefeedPost("STRING")
        AddTextComponentSubstringPlayerName(msg)
        EndTextCommandThefeedPostTicker(true, true)
    end
end

RegisterNetEvent("Notify")
AddEventHandler("Notify", function(type, title, msg)
    TriggerNotify(type, msg)
end)