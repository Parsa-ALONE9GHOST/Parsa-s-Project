local troop_enhancements = {
    {key = "usa", troops = 6, name = "United States", gdp = 27},
    {key = "rus", troops = 5, name = "Russia", gdp = 20},
    {key = "prc", troops = 5, name = "China", gdp = 17},
    {key = "uk",  troops = 4, name = "United Kingdom", gdp = 33},
    {key = "ger", troops = 3, name = "Germany", gdp = 45},
    {key = "rok", troops = 1, name = "South Korea", gdp = 17},
    {key = "fra", troops = 4, name = "France", gdp = 30},
    {key = "jap", troops = 3, name = "Japan", gdp = 42},
    {key = "ksa", troops = 2, name = "Saudi Arabia", gdp = 10},
    {key = "il",  troops = 2, name = "Israel", gdp = 51},
    {key = "uae", troops = 1, name = "UAE", gdp = 51},
    {key = "ind", troops = 5, name = "India", gdp = 35},
    {key = "irn", troops = 3, name = "Iran", gdp = 40},
    {key = "can", troops = 2, name = "Canada", gdp = 21},
    {key = "ita", troops = 3, name = "Italy", gdp = 23},
}


for i, data in ipairs(troop_enhancements) do
    SMODS.Enhancement{
        key = "troop_data_" .. data.key,
        atlas = "cou_enha",
    pos = {
    x = (i - 1) % 5,
    y = math.floor((i - 1) / 5)
    },
        --no_collection = true,
    	loc_vars = function(self, info_queue, card)
		return { vars = {colours = { HEX('a0eb75'), HEX('2c4224') }, card.ability.mult, self.config.troops,} }
	end,
        config = { troops = data.troops, mult = data.gdp, },
        loc_txt = {
            name = data.name .. " Forces",
            text = {
                "Represents {C:attention}" .. data.name .. "{}'s army.",
                "Eliminated if another army has more {V:2}troops{}.",
                "Give {C:mult}Mult{} equal to country's {V:1}GDP{}'s 2 1st digits",
                "{C:inactive}( #2# Troops #1# Mult ){}"
            }
        },
        calculate = function(self, card, context)
            -- مقدار troops را روی کارت بنویس
            card.ability.troops = self.config.troops

            if context and context.final_scoring_step then
                local my_troops = card.ability.troops or 0
                local max_troops = my_troops

                for _, c in ipairs(G.play.cards) do
                    if c ~= card and c.ability and c.ability.troops then
                        if c.ability.troops > max_troops then
                            max_troops = c.ability.troops
                        end
                    end
                end

                if my_troops < max_troops then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'immediate',
                        func = function()
                            card:shatter()
                            return true
                        end
                    }))
                end
            end
        end
    }
end

