-- Comando /kick [ID] [motivo]
RegisterCommand('kick', function(source, args)
    if source ~= 0 then
        local playerGroup = GetPlayerGroup(source)
        -- Verificar se é admin
        if playerGroup == 'admin' or playerGroup == 'mod' then
            local targetId = tonumber(args[1])
            local reason = table.concat(args, ' ', 2) or 'Sem motivo especificado'
            
            if targetId then
                DropPlayer(targetId, 'Você foi kickado. Motivo: ' .. reason)
                print(('Jogador %s kickado por %s'):format(targetId, GetPlayerName(source)))
            end
        end
    end
end, false)