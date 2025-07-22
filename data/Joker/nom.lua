SMODS.Joker {
    key = "number_",
    atlas = "palcehold",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    discovered = false,
    unlocked = true,
    pos = { x = 4, y = 0 },

    loc_txt = {
        name = "Who Wins? Blue Or Red?",
        text = {
            "Cards give {C:chips}Chips{} and",
            "{C:mult}Mult{} equal to their nomial"
        }
    },

    config = {},

    	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pal_art_astro
        return { vars = { } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card then
local rank = context.other_card.base.nominal
            return {
                chips = rank,
                mult = rank,
            }
        end
    end
}
