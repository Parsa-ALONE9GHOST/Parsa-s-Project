-- بررسی قابل ارتقاء بودن کارت بدون تغییر آن
function can_promote_to_half_rank(card)
    local value = card.base.nominal
    if value and math.floor(value) == value then
        if (value >= 1 and value <= 10) or value == 14 then
            local half_key = value == 14 and 'pal_HAce' or 'pal_H' .. tostring(value)
            return SMODS.Ranks[half_key] ~= nil
        end
    end
    return false
end

-- تبدیل واقعی کارت به Half-Rank
function promote_to_half_rank(card)
    local value = card.base.nominal
    if value and value >= 1 and value <= 10 and math.floor(value) == value then
        local half_key = 'pal_H' .. tostring(value)
        if SMODS.Ranks[half_key] then
            SMODS.change_base(card, nil, half_key)
            return true
        end
    elseif value == 14 then
        local half_key = 'pal_HAce'
        if SMODS.Ranks[half_key] then
            SMODS.change_base(card, nil, half_key)
            return true
        end
    end
    return false
end

-- آیتم Half-Ranker
SMODS.Consumable{
    set = "randmcrd",
    key = "c_half_ranker",
    atlas = "hlf",
    pos = {x = 0, y = 0},
    config = {},
    discovered = true,

    loc_txt = {
        name = "Half-Ranker",
        text = {
            "Replaces the selected card's",
            "rank with a random {C:attention}Half-Rank{}.",
            "{C:inactive}Don't use it on face cards{}",
        },
    },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    -- بررسی اینکه آیا کارت قابل استفاده است یا نه
    can_use = function(self, card)
        local c = G.hand and G.hand.highlighted and G.hand.highlighted[1]
        return c and not c.config.center.replace_base_card and can_promote_to_half_rank(c)
    end,

    -- عملکرد استفاده از آیتم
    use = function(self, card, area, copier)
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
                    assert(promote_to_half_rank(G.hand.highlighted[i]))
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
    end,
}
