SMODS.Joker{
    key = "ring",
    name = "Doorbell",
    atlas = "door",
    pos = {x = 0, y = 0},
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,

    loc_txt = {
        name = "Doorbell Rings",
        text = {
            "Gives {X:mult,C:white}X#1#{} Mult",
            "{C:inactive,s:0.8}Don't mind that it has 1 in 5 chance to give X0.25 mult{}",
        }
    },

    config = {
        extra = {
            xmult = 4.5,
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult or '?',
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local xmult = card.ability.extra.xmult or 1
            if pseudorandom('doorbell_trigger', 5) == 1 then
                play_sound("pal_ring")
                xmult = 0.25
            end
            return { xmult = xmult }
        end
    end,
}
