local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

-- Evento para resetar a aparência do jogador
RegisterServerEvent("bvida")
AddEventHandler("bvida", function()
    local source = source
    
    -- Verificar se o jogador existe
    if source > 0 then
        -- Resetar aparência usando as funções vRP
        vRPclient._setCustomization(source, vRPclient.getCustomization(source))
        vRP.removeCloak(source)
    end
end)

