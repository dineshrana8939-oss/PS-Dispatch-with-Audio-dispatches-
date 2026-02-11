-- ================================
-- Example: Medical Emergency Integration
-- ================================
-- This example shows how to trigger EMS dispatches
-- when a player goes down or needs medical help

-- Example 1: Player down (death/unconscious)
RegisterNetEvent('your-ambulance:server:playerDown', function()
    local source = source
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    
    -- Send medical emergency dispatch
    exports['ps-dispatch-audio']:SendDispatch('EMS-1', coords, streetName)
end)

-- Example 2: Vehicle accident
RegisterNetEvent('your-accident:server:carCrash', function(severity)
    local source = source
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    
    if severity == 'critical' then
        -- Mass casualty for severe crashes
        exports['ps-dispatch-audio']:SendDispatch('EMS-3', coords, streetName)
    else
        -- Regular accident
        exports['ps-dispatch-audio']:SendDispatch('EMS-2', coords, streetName)
    end
end)

-- Example 3: Player calls 911 for medical help
RegisterNetEvent('your-phone:server:call911Medical', function()
    local source = source
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    
    exports['ps-dispatch-audio']:SendDispatch('EMS-1', coords, streetName)
end)
