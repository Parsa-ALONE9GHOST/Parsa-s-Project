SMODS.Joker {
    key = "jokala",
    name = "Online Shop",
    atlas = "onshop",
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = false,
    blueprint_compat = false,

    loc_txt = {
        name = "{C:red}Online Shop{}",
        text = {
            "Selling this card makes coupon tag."
        }
    },

    calculate = function(self, card, context)
        if context.selling_self then
            return {
                func = function()
                    add_tag(Tag('tag_coupon'))
                end
            }
        end
    end,
}
