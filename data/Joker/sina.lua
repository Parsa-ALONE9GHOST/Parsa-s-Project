SMODS.Joker({
	key = "sina",
	atlas = "palcehold",
    rarity = 4,
	unlocked = true,
    cost = 10,
	discovered = false,
	pos = {
		x = 1,
		y = 1,
	},
    loc_txt = {
    name = 'SINACHAD',
    text = {
        '{C:attention}Doubles{} {C:chips}chip{}, {C:mult}mult{}, {X:chips,C:white}Xchip{} and {X:mult,C:white}Xmult{} values.',
		"{C:inactive}Don't be happy it does nothing.{}",
		"{C:inactive}Now you can alt + f4 and damn your luck.{}"
    }
},

	in_pool = function(self)
		return false
	end,
})
