for i = 2, 10 do
    local nominal = i / 2
    local act_low = tostring(math.floor(nominal))
    local act_high = tostring(math.ceil(nominal))

    SMODS.Rank {
        key = 'H' .. i,
        card_key = 'H' .. i,
        shorthand = 'H' .. i,
        nominal = nominal,
        pos = { x = i - 2,},
        loc_txt = {
        name = "Half-" .. i,
        },
        hidden = true,
        hc_atlas = 'half_rank',
        lc_atlas = 'half_rank',
        in_pool = function() return false end
    }
end

SMODS.Rank {
    key = 'HAce',
    card_key = 'HA',
    shorthand = 'HA',
    nominal = 5.5,
    pos = { x = 12, },
    loc_txt = {
    name = "Half-Ace",
    },
    hidden = true,
    hc_atlas = 'half_rank',
    lc_atlas = 'half_rank',
    in_pool = function() return false end
}