ESX = nil
local TSE, CW = TriggerServerEvent, Citizen.Wait

Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  CW(250)
	end

	while ESX.GetPlayerData().job == nil do
	  CW(250)
  end
  
  ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local cDk, cDv = nil, nil

Citizen.CreateThread(function()
	while true do
		for _,dID in ipairs(Risky.DoorList) do
			if dID.doors then
				for k,v in ipairs(dID.doors) do
					if not v.object or not DoesEntityExist(v.object) then
						v.object = GetClosestObjectOfType(v.objCoords, 1.0, GetHashKey(v.objName), false, false, false)
					end
				end
			else
				if not dID.object or not DoesEntityExist(dID.object) then
					dID.object = GetClosestObjectOfType(dID.objCoords, 1.0, GetHashKey(dID.objName), false, false, false)
				end
			end
		end

		CW(2500)
	end
end)

local mD = 1.25

Citizen.CreateThread(function()
	CW(1000)
	while true do
		CW(7)
		local pC, aD = GetEntityCoords(GetPlayerPed(-1)), true

		for k,dID in ipairs(Risky.DoorList) do
			local ds

			if dID.doors then
				ds = #(pC - dID.doors[1].objCoords)
			else
				ds = #(pC - dID.objCoords)
			end

			if dID.distance then
				mD = dID.distance
			end
			if ds < 15 then
				aD = false
				if dID.doors then
					for _,v in ipairs(dID.doors) do
						FreezeEntityPosition(v.object, dID.locked)

						if dID.locked and v.objYaw and GetEntityRotation(v.object).z ~= v.objYaw then
							SetEntityRotation(v.object, 0.0, 0.0, v.objYaw, 2, true)
						end
					end
				else
					FreezeEntityPosition(dID.object, dID.locked)

					if dID.locked and dID.objYaw and GetEntityRotation(dID.object).z ~= dID.objYaw then
						SetEntityRotation(dID.object, 0.0, 0.0, dID.objYaw, 2, true)
					end
				end
			end

			if ds < mD then
				aD = false
				if dID.size then
					size = dID.size
				end

				local isAuthorized = IsAuthorized(dID)
				local hasKey = hasKey(dID)

				if isAuthorized then
					if dID.locked then
						dT = "~r~E~w~ - Locked"
					elseif not dID.locked then
						dT = "~g~E~w~ - Unlocked"
					end
				elseif hasKey then
					if dID.locked then
						dT = "~r~E~w~ - Locked"
					elseif not dID.locked then
						dT = "~g~E~w~ - Unlocked"
					end
				elseif not isAuthorized then
					if dID.locked then
						dT = "Locked"
					elseif not dID.locked then
						dT = "Unlocked"
					end
				end
				if dID.lck then
					if dID.locked then
						dT = "Unlock.."
					else
						dT = "Lock.."
					end
				end
				if Risky.ShadowedText then
					DrawText3Ds(dID.textCoords.x, dID.textCoords.y, dID.textCoords.z, dT)
				else
					ESX.Game.Utils.DrawText3D(dID.textCoords, dT, 0.55)
				end
				if IsControlJustReleased(0, 38) then
					if isAuthorized then
						setDoorlck(dID, k)
					elseif hasKey then
						setDoorlck(dID, k)
					end
				end
			end
		end

		if aD then
			CW(3000)
		end
	end
end)

RegisterNetEvent('risky-doorlock:StartHacking')
AddEventHandler('risky-doorlock:StartHacking', function()
	local ped = GetPlayerPed(-1)
	local pos = GetEntityCoords(ped)
	ESX.TriggerServerCallback('risky-doorlock:CheckInv', function(hasItem)
		for k, v in pairs(Risky.DoorList) do
			local dist = GetDistanceBetweenCoords(pos, Risky.DoorList[k].textCoords.x, Risky.DoorList[k].textCoords.y, Risky.DoorList[k].textCoords.z)
			if dist < 1.5 then
				if Risky.DoorList[k].hackable then
					if Risky.DoorList[k].locked then
						if hasItem then
							cDk, cDv = k, v
							TriggerEvent("utk_fingerprint:Start", Risky.Utk.Levels, Risky.Utk.Lifes, Risky.Utk.Time, function(outcome)
								if outcome == true then
									exports['mythic_notify']:SendAlert('success', 'You have hacked the door!')
									setDoorlck(cDv, cDk)
								elseif outcome == false then
									exports['mythic_notify']:SendAlert('error', 'You have failed to hack the door')
								end
							end)
						else
							exports['mythic_notify']:SendAlert('error', 'You need a '..Risky.Utk.Item..'..')
						end
					else
						exports['mythic_notify']:SendAlert('error', 'This door is unlocked')
					end
				else
					exports['mythic_notify']:SendAlert('error', 'This door requires a key')
				end
			end
		end
    end, Risky.Utk.Item)
end)

function IsAuthorized(dID)
	if ESX.PlayerData.job == nil then
		return false
	end

	for _,job in pairs(dID.authorizedJobs) do
		if job == ESX.PlayerData.job.name then
			return true
		end
	end

	return false
end

function hasKey(dID)
	local Inventory = ESX.GetPlayerData()["inventory"]

	for i = 1, #dID.key, 1 do
		for invId = 1, #Inventory do
			if Inventory[invId]["count"] > 0 then
				if dID.key[i] == Inventory[invId]["name"] then
					return true
				end
			end
		end
	end

	return false
end

function setDoorlck(dd, key)
	dd.lck = true
	openDoorAnim()
    SetTimeout(400, function()
		dd.lck = false
		dd.locked = not dd.locked
		TSE('risky-doorlock:updateEntity', key, dd.locked)
	end)
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        CW(5)
    end
end

function openDoorAnim()
    loadAnimDict("anim@heists@keycard@") 
    TaskPlayAnim( GetPlayerPed(-1), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
	SetTimeout(400, function()
		ClearPedTasks(GetPlayerPed(-1))
	end)
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('risky-doorlock:setEntity')
AddEventHandler('risky-doorlock:setEntity', function(dID, state)
	Risky.DoorList[dID].locked = state
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    TSE("risky_doorlock:setupDoors")
end)