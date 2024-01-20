local QBCore = exports['qb-core']:GetCoreObject()

-- Création de la liste de cartes que le joueur va ouvrir
local function getCards()
    local unboxed = {}
    local x = 0
    while x < 5 do
        local random = math.random(0, 1000)
        if random <= 500 then
            unboxed[x] = Cartes[1][math.random(1, #Cartes[1])]
        elseif random <= 750 then
            unboxed[x] = Cartes[2][math.random(1, #Cartes[2])]
        elseif random <= 900 then
            unboxed[x] = Cartes[3][math.random(1, #Cartes[3])]
        elseif random <= 1000 then
            unboxed[x] = Cartes[4][math.random(1, #Cartes[4])]
        end
        x = x+1
    end
    return unboxed
end
 
-- Ouvre l'UI et envoie les cartes au NUI
RegisterNetEvent("OA_Card:Ouverture", function ()
    local unboxed = getCards()
    SetNuiFocus(true, true);
    SendNUIMessage({
        type="openui",
        cards=unboxed
    })
    SetTimecycleModifier("hud_def_blur");
    SetTimecycleModifierStrength(1);
end)

-- Ferme l'UI et donne les cartes au serveur
RegisterNUICallback("closeui", function(data)
    SetNuiFocus(false, false);
    SetTimecycleModifier("default");
    SetTimecycleModifierStrength(0);
    TriggerServerEvent("OA_Card:GiveCard", data.cards)

end)

