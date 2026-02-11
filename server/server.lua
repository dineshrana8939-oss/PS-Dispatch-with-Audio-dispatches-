local QBCore = nil
local ESX = nil

-- Framework Detection
Citizen.CreateThread(function()
    if GetResourceState('qb-core') == 'started' then
        QBCore = exports['qb-core']:GetCoreObject()
        print('^2[PS-Dispatch-Audio]^7 Server: QB-Core detected')
    elseif GetResourceState('es_extended') == 'started' then
        ESX = exports['es_extended']:getSharedObject()
        print('^2[PS-Dispatch-Audio]^7 Server: ESX detected')
    else
        print('^3[PS-Dispatch-Audio]^7 Server: No framework detected, running standalone')
    end
end)

-- Function to send dispatch to all eligible players
function SendDispatchToPlayers(dispatchData)
    local players = GetPlayers()
    local dispatchInfo = Config.DispatchCodes[dispatchData.code]
    
    if not dispatchInfo then
        print('^1[PS-Dispatch-Audio]^7 Invalid dispatch code: ' .. dispatchData.code)
        return
    end
    
    for _, playerId in ipairs(players) do
        local playerJob = GetPlayerJob(playerId)
        if playerJob and ShouldReceiveDispatch(playerJob, dispatchInfo.job) then
            TriggerClientEvent('ps-dispatch-audio:client:ReceiveDispatch', playerId, dispatchData)
        end
    end
end

-- Get player job (server-side)
function GetPlayerJob(source)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            return Player.PlayerData.job.name
        end
    elseif ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            return xPlayer.job.name
        end
    end
    return nil
end

-- Check if player should receive dispatch (server-side)
function ShouldReceiveDispatch(playerJob, dispatchJobType)
    if Config.DispatchJobs[dispatchJobType] then
        for _, job in pairs(Config.DispatchJobs[dispatchJobType]) do
            if playerJob == job then
                return true
            end
        end
    end
    return false
end

-- Main dispatch event
RegisterNetEvent('ps-dispatch-audio:server:SendDispatch', function(dispatchData)
    SendDispatchToPlayers(dispatchData)
end)

-- Export for other resources to trigger dispatches
exports('SendDispatch', function(code, coords, street)
    SendDispatchToPlayers({
        code = code,
        coords = coords,
        street = street or 'Unknown Location'
    })
end)

-- Admin test commands
local function RegisterTestCommands()
    for code, info in pairs(Config.DispatchCodes) do
        RegisterCommand('ps-dispatch-test-' .. string.lower(code), function(source, args, rawCommand)
            if source == 0 then
                print('^3[PS-Dispatch-Audio]^7 This command can only be used by players')
                return
            end
            
            -- Check if player is admin (requires ACE permission)
            if not IsPlayerAceAllowed(source, 'command.ps-dispatch-test') then
                TriggerClientEvent('chat:addMessage', source, {
                    color = {255, 0, 0},
                    multiline = true,
                    args = {'[PS-Dispatch]', 'You do not have permission to use this command'}
                })
                return
            end
            
            TriggerClientEvent('ps-dispatch-audio:client:TestDispatch', source, code)
        end, false)
    end
    
    -- Generic test command that takes a code as argument
    RegisterCommand('ps-dispatch-test', function(source, args, rawCommand)
        if source == 0 then
            print('^3[PS-Dispatch-Audio]^7 This command can only be used by players')
            return
        end
        
        -- Check if player is admin
        if not IsPlayerAceAllowed(source, 'command.ps-dispatch-test') then
            TriggerClientEvent('chat:addMessage', source, {
                color = {255, 0, 0},
                multiline = true,
                args = {'[PS-Dispatch]', 'You do not have permission to use this command'}
            })
            return
        end
        
        if not args[1] then
            TriggerClientEvent('chat:addMessage', source, {
                color = {255, 255, 0},
                multiline = true,
                args = {'[PS-Dispatch]', 'Usage: /ps-dispatch-test <code> (e.g., /ps-dispatch-test 10-10)'}
            })
            return
        end
        
        local code = args[1]
        -- Try both original case and uppercase for flexibility
        if not Config.DispatchCodes[code] then
            code = code:upper()
            if not Config.DispatchCodes[code] then
                TriggerClientEvent('chat:addMessage', source, {
                    color = {255, 0, 0},
                    multiline = true,
                    args = {'[PS-Dispatch]', 'Invalid dispatch code: ' .. args[1]}
                })
                return
            end
        end
        
        TriggerClientEvent('ps-dispatch-audio:client:TestDispatch', source, code)
    end, false)
end

-- Register commands on resource start
Citizen.CreateThread(function()
    -- Commands are registered immediately since config is loaded via shared_scripts
    RegisterTestCommands()
    print('^2[PS-Dispatch-Audio]^7 Test commands registered. Use /ps-dispatch-test <code> to test')
end)

print('^2[PS-Dispatch-Audio]^7 Server script loaded successfully')
