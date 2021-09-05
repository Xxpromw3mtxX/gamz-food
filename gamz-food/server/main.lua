local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("gamz-food:removeMoney")
AddEventHandler("gamz-food:removeMoney", function(money, prop, type)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local pMoney = xPlayer.getAccount('money').money 
    
    if pMoney >= money then
        xPlayer.removeAccountMoney('money', money)
        TriggerClientEvent('gamz-food:consumeFood', src, prop, type)
    else
        xPlayer.showNotification("Non hai abbastanza soldi!")
    end
end)