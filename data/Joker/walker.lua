SMODS.Joker {
    key = "walker",
    rarity = "pal_sum",
    atlas = "palcehold",
    cost = 5,
    pos = {
        x = 3,
        y = 0
    },
    config = {
         extra = {
             mult = 2
             }
            },
                loc_txt = {
        name = "Walker",
        text = {
            "Gives {C:mult}+#1#{} extra mult,",
            "to every scored card",
            "{C:inactive,S:0.8}opposite hiker ?!{}",
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
             vars = {
                 card.ability.extra.mult
                }
            }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
                card.ability.extra.mult
            return { message = "مولت!", colour = G.C.MULT, font = G.FONTS.Vazir }
        end
    end
}