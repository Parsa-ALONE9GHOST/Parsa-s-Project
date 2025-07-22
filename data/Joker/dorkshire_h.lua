SMODS.Joker {
    key = "dorkshire_h",
    name = "Dorkshire Tea",
    atlas = 'dorkshire_ha',
    pos = {
        x = 0,
        y = 0,
    },
    rarity = 3,
    cost = 7,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    loc_txt = {
		name = "Dorkshire Tea",
				text = {"All {C:attention}2s{}, {C:attention}3s{} and {C:attention}10s{} become",
						"{C:attention}Porcelain Cards{} before",
						"scoring, if {C:attention}poker hand{}",
						"is a {C:attention}Three of a Kind{}",
                        "{C:inactive,s:0.8}Wait a minute, whats difference?{}",
						}
    },
    calculate = function(self, card, context)
        if context.before and context.scoring_name == "Three of a Kind" and not context.blueprint then
			local tcards = {}
			local check = false
			for k, v in ipairs(context.scoring_hand) do
				if (v:get_id() == 2 or v:get_id() == 3 or v:get_id() == 10) then
					check = true
					tcards[#tcards+1] = v
					v:set_ability(G.P_CENTERS.m_pal_porcelain_h, nil, true)
					G.E_MANAGER:add_event(Event({
						func = function()
							v:juice_up()
							return true
						end
					})) 
				end
			end
			if check then SMODS.calculate_effect({message = "Hard!", colour = G.C.GREEN}, card) end
        end
    end
}