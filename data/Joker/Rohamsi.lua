SMODS.Joker {
    key = "pepsi",
    name = "Rohamsi",
    atlas = 'Ahmad_Mohsen',
    pos = {
        x = 0,
        y = 0, 
    },
    soul_pos = {
        x = 0,
        y = 1,
    },
    rarity = 4,
    cost = 15,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 3,
            xchips = 3,
        }
    },
    loc_txt = {
    name = 'Rohamsi',
    text = {
        '{{X:mult,C:white}X#1#{} Mult and {X:chips,C:white}X#2#{} Chips',
    }
},

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult or '?',
                card.ability.extra.xchips or '?'
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local extra = card.ability and card.ability.extra
            if extra then
                return {
                    xmult = extra.xmult or 1,
                    xchips = extra.xchips or 1,
                }
            end
        end
    end
}