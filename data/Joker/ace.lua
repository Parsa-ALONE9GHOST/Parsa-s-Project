SMODS.Enhancement {
    key = "art_astro",
    replace_base_card = false,
    no_suit = false,
    no_rank = false,
    no_collection = true,
    always_scores = false,
    loc_txt = {
        name = "Original Art",
text = {
    "Original art by {X:mult,C:white}@silly_goober_0nthewall{}",
}

    },
}
SMODS.Joker {
    key = "aceeee",
    atlas = "palcehold",--yeah yeah, i khow its palcehold instead of placehold but im lazy  :)
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = {x = 1, y = 0},

    loc_txt = {
        name = "Ace and ... half of Ace?!",
        text = {
            "If scoring hand hand contains",
            "an {C:attention}Ace{} and a {C:attention}Half-Ace{},",
            "gain {X:mult,C:white}X#1#{} Mult"
        }
    },

    config = {
        xmult = 2
    },

    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pal_art_astro
        return {
            vars = { card.ability and card.ability.xmult or 2 }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.scoring_hand then
            local has_ace = false
            local has_halface = false

            for _, c in ipairs(context.scoring_hand) do
                local nominal = c.base and c.base.nominal
                if nominal == 11 then
                    has_ace = true
                elseif nominal == 5.5 then
                    has_halface = true
                end
            end

            if has_ace and has_halface then
                return {
                    xmult = card.ability and card.ability.xmult or 2,
                }
            end
        end
    end
}

