-- Comando /revive (para médicos/admins)
RegisterCommand('revive', function()
    local playerPed = PlayerPedId()
    
    if IsPlayerAceAllowed(source, 'ems.revive') then
        NetworkResurrectLocalPlayer(GetEntityCoords(playerPed), true, true, false)
        ClearPedBloodDamage(playerPed)
        SetEntityInvincible(playerPed, false)
        ShowNotification('~b~Você foi revivido!')
    end
end, false)