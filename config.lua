Config = {}

Config.Zones = {
    {       -- Jail
        pos = vector3(1704.71, 2573.79, 45.56), 
        radius = 230.0,  
        time = 10, -- in seconds, time until vehicle is shot down
        timeLow = 2, -- in seconds, time until vehicle engine starts slow down again
        Notify = {
            msg = 'You have entered restricted airspace you have 10 seconds till you are shot down!',
            iconType = 1
        },
        Blip = {
            enable = true,
            color = 1, 
            alpha = 128 -- transparency
        }
    },
    {       -- City Center
        pos = vector3(-70.51, -727.53, 44.38), 
        radius = 1200,  
        time = 10, -- in seconds, time until vehicle is shot down
        timeLow = 2, -- in seconds, time until vehicle engine starts slow down again
        Notify = {
            msg = 'You have entered restricted airspace you have 10 seconds till you are shot down!',
            iconType = 1
        },
        Blip = {
            enable = true,
            color = 1, 
            alpha = 128 -- transparency
        }
    },
    {           -- Top left of city
        pos = vector3(-1563.75, -188.51, 55.55), 
        radius = 500,  
        time = 10, -- in seconds, time until vehicle is shot down
        timeLow = 2, -- in seconds, time until vehicle engine starts slow down again
        Notify = {
            msg = 'You have entered restricted airspace you have 10 seconds till you are shot down!',
            iconType = 1
        },
        Blip = {
            enable = true,
            color = 1, 
            alpha = 128 -- transparency
        }
    },
    {       -- Chumash
        pos = vector3(-2962.7, 483.0, 25.36), 
        radius = 230.0,  
        time = 10, -- in seconds, time until vehicle is shot down
        timeLow = 2, -- in seconds, time until vehicle engine starts slow down again
        Notify = {
            msg = 'You have entered restricted airspace you have 10 seconds till you are shot down!',
            iconType = 1
        },
        Blip = {
            enable = false,
            color = 1, 
            alpha = 128 -- transparency
        }
    },
    {       -- Paleto
        pos = vector3(-116.72, 6466.99, 37.22), 
        radius = 460.0,  
        time = 10, -- in seconds, time until vehicle is shot down
        timeLow = 2, -- in seconds, time until vehicle engine starts slow down again
        Notify = {
            msg = 'You have entered restricted airspace you have 10 seconds till you are shot down!',
            iconType = 1
        },
        Blip = {
            enable = false,
            color = 1, 
            alpha = 128 -- transparency
        }
    },
}

