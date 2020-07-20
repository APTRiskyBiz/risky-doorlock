ESX = nil
local TCE = TriggerClientEvent
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('risky-doorlock:updateEntity')
AddEventHandler('risky-doorlock:updateEntity', function(dID, state)
	local src = source
	local Player = ESX.GetPlayerFromId(src)
	
	Risky.DoorList[dID].locked = state

	TCE('risky-doorlock:setEntity', -1, dID, state)
end)

ESX.RegisterServerCallback('risky-doorlock:CheckInv', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem(item)

	if xItem.limit ~= -1 and xItem.count >= xItem.limit then
		cb(false)
	else
		cb(true)
	end
end)

ESX.RegisterUsableItem(Risky.Utk.Item, function(source)
	TCE('risky-doorlock:StartHacking', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	--xPlayer.removeInventoryItem(Risky.Utk.Item, 1)
end)