SMODS.Atlas{
    key = 'minty',
    path = 'tarot.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = 'pal_mint',
    path = 'mint.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = 'Ahmad_Mohsen',
    path = 'Untitled.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = 'palm',
    path = 'sume.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = 'poker_hands',
    path = 'Poker Hands.png',
    px = 53,
    py = 13,
}
SMODS.Atlas{
    key = 'porcelain_ha',
    path = 'polcetrian_h.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = 'dorkshire_ha',
    path = 'dorkshire_h.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = 'Parsa',
    path = 'Parsa.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = 'door',
    path = 'ring.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = 'suitswapper',
    path = 'suitswapper.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = 'onshop',
    path = 'kala.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = 'double',
    path = 'double seal.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = 'see',
    path = 's.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = 'booster1',
    path = 'booster.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = 'half_rank',
    path = 'half_rank.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = 'palcehold',
    path = 'jokrs.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = 'booster2',
    path = 'pack.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = 'hlf',
    path = 'hcon.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = "cou_enha",
    path = 'troops.png',
    px = 71,
    py = 95,
}

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
    SMODS.Atlas{
    key = "atl_" ..data.key,
    path = 'countries/'.. data.key ..'.png',
    px = 71,
    py = 95,
}
end