-- Variáveis locais
local isProcessing = false
local blockedAnimations = {
    { dict = "anim@heists@ornate_bank@grab_cash_heels", anim = "grab" },
    { dict = "oddjobs@shop_robbery@rob_till", anim = "loop" },
    { dict = "amb@world_human_sunbathe@female@back@idle_a", anim = "idle_a" }
}

-- Função para verificar se o jogador está em animações bloqueadas
local function IsPlayerInBlockedAnimation()
    local ped = PlayerPedId()
    for _, anim in ipairs(blockedAnimations) do
        if IsEntityPlayingAnim(ped, anim.dict, anim.anim, 3) then
            return true
        end
    end
    return false
end

-- Função para mostrar notificações
local function ShowNotification(type, message)
    -- Usando o sistema de notificação vRP
    TriggerEvent("Notify", type, message)
end

-- Função para resetar o personagem
local function ResetPlayer()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    if isProcessing then return end
    isProcessing = true

    -- Notificação inicial
    TriggerEvent('chat:addMessage', {
        color = {255, 223, 0},
        multiline = true,
        args = {"Sistema", "Iniciando processo de correção... Aguarde."}
    })
    
    -- Limpar todas as animações
    ClearPedTasksImmediately(playerPed)
    
    -- Resetar estado do personagem
    ClearPedBloodDamage(playerPed)
    ClearPedWetness(playerPed)
    ClearPedEnvDirt(playerPed)
    ResetPedMovementClipset(playerPed, 0.0)
    
    -- Preservar vida atual
    local health = GetEntityHealth(playerPed)
    local armor = GetPedArmour(playerPed)
    
    -- Pequeno delay para processar
    Citizen.Wait(500)
    
    -- Leve teleporte para "desgrudar" o personagem
    SetEntityCoordsNoOffset(playerPed, 
        playerCoords.x, 
        playerCoords.y, 
        playerCoords.z + 0.03, 
        false, false, false)
    
    -- Restaurar vida e colete
    Citizen.Wait(100)
    SetEntityHealth(playerPed, health)
    SetPedArmour(playerPed, armor)
    
    -- Notificação final
    Citizen.Wait(700)
    TriggerEvent('chat:addMessage', {
        color = {0, 255, 0},
        multiline = true,
        args = {"Sistema", "Processo de correção concluído!"}
    })
    
    isProcessing = false
end

-- Registrar o comando bvida
RegisterCommand('bvida', function()
    -- Evitar múltiplas execuções simultâneas (sem ser um cooldown)
    if isProcessing then
        ShowNotification("negado", "Aguarde o processo atual terminar!")
        return
    end

    if IsPlayerInBlockedAnimation() then
        ShowNotification("negado", "Não é possível usar o comando durante esta animação!")
        return
    end

    -- Marcar como processando
    isProcessing = true
    
    -- Acionar o evento no servidor
    TriggerServerEvent('bvida')
    
    -- Pequeno delay para evitar sobrecarga (não é um cooldown)
    Citizen.SetTimeout(500, function()
        isProcessing = false
    end)
    
    ShowNotification("sucesso", "Personagem corrigido com sucesso!")
end)

-- Adicionar sugestão para o comando
TriggerEvent('chat:addSuggestion', '/bvida', 'Corrige bugs visuais do seu personagem')