ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('aza:rob')
AddEventHandler('aza:rob', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.addMoney(prix)
	TriggerClientEvent('esx:showNotification', source, "~g~Vous avez finis de voler !")
	TriggerClientEvent('esx:showNotification', source, "Vous avez volé : ".. prix .."~g~$")


end)