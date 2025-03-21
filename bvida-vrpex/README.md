# BVIDA - Corretor de Bugs para Personagens (vRPex)

## 📝 Descrição
**BVIDA** é um script simples mas extremamente útil para servidores FiveM que utilizam o framework vRPex. Ele corrige bugs visuais e problemas de animação no personagem através do comando `/bvida`, sem necessidade de relogar ou reiniciar o jogo.

## 🛠️ Funcionalidades
- Corrige bugs visuais comuns do personagem
- Reseta a aparência para corrigir objetos anexados indevidamente
- Resolve problemas de animações presas
- Remove efeitos visuais indesejados
- Restaura o visual do personagem sem afetar status (vida, colete)

## 📋 Requisitos
- Framework vRPex
- FiveM Server atualizado

## ⚙️ Instalação

### Método 1: Como resource independente
1. Faça upload da pasta `bvida-vrpex` para o diretório `resources` do seu servidor
2. Adicione `ensure bvida-vrpex` ao seu arquivo `server.cfg`
3. Reinicie seu servidor

### Método 2: Integração com vrp_player (recomendado)
1. Abra o arquivo `vrp_player/server.lua`
2. Adicione o seguinte código ao final do arquivo:
```lua
RegisterServerEvent("bvida")
AddEventHandler("bvida",function()
    local source = source
    vRPclient._setCustomization(source,vRPclient.getCustomization(source))
    vRP.removeCloak(source)
end)
```

3. Abra o arquivo `vrp_player/client.lua`
4. Adicione o seguinte código ao final do arquivo:
```lua
-- Comando bvida para corrigir bugs do personagem
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

RegisterCommand('bvida', function()
    -- Evitar múltiplas execuções simultâneas
    if isProcessing then
        TriggerEvent("Notify", "negado", "Aguarde o processo atual terminar!")
        return
    end

    if IsPlayerInBlockedAnimation() then
        TriggerEvent("Notify", "negado", "Não é possível usar o comando durante esta animação!")
        return
    end

    -- Marcar como processando
    isProcessing = true
    
    -- Acionar o evento no servidor
    TriggerServerEvent('bvida')
    
    -- Pequeno delay para evitar sobrecarga
    Citizen.SetTimeout(500, function()
        isProcessing = false
    end)
    
    TriggerEvent("Notify", "sucesso", "Personagem corrigido com sucesso!")
end)

-- Adicionar sugestão para o comando
TriggerEvent('chat:addSuggestion', '/bvida', 'Corrige bugs visuais do seu personagem')
```

5. Salve os arquivos e reinicie seu servidor

## 📝 Uso
No jogo, use o comando `/bvida` quando seu personagem estiver sofrendo com bugs visuais como:
- Objetos presos ao personagem
- Animações que não finalizam corretamente
- Problemas com roupas ou acessórios
- Outros bugs visuais

## 🔍 Solução de Problemas

### O comando não funciona
- Verifique se o script foi instalado corretamente
- Confira se há erros no console do servidor
- Certifique-se que o evento 'bvida' está registrado corretamente

### Erros relacionados ao vRP
- Confirme que está utilizando uma versão compatível do vRPex
- Verifique se os caminhos para os módulos vRP estão corretos
- Confirme se há outros scripts que podem estar conflitando

### Problemas com notificações
- O script usa o sistema de notificações padrão do vRP (Notify)
- Se você usa outro sistema, adapte as chamadas `TriggerEvent("Notify", ...)` para seu sistema

## 🤝 Contribuições
Contribuições são bem-vindas! Sinta-se à vontade para fazer um fork e enviar pull requests.

## 📜 Licença
Este projeto é distribuído sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

## 📞 Contato
Se precisar de ajuda, entre em contato pelo Discord: [Seu Discord]