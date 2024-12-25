Config = {}

Config.Locations = {
    ["hunters"] = {
        Blip = {
            enabled = true,
            sprite = 141,
            label = "Milan"
        },

        label = "Milan",

        pedModel = `csb_prologuedriver`,
        Coords = {
            vec4(2932.2227, 4624.2290, 48.7234, 47.6942)
        }
    },

    ["pawnshop"] = {
        Blip = {
            enabled = true,
            sprite = 617,
            label = "Zastavárna"
        },

        label = "Výkup Zboží",

        pedModel = `s_m_m_strvend_01`,
        Coords = {
            vec4(182.203583, -1319.097412, 29.315741, 237.53631591797),
            vec4(-1267.517456, -1476.860107, 4.330848, 254.81304931641)
        }
    },

    ["fishing"] = {
        Blip = {
            enabled = true,
            sprite = 404,
            label = "u Starého"
        },

--[[         jobs = {
            "police",
            "police2"
        }, ]]

        label = "u Starého",

        pedModel = `s_m_m_strvend_01`,
        Coords = {
            vec4(-1593.0170, 5202.8867, 4.3101, 304.7336)
        }
    },
}