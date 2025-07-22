-- Parsa
SMODS.Joker {
    key = "parsa",
	atlas = "Parsa",
    blueprint_compat = true,
    perishable_compat = true,
    rarity = 4,
    cost = 10,
	pos = {
		x = 0,
		y = 0,
	},
	soul_pos = {
		x = 0,
		y = 1,
	},
    config = {
        extra = {
            base_xmult = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        local compat = (Palatro and Palatro.compat) or {}
        local active_mods = 0
        for _, is_enabled in pairs(compat) do
            if is_enabled then active_mods = active_mods + 1 end
        end
        local total = card.ability.extra.base_xmult + active_mods
        return { vars = { total } }
    end,
    loc_txt = {
        name = "Parsa",
        text = {
            "Gives {X:mult,C:white}X1{} mult for every",
            "Parsa's favourite {C:attention,E:1}Mod{} enabled",
            "{C:inactive}(currently X#1# mult){}"
        },
    },
    calculate = function(self, card, context)
        if context.joker_main then
            local compat = (Palatro and Palatro.compat) or {}
            local active_mods = 0
            for _, is_enabled in pairs(compat) do
                if is_enabled then active_mods = active_mods + 1 end
            end
            local total_xmult = card.ability.extra.base_xmult + active_mods
            return {
                xmult = total_xmult,
            }
        end
    end,
}
