SMODS.Joker {
    key = "pi3",
    name = "What The Pi?",
    atlas = 'palcehold',
    pos = {
        x = 0,
        y = 1,
    },
    rarity = 2,
    cost = 7,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = tostring(3.14159265358),
            xchips = tostring(3.14159265358),
        }
    },
    loc_txt = {
    name = 'What The Pi?',
    text = {
        '{Gives {X:mult,C:white}X#1#{} Mult and {X:chips,C:white}X#2#{} Chips',
    }
},

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                tostring(card.ability.extra.xmult) or '?',
                tostring(card.ability.extra.xchips) or '?'
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local extra = card.ability and card.ability.extra
            if extra then
                return {
                    xmult = tostring(extra.xmult) or 1,
                    xchips = tostring(extra.xchips) or 1,
                }
            end
        end
    end
}