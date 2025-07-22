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
for _, data in ipairs(troop_enhancements) do
    SMODS.Consumable({
        set = "randmcrd",
        atlas = "atl_" ..data.key,
        key = "apply_" .. data.key .. "_troops",
        pos = { x = 0, y = 0 },
        config = {
            enh = "troop_data_" .. data.key,
            lim = 5
        },
        discovered = true,
        loc_txt = {
            name = data.name .. " Deployment",
            text = {
                "Enhances up to {C:attention}#1#{} selected cards",
                "with {C:green}" .. data.name .. " Forces{}"
            }
        },
        loc_vars = function(self, info_queue)
            info_queue[#info_queue + 1] = G.P_CENTERS[self.config.enh]
            return { vars = { self.config.lim } }
        end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= self.config.lim
    end,

    use = function(self, card)   -- For cons.(Thank you very much kirbio for this code :) )
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    G.hand.highlighted[i]:set_ability(G.P_CENTERS["m_pal_troop_data_" .. data.key])
                    return true
                end
            }))
        end

        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))

        delay(0.5)
    end
    })
end
