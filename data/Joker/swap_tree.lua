-- suit swaping with func
local function swap_suit(suit)
    if suit == "Spades" then return "Hearts"
    elseif suit == "Hearts" then return "Spades"
    elseif suit == "Clubs" then return "Diamonds"
    elseif suit == "Diamonds" then return "Clubs"
    else return suit end
end

SMODS.Joker{
    key = "suit_swapper",
    name = "Suit Flipper",
    atlas = "suitswapper",
    pos = {x = 0, y = 0},
    rarity = "pal_sum",
    cost = 6,
    unlocked = true,
    discovered = true,

    loc_txt = {
        name = "Suit Swap",
        text = {
                 "{C:clubs}Clubs{} and {C:diamonds}Diamonds",
                    "count as the same suit,",
                    "{C:hearts}Hearts{} and {C:spades}Spades{}",
                    "count as the same suit",
            "{C:inactive,s:0.8}Affects all played cards"
        }
    },
}
--it dont have anything for calculate or loc_vars so this code is out of smods.joker
local card_is_suit_ref = Card.is_suit

function Card:is_suit(suit, bypass_debuff, flush_calc)
    local has_suit_swapper = next(SMODS.find_card("j_pal_suit_swapper"))

    if has_suit_swapper and not SMODS.has_no_suit(self) then
        local swapped = swap_suit(self.base.suit)
        return swapped == suit
    else
        return card_is_suit_ref(self, suit, bypass_debuff, flush_calc)
    end
end
