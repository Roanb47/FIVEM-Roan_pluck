ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('rocket-pluck:geefmeth')
AddEventHandler('rocket-pluck:geefmeth', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local amount = math.random(Rocket.Geefdrugs.min, Rocket.Geefdrugs.max)

    if xPlayer.getInventoryItem(Rocket.Items.meth).count < Rocket.Maxdrugs then
        xPlayer.addInventoryItem(Rocket.Items.meth, amount)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'Je hebt teveel meth opzak'})
    end
end)

RegisterServerEvent('rocket-pluck:geefcoke')
AddEventHandler('rocket-pluck:geefcoke', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local amount = math.random(Rocket.Geefdrugs.min, Rocket.Geefdrugs.max)

    if xPlayer.getInventoryItem(Rocket.Items.coke).count < Rocket.Maxdrugs then
        xPlayer.addInventoryItem(Rocket.Items.coke, amount)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'Je hebt teveel coke opzak'})
    end
end)