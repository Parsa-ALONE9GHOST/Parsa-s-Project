
function get_random_glitch_consumeable()
    local pool = {}
    if not G.P_CONSUMABLES then return nil end

    for k, v in pairs(G.P_CONSUMABLES) do
        if v.type == 'randmcrd' then
            table.insert(pool, k)
        end
    end
    if #pool == 0 then return nil end
    return pseudorandom_element(pool)
end

SMODS.Booster{
    name = "Random Pack",
    key = "rndboo1",
    atlas = 'booster1',
    pos = {x = 0, y = 0},
    weight = 0.85,
    cost = 6,
    group_key = 'rnd_booster',
    config = {extra = 2, choose = 1, name = "Random Pack"},
    discovered = false,
			loc_txt = {
				name = "Standard Random Pack",
				text = {
					"Choose {C:attention}1{} of up to",
					"{C:attention}2{C:attention} Random Cards{} to",
					"use immediately",
				},
			},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.choose, card.ability.extra} }
    end,
    draw_hand = true,
    ease_background_colour = function(self)
        ease_background_colour({
            new_colour = HEX("7c9847"),
            special_colour = HEX("1f3e20"),
            contrast = 1.3
        })
    end,

    create_card = function(self, card)
                return create_card("randmcrd", G.pack_cards, nil, nil, true,  true, nil, "RandBoostPack")
    end,

    kind = 'RandBoostPack'
}
SMODS.Booster{
    name = "Random Pack",
    key = "rndboo2",
    atlas = 'booster2',
    pos = {x = 0, y = 0},
    weight = 0.85,
    cost = 6,
    group_key = 'rnd_booster',
    config = {extra = 3, choose = 1, name = "Random Pack"},
    discovered = false,
			loc_txt = {
				name = "Super Standard Random Pack",
				text = {
					"Choose {C:attention}1{} of up to",
					"{C:attention}3{C:attention} Random Cards{} to",
					"use immediately",
				},
			},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.choose, card.ability.extra} }
    end,
    draw_hand = true,
    ease_background_colour = function(self)
        ease_background_colour({
            new_colour = HEX("5968ff"),
            special_colour = HEX("1728ce"),
            contrast = 1.3
        })
    end,

    create_card = function(self, card)
                return create_card("randmcrd", G.pack_cards, nil, true, true,  true, nil, "RandBoostPack")
    end,

    kind = 'RandBoostPack'
}
SMODS.Booster{
    name = "Random Pack",
    key = "rndboo3",
    atlas = 'booster2',
    pos = {x = 1, y = 0},
    weight = 0.85,
    cost = 6,
    group_key = 'rnd_booster',
    config = {extra = 5, choose = 1, name = "Random Pack"},
    discovered = false,
			loc_txt = {
				name = "Jumbo Random Pack",
				text = {
					"Choose {C:attention}1{} of up to",
					"{C:attention}5{C:attention} Random Cards{} to",
					"use immediately",
				},
			},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.choose, card.ability.extra} }
    end,
    draw_hand = true,
    ease_background_colour = function(self)
        ease_background_colour({
            new_colour = HEX("c90065"),
            special_colour = HEX("7b0380"),
            contrast = 1.3
        })
    end,

    create_card = function(self, card)
                return create_card("randmcrd", G.pack_cards, true, true, true,  true, nil, "RandBoostPack")
    end,

    kind = 'RandBoostPack'

}
