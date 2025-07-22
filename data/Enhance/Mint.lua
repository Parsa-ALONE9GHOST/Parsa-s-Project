SMODS.Enhancement {
    key = "mint_card",
    atlas = "pal_mint",
    pos = {x = 0, y = 0},

    replace_base_card = false,
    no_suit = false,
    no_rank = false,
    always_scores = false,
	config = { extra = { Xchips = 1.5 } },
    loc_txt = {
        name = "Mint Card",
text = {
    "Gives {X:chips,C:white}X#1#{} Chips",
}

    },
    set_card_type_badge = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Mint",
            G.C.GREEN,
            G.C.WHITE,
            1.2
        )
    end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xchips } }
	end,
	calculate = function(self, card, context, effect)
		if context.main_scoring and context.cardarea == G.play then
			return {
				xchips = card.ability.extra.Xchips
			}
		end
	end,
}

