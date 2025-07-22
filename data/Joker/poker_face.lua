
SMODS.Joker {
    key = "poker_face",
    atlas = "palcehold",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    discovered = false,
    unlocked = true,
    pos = { x = 2, y = 0 },

    loc_txt = {
        name = "Suprised Face",
        text = {
            "Every cards give",
            "{C:mult}+#1#{} Mult when scored"
        }
    },
    config = { extra = { mult = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            return {
                mult = card.ability.extra.mult
            }
        end
    end

}
