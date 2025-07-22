SMODS.Joker {
    key = "green_palm",
    name = "Green Palm",
    atlas = "palm",
    pos = {
        x = 0,
        y = 0,
    },
    rarity = 'pal_sum',
    cost = 7,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,

    loc_txt = {
        name = "Green Palm",
        text = {
            "Gives {X:chips,C:white}X#1#{} Chips"
        }
    },

    config = {
        extra = {
            xchips = 2.7,
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips or '?'
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local extra = card.ability and card.ability.extra
            if extra then
                return {
                    xchips = extra.xchips or 1,
                }
            end
        end
    end
}
