-- ================================
-- Example: Store Robbery Integration
-- ================================
-- This example shows how to integrate ps-dispatch-audio
-- with a store robbery script
--
-- Place this code in your robbery script's server-side file

-- Example 1: Basic dispatch trigger when robbery starts
RegisterNetEvent('your-robbery:server:startRobbery', function(storeId)
    local source = source
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    
    -- Get street name for better dispatch info
    local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    
    -- Send store robbery dispatch (10-32)
    exports['ps-dispatch-audio']:SendDispatch('10-32', coords, streetName)
    
    -- Or use the event method:
    -- TriggerEvent('ps-dispatch-audio:server:SendDispatch', {
    --     code = '10-32',
    --     coords = coords,
    --     street = streetName
    -- })
end)

-- Example 2: Dispatch with delay (for silent alarms)
RegisterNetEvent('your-robbery:server:triggerAlarm', function()
    local source = source
    
    -- Wait 30 seconds before alerting police (silent alarm delay)
    Citizen.SetTimeout(30000, function()
        local ped = GetPlayerPed(source)
        local coords = GetEntityCoords(ped)
        local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
        local streetName = GetStreetNameFromHashKey(streetHash)
        
        exports['ps-dispatch-audio']:SendDispatch('10-32', coords, streetName)
    end)
end)

-- Example 3: Different dispatch codes for different scenarios
RegisterNetEvent('your-robbery:server:escalate', function(weaponDrawn)
    local source = source
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    
    if weaponDrawn then
        -- Shots fired - use priority dispatch
        exports['ps-dispatch-audio']:SendDispatch('10-71', coords, streetName)
    else
        -- Regular robbery
        exports['ps-dispatch-audio']:SendDispatch('10-32', coords, streetName)
    end
end)
