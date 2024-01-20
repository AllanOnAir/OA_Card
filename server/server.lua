local QBCore = exports['qb-core']:GetCoreObject()




QBCore.Functions.CreateUseableItem('card_deck', function(source)
	local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("OA_Card:Ouverture", source)
end)

RegisterServerEvent("OA_Card:GiveCard", function (cards)
    local Player = QBCore.Functions.GetPlayer(source)
    for k,v in pairs(cards) do
        Player.Functions.AddItem("carte_"..v, 1)
    end
end)