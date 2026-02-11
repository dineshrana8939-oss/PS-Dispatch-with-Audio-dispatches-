-- ================================
-- Example: Police Chase Integration
-- ================================
-- Shows how to trigger dispatches for police pursuits
-- and other law enforcement scenarios

-- Example 1: Start of police pursuit
RegisterNetEvent('your-police:server:startPursuit', function(suspectId)
    local source = source -- The officer starting the pursuit
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    
    -- Alert all police units of pursuit
    exports['ps-dispatch-audio']:SendDispatch('10-99', coords, streetName)
end)

-- Example 2: Shots fired during incident
RegisterNetEvent('your-police:server:shotsDetected', function(shooterCoords)
    local streetHash = GetStreetNameAtCoord(shooterCoords.x, shooterCoords.y, shooterCoords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    
    -- High priority shots fired
    exports['ps-dispatch-audio']:SendDispatch('10-71', shooterCoords, streetName)
end)

-- Example 3: Officer panic button (officer down)
RegisterNetEvent('your-police:server:panicButton', function()
    local source = source
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    
    -- PRIORITY: Officer needs help!
    exports['ps-dispatch-audio']:SendDispatch('10-90', coords, streetName)
end)

-- Example 4: Vehicle theft report
RegisterNetEvent('your-carlock:server:reportTheft', function(vehicleCoords)
    local streetHash = GetStreetNameAtCoord(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    
    exports['ps-dispatch-audio']:SendDispatch('10-65', vehicleCoords, streetName)
end)

-- Example 5: Automatic dispatch from NPC calls
-- This could be triggered by various events like robberies, fights, etc.
function TriggerNPCCall(coords, callType)
    local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    
    local dispatchCode = '10-10' -- Default to fight
    
    if callType == 'fight' then
        dispatchCode = '10-10'
    elseif callType == 'suspicious' then
        dispatchCode = '10-60'
    elseif callType == 'robbery' then
        dispatchCode = '10-31'
    end
    
    exports['ps-dispatch-audio']:SendDispatch(dispatchCode, coords, streetName)
end

-- Export the function for other scripts to use
exports('TriggerNPCCall', TriggerNPCCall)
