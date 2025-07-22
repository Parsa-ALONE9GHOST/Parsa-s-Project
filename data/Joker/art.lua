local half_rank_keys = {
    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "HAce"
}

SMODS.Joker {
    key = "painti",
    atlas = "palcehold",
    unlocked = true,
    cost = 5,
    rarity = 2,
    discovered = false,
    pos = {
        x = 0,
        y = 0,
    },
    loc_txt = {
        name = "Half-Worked Art",
        text = {
            "{C:attention}retrigger{} cards with half-ranks",
        }
    },
    	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pal_art_astro
        end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card then
            local key = context.other_card.base and context.other_card.base.key
            for _, v in ipairs(half_rank_keys) do
                if key == v then
                        return {
                            message = "Half!",
                            repetitions = 1,
                            card = context.other_card
                        }
                    end

                end
            end
        end
}
