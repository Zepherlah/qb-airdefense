local QBCore = exports['qb-core']:GetCoreObject()
local JobName = {}

CreateThread(function()
    for k, v in pairs(Config.Zones) do
        if not v.Blip.enable then
            goto continue
        end

        local blip = AddBlipForRadius(v.pos, v.radius)
        SetBlipColour(blip, v.Blip.color)
        SetBlipAlpha(blip, v.Blip.alpha)

        ::continue::
    end
end)

local isSet = false

CreateThread(function()
    while true do    
        local sleep = 200
        local inDistance, zone = isInDistance()
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if inDistance and not isSet and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
            isSet = true
            SetEngineFailure(vehicle, zone)
        elseif not inDistance and isSet then
            isSet = false
        elseif inDistance and isSet and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
            SetEngineFailure(vehicle, zone, true)
        end
        Wait(sleep)
    end
end)


isInDistance = function()
    local playerCoords = GetEntityCoords(PlayerPedId())

    for k, v in pairs(Config.Zones) do
        local dist = #(v.pos - playerCoords)

        if dist <= v.radius then
            return true, v
        end
    end
    return false
end



function SetEngineFailure(vehicle, v, curDist)
    local Playerdata = QBCore.Functions.GetPlayerData()
    local hasItem = QBCore.Functions.HasItem('pilotlicense')
    local JobName = Playerdata.job.name 
    if JobName == 'police' or JobName == 'ambulance' or hasItem then
        return
    else
        if curDist then
            if GetVehicleClass(vehicle) == 16 or GetVehicleClass(vehicle) == 15 then
                SetVehicleEngineHealth(vehicle, 100)
                SetVehicleEngineOn(vehicle, false, true, true)
            end
        else
            
            local inDistance, zone = isInDistance()
            if not inDistance then return end
        
            if GetVehicleClass(vehicle) == 16 or GetVehicleClass(vehicle) == 15 then
                QBCore.Functions.Notify(v.Notify.msg:format(v.time), v.Notify.type, v.Notify.duration)
                Citizen.Wait(v.time * 1000)
                QBCore.Functions.Notify("5.", "error", 1000)
                Citizen.Wait(1000)
                QBCore.Functions.Notify("4.", "error", 1000)
                Citizen.Wait(1000)
                QBCore.Functions.Notify("3.", "error", 1000)
                Citizen.Wait(1000)
                QBCore.Functions.Notify("2.", "error", 1000)
                Citizen.Wait(1000)
                QBCore.Functions.Notify("1.", "error", 1000)
                Citizen.Wait(1000)
                local inDistance, zone = isInDistance()
                if not inDistance then 
                    return 
                else
                    local vehicleCoords = GetEntityCoords(vehicle)
                    AddExplosion(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, 5, 50.0, true, false, 1.0)
                    SetVehicleEngineHealth(vehicle, 500)
                    Citizen.Wait(v.timeLow * 1000)
                    SetVehicleEngineHealth(vehicle, 300)
                    Citizen.Wait(v.timeLow * 1000)
                    SetVehicleEngineOn(vehicle, false, true, true)                 
                end
            end
        end
    end
end




table.contains = function(t, value)
    for k, v in pairs(t) do
        if v == value then 
            return true
        end
    end
    return false
end
