Config = {}

-- Audio Settings
Config.UseAudioAlerts = true
Config.AudioVolume = 0.5 -- Volume level (0.0 to 1.0)

-- Audio file names (place .ogg files in sounds/ folder)
Config.AudioFiles = {
    ['police'] = 'dispatch_police',
    ['ems'] = 'dispatch_ems',
    ['fire'] = 'dispatch_fire',
    ['general'] = 'dispatch_general',
    ['priority'] = 'dispatch_priority'
}

-- Dispatch Configuration
Config.DispatchJobs = {
    ['police'] = {'police', 'sheriff', 'state'},
    ['ems'] = {'ambulance', 'doctor'},
    ['fire'] = {'fire'}
}

-- Blip Settings
Config.BlipTime = 30 -- Time in seconds the blip stays on map
Config.BlipColors = {
    ['police'] = 3,  -- Blue
    ['ems'] = 1,     -- Red
    ['fire'] = 1,    -- Red
    ['general'] = 5  -- Yellow
}

Config.BlipScale = 1.0
Config.BlipAlpha = 200

-- Dispatch Types
Config.DispatchCodes = {
    -- Police Dispatches
    ['10-10'] = {
        displayCode = '10-10',
        description = 'Fight in Progress',
        message = 'Reports of a fight in progress',
        job = 'police',
        blipSprite = 58,
        blipColor = 1,
        audioType = 'police'
    },
    ['10-11'] = {
        displayCode = '10-11',
        description = 'Traffic Stop',
        message = 'Officer conducting traffic stop',
        job = 'police',
        blipSprite = 56,
        blipColor = 3,
        audioType = 'police'
    },
    ['10-31'] = {
        displayCode = '10-31',
        description = 'Robbery in Progress',
        message = 'Armed robbery in progress',
        job = 'police',
        blipSprite = 431,
        blipColor = 1,
        audioType = 'priority'
    },
    ['10-32'] = {
        displayCode = '10-32',
        description = 'Store Robbery',
        message = 'Store robbery in progress',
        job = 'police',
        blipSprite = 52,
        blipColor = 1,
        audioType = 'priority'
    },
    ['10-33'] = {
        displayCode = '10-33',
        description = 'Bank Robbery',
        message = 'Bank robbery in progress',
        job = 'police',
        blipSprite = 108,
        blipColor = 1,
        audioType = 'priority'
    },
    ['10-60'] = {
        displayCode = '10-60',
        description = 'Suspicious Person',
        message = 'Reports of suspicious person',
        job = 'police',
        blipSprite = 66,
        blipColor = 5,
        audioType = 'police'
    },
    ['10-65'] = {
        displayCode = '10-65',
        description = 'Grand Theft Auto',
        message = 'Vehicle theft in progress',
        job = 'police',
        blipSprite = 227,
        blipColor = 1,
        audioType = 'police'
    },
    ['10-66'] = {
        displayCode = '10-66',
        description = 'Suspicious Vehicle',
        message = 'Reports of suspicious vehicle',
        job = 'police',
        blipSprite = 225,
        blipColor = 5,
        audioType = 'police'
    },
    ['10-71'] = {
        displayCode = '10-71',
        description = 'Shots Fired',
        message = 'Multiple shots fired',
        job = 'police',
        blipSprite = 110,
        blipColor = 1,
        audioType = 'priority'
    },
    ['10-90'] = {
        displayCode = '10-90',
        description = 'Officer Down',
        message = 'Officer needs immediate assistance!',
        job = 'police',
        blipSprite = 161,
        blipColor = 1,
        audioType = 'priority'
    },
    ['10-99'] = {
        displayCode = '10-99',
        description = 'Officer in Pursuit',
        message = 'Officer in vehicle pursuit',
        job = 'police',
        blipSprite = 229,
        blipColor = 3,
        audioType = 'police'
    },
    
    -- EMS Dispatches
    ['EMS-1'] = {
        displayCode = 'EMS-1',
        description = 'Medical Emergency',
        message = 'Person down, medical assistance required',
        job = 'ems',
        blipSprite = 153,
        blipColor = 1,
        audioType = 'ems'
    },
    ['EMS-2'] = {
        displayCode = 'EMS-2',
        description = 'Vehicle Accident',
        message = 'Traffic collision with injuries',
        job = 'ems',
        blipSprite = 315,
        blipColor = 1,
        audioType = 'ems'
    },
    ['EMS-3'] = {
        displayCode = 'EMS-3',
        description = 'Mass Casualty',
        message = 'Multiple patients require immediate care',
        job = 'ems',
        blipSprite = 153,
        blipColor = 1,
        audioType = 'priority'
    },
    
    -- Fire Dispatches
    ['FIRE-1'] = {
        displayCode = 'FIRE-1',
        description = 'Structure Fire',
        message = 'Building fire reported',
        job = 'fire',
        blipSprite = 436,
        blipColor = 1,
        audioType = 'fire'
    },
    ['FIRE-2'] = {
        displayCode = 'FIRE-2',
        description = 'Vehicle Fire',
        message = 'Vehicle on fire',
        job = 'fire',
        blipSprite = 227,
        blipColor = 1,
        audioType = 'fire'
    },
}
