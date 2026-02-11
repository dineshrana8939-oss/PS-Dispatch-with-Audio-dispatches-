local QBCore = nil
local ESX = nil
local PlayerJob = nil
local ActiveDispatches = {}

-- Framework Detection
Citizen.CreateThread(function()
    if GetResourceState('qb-core') == 'started' then
        QBCore = exports['qb-core']:GetCoreObject()
        print('^2[PS-Dispatch-Audio]^7 QB-Core detected')
    elseif GetResourceState('es_extended') == 'started' then
        ESX = exports['es_extended']:getSharedObject()
        print('^2[PS-Dispatch-Audio]^7 ESX detected')
    else
        print('^3[PS-Dispatch-Audio]^7 No framework detected, running standalone')
    end
end)

-- Get Player Job
function GetPlayerJob()
    if QBCore then
        local PlayerData = QBCore.Functions.GetPlayerData()
        return PlayerData.job.name
    elseif ESX then
        local PlayerData = ESX.GetPlayerData()
        return PlayerData.job.name
    end
    return nil
end

-- Check if player should receive dispatch
function ShouldReceiveDispatch(jobType)
    local playerJob = GetPlayerJob()
    if not playerJob then return false end
    
    if Config.DispatchJobs[jobType] then
        for _, job in pairs(Config.DispatchJobs[jobType]) do
            if playerJob == job then
                return true
            end
        end
    end
    return false
end

-- Play Audio Alert
function PlayAudioAlert(audioType)
    if not Config.UseAudioAlerts then return end
    
    local audioFile = Config.AudioFiles[audioType] or Config.AudioFiles['general']
    
    -- Try InteractSound first
    if GetResourceState('interact-sound') == 'started' then
        TriggerServerEvent('InteractSound_SV:PlayOnSource', audioFile, Config.AudioVolume)
    else
        -- Fallback to native audio (if audio files are properly registered)
        SendNUIMessage({
            transactionType = 'playSound',
            transactionFile = audioFile,
            transactionVolume = Config.AudioVolume
        })
    end
end

-- Show Notification
function ShowNotification(title, message, type)
    if QBCore then
        QBCore.Functions.Notify(title .. ': ' .. message, type or 'primary', 5000)
    elseif ESX then
        ESX.ShowNotification(title .. ': ' .. message)
    else
        -- Fallback notification
        SetNotificationTextEntry('STRING')
        AddTextComponentString(title .. '\n' .. message)
        DrawNotification(false, true)
    end
end

-- Create Blip
function CreateDispatchBlip(data)
    local blip = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)
    SetBlipSprite(blip, data.blipSprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, Config.BlipScale)
    SetBlipColour(blip, data.blipColor)
    SetBlipAsShortRange(blip, false)
    SetBlipAlpha(blip, Config.BlipAlpha)
    
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(data.displayCode .. ' - ' .. data.description)
    EndTextCommandSetBlipName(blip)
    
    -- Store blip reference
    local blipId = #ActiveDispatches + 1
    ActiveDispatches[blipId] = blip
    
    -- Remove blip after configured time
    Citizen.SetTimeout(Config.BlipTime * 1000, function()
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
        ActiveDispatches[blipId] = nil
    end)
    
    return blip
end

-- Receive Dispatch Event
RegisterNetEvent('ps-dispatch-audio:client:ReceiveDispatch', function(dispatchData)
    local dispatchCode = dispatchData.code
    local coords = dispatchData.coords
    local street = dispatchData.street or 'Unknown Location'
    
    local dispatchInfo = Config.DispatchCodes[dispatchCode]
    if not dispatchInfo then
        print('^1[PS-Dispatch-Audio]^7 Unknown dispatch code: ' .. dispatchCode)
        return
    end
    
    -- Check if player should receive this dispatch
    if not ShouldReceiveDispatch(dispatchInfo.job) then
        return
    end
    
    -- Play audio alert
    PlayAudioAlert(dispatchInfo.audioType)
    
    -- Show notification
    local notificationText = dispatchInfo.message .. '\nLocation: ' .. street
    ShowNotification(dispatchInfo.displayCode .. ' - ' .. dispatchInfo.description, notificationText, 'error')
    
    -- Create blip
    CreateDispatchBlip({
        coords = coords,
        blipSprite = dispatchInfo.blipSprite,
        blipColor = dispatchInfo.blipColor,
        displayCode = dispatchInfo.displayCode,
        description = dispatchInfo.description
    })
end)

-- Test Command Handler (admin only)
RegisterNetEvent('ps-dispatch-audio:client:TestDispatch', function(code)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
    
    TriggerServerEvent('ps-dispatch-audio:server:SendDispatch', {
        code = code,
        coords = {x = coords.x, y = coords.y, z = coords.z},
        street = street
    })
end)

-- Clean up on resource stop
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        for _, blip in pairs(ActiveDispatches) do
            if DoesBlipExist(blip) then
                RemoveBlip(blip)
            end
        end
    end
end)

print('^2[PS-Dispatch-Audio]^7 Client script loaded successfully')
