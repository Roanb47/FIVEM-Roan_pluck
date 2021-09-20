ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


-----------------------METH-----------------
Meth = {}

spawnedmeth = 0

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
        sheesh = true
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Roan.Methfarm.x, Roan.Methfarm.y, Roan.Methfarm.z, true) < 30 then
            sheesh = false
			Methspawn()
		end
	end
    if sheesh then
        Wait(500)
    end
end)

Citizen.CreateThread(function()
    while true do 
        sheesh = true
        Wait(0)
        local coords = GetEntityCoords(PlayerPedId())
        local nearbyObject, nearbyID
		local playerPed = PlayerPedId()
        if not IsPedSittingInAnyVehicle(PlayerPedId()) then
            for i=1, #Meth, 1 do
                if GetDistanceBetweenCoords(coords, GetEntityCoords(Meth[i]), false) < 1.5 then
                    sheesh = false
                    DrawScriptText(GetEntityCoords(Meth[i]) + vector3(0.0, 0.0, 0.0), '~b~E~w~ - Meth verzamelen')
                    nearbyObject, nearbyID = Meth[i], i
                    if IsControlJustReleased(0, 38) then
						FreezeEntityPosition(playerPed, true)
                        RequestAnimDict("random@domestic")
                        while (not HasAnimDictLoaded("random@domestic")) do Wait(0) end
                        TaskPlayAnim(playerPed,"random@domestic","pickup_low",1.0,-1.0, 1500, 0, 1, true, true, true)
                        Wait(1500)
                        ClearPedTasksImmediately(playerPed)
                        FreezeEntityPosition(playerPed, false)
                        NuBezig = false
                        ESX.Game.DeleteObject(nearbyObject)
                        spawnedmeth = spawnedmeth - 1
                        TriggerServerEvent('roan-pluck:geefmeth')
                    end
                end
            end
        end
        if sheesh then
            Wait(500)
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(Meth) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function Methspawn()
	while spawnedmeth < 25 do
		Citizen.Wait(0)
		local weedCoords = GenerateWeedCoords()

		ESX.Game.SpawnLocalObject('prop_ld_jerrycan_01', weedCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(Meth, obj)
			spawnedmeth = spawnedmeth + 1
		end)
	end
end

function ValidateWeedCoord(plantCoord)
	if spawnedmeth > 0 then
		local validate = true

		for k, v in pairs(Meth) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Roan.Methfarm.x, Roan.Methfarm.y, Roan.Methfarm.z, false) > 40 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateWeedCoords()
	while true do
		Citizen.Wait(1)

		local methCoordX, methCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-90, 90)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-90, 90)

		methCoordX = Roan.Methfarm.x + modX
		methCoordY = Roan.Methfarm.y + modY

		local coordZ = GetCoordZ(methCoordX, methCoordY)
		local coord = vector3(methCoordX, methCoordY, coordZ)

		if ValidateWeedCoord(coord) then
			return coord
		end
	end
end

function GetCoordZ(x, y)
	local groundCheckHeights = { 48.0, 49.0, 50.0, 51.0, 52.0, 53.0, 54.0, 55.0, 56.0, 57.0, 58.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 43.0
end

------------------------------COKE--------------------

Coke = {}

spawnedcoke = 0

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
        sheesh = true
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Roan.Cokefarm.x, Roan.Cokefarm.y, Roan.Cokefarm.z, true) < 30 then
            sheesh = false
			Cokespawn()
		end
	end
    if sheesh then
        Wait(500)
    end
end)

Citizen.CreateThread(function()
    while true do 
        sheesh = true
        Wait(0)
        local coords = GetEntityCoords(PlayerPedId())
        local nearbyObject, nearbyID
		local playerPed = PlayerPedId()
        if not IsPedSittingInAnyVehicle(PlayerPedId()) then
            for i=1, #Coke, 1 do
                if GetDistanceBetweenCoords(coords, GetEntityCoords(Coke[i]), false) < 1.5 then
                    sheesh = false
                    DrawScriptText(GetEntityCoords(Coke[i]) + vector3(0.0, 0.0, 0.55), '~b~E~w~ - Coke verzamelen')
                    nearbyObject, nearbyID = Coke[i], i
                    if IsControlJustReleased(0, 38) then
						FreezeEntityPosition(playerPed, true)
                        RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
                        while (not HasAnimDictLoaded("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")) do Wait(0) end
                        TaskPlayAnim(playerPed,"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer", 8.0, -8, -1, 49, 0, 0, 0, 0)
                        Wait(1500)
                        ClearPedTasksImmediately(playerPed)
                        FreezeEntityPosition(playerPed, false)
                        NuBezig = false
                        ESX.Game.DeleteObject(nearbyObject)
                        spawnedcoke = spawnedcoke - 1
                        TriggerServerEvent('roan-pluck:geefcoke')
                    end
                end
            end
        end
        if sheesh then
            Wait(500)
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(Coke) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function Cokespawn()
	while spawnedcoke < 25 do
		Citizen.Wait(0)
		local cokecoords = Maakcokecoords()

		ESX.Game.SpawnLocalObject('prop_barrel_02a', cokecoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(Coke, obj)
			spawnedcoke = spawnedcoke + 1
		end)
	end
end

function Validatecokecoords(plantCoord)
	if spawnedcoke > 0 then
		local validate = true

		for k, v in pairs(Coke) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Roan.Cokefarm.x, Roan.Cokefarm.y, Roan.Cokefarm.z, false) > 40 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function Maakcokecoords()
	while true do
		Citizen.Wait(1)

		local cokeCoordX, cokeCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-90, 90)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-90, 90)

		cokeCoordX = Roan.Cokefarm.x + modX
		cokeCoordY = Roan.Cokefarm.y + modY

		local coordZ = GetCoordZ(cokeCoordX, cokeCoordY)
		local coord = vector3(cokeCoordX, cokeCoordY, coordZ)

		if Validatecokecoords(coord) then
			return coord
		end
	end
end

function DrawScriptText(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords["x"], coords["y"], coords["z"])

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)

    local factor = string.len(text) / 370

    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 65)
end