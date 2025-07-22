SMODS.Joker {
    key = "farsi",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 3,
    cost = 8,
    atlas = "palcehold",
    pos = { x = 3, y = 1 },
    config = { extra = { Base = 1, Base_ext = 0.1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Base_ext, card.ability.extra.Base } }
    end,
        loc_txt = {
    name = 'Parsi (Persian)',
    text = {
        'Gives {X:mult,C:white}+X#1#{} mult for every {C:attention}consumeable{} use.',
        '{C:inactive}(correctly X#2# mult){}'
    }
},
    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint then
            card.ability.extra.Base = card.ability.extra.Base + card.ability.extra.Base_ext
            return {
                message = "Added!"
            }
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.Base
            }
        end
    end
}