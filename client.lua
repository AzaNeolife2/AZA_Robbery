ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)


ConfHs0              = {}
ConfHs0.DrawDistance = 100
ConfHs0.Size         = {x = 5.0, y = 5.0, z = 1.0}
ConfHs0.Color        = {r = 255, g = 255, b = 255}
ConfHs0.Type         = -1

local position = {
        {x = 28.15,   y = -1339.37,  z = 29.48},
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(8)
        local coords, letSleep = GetEntityCoords(PlayerPedId()), true

        for k in pairs(position) do
            if (ConfHs0.Type ~= -1 and GetDistanceBetweenCoords(coords, position[k].x, position[k].y, position[k].z, true) < ConfHs0.DrawDistance) then
                DrawMarker(ConfHs0.Type, position[k].x, position[k].y, position[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, ConfHs0.Size.x, ConfHs0.Size.y, ConfHs0.Size.z, ConfHs0.Color.r, ConfHs0.Color.g, ConfHs0.Color.b, 100, false, true, 2, false, false, false, false)
                letSleep = false
            end
        end

        if letSleep then
            Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)

            for k in pairs(position) do

                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

                if dist <= 1.0 then
                    ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour commencer à derober.")
                    if IsControlJustPressed(1,51) then
                        TriggerEvent("aza:animandprogress")
                        --spawnCar("faggio")
                    end
                end
            end
        end
    end)

RegisterNetEvent('aza:animandprogress')
AddEventHandler('aza:animandprogress', function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
    exports['progressBars']:startUI(20000, "Vous êtes entrain de crocheter...")
    Citizen.Wait(20000)
    ClearPedTasksImmediately(PlayerPedId())
    TriggerServerEvent('aza:rob', math.random(0, 1000))
end) 


