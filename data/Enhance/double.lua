SMODS.Enhancement {
    key = "dou",
    atlas = "double",
    pos = {x = 0, y = 0},

    replace_base_card = false,
    no_suit = false,
    no_rank = false,
    always_scores = false,

    loc_txt = {
        name = "Double Seal Card",
        text = {
            "Make two cards,",
            "with random suit, rank and seal",
            "when scoring."
        }
    },

    set_card_type_badge = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Double",
            G.C.MY_PRIMARY,
            G.C.WHITE,
            1.2
        )
    end,

calculate = function(self, card, context, effect)
    if context.main_scoring and context.cardarea == G.play then
        G.E_MANAGER:add_event(Event({
            func = function()
                local suits = {'C', 'D', 'H', 'S'}
                local ranks = {'2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A'}

                for i = 1, 2 do
                    local _card = SMODS.create_card{
                        set = "Base",
                        suit = pseudorandom_element(suits),
                        rank = pseudorandom_element(ranks),
                        seal = SMODS.poll_seal({ guaranteed = true }),
                        area = G.hand
                    }

                    G.hand:emplace(_card)
                    _card:start_materialize()
                    G.hand:sort()
                end

                card:juice_up()
                return true
            end
        }))
    end
end,
}
