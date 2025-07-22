SMODS.Enhancement {
    key = "porcelain_h",
    atlas = "porcelain_ha",
    pos = {x=0, y = 0},

    replace_base_card = false,
    no_suit = false,
    no_rank = false,
    always_scores = false,

    config = {
        extra = {
            Xchips = 1.75,
            limit = 3,
            played = 0,
            marked = false,
            bonus_mult_applied = false,
            bonus_chips_applied = false,
            transformed = false
        }
    },
        loc_txt = {
        name = "Porcelain Card (for hard water)",
text = {
    "Gives {X:chips,C:white}X#1#{} Chips.",
        "{C:green}1 in 10{} chance to give {X:chips,C:white}X2{} Chips.",
                "{C:green}1 in 10{} chance to give {X:mult,C:white}X2.5{} mult.",
                                "{C:green}1 in 10{} hance to transform into {C:attention}Porcelain Card{}.",
}

    },
    set_card_type_badge = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Porcelain Card (for hard water)",
            G.C.GREEN,
            G.C.WHITE,
            1.2
        )
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.Xchips, card.ability.extra.limit }
        }
    end,

 calculate = function(self, card, context, ret)
    -- Fallback to empty table if ret is nil
    ret = ret or {}

    if context.cardarea == G.play and context.main_scoring then
        card.ability.extra.played = #context.full_hand
        if card.ability.extra.played > card.ability.extra.limit then
            card.ability.extra.marked = true
        end

        -- 1 in 10 chance for x2.5 multiplier
        if not card.ability.extra.bonus_mult_applied and pseudorandom('porcelain_mult') < 0.1 then
            ret.mult = (ret.mult or 1) * 2.5
            card.ability.extra.bonus_mult_applied = true
        end

        -- 1 in 10 chance for x2 chips
        if not card.ability.extra.bonus_chips_applied and pseudorandom('porcelain_chips') < 0.1 then
            ret.xchips = (ret.xchips or card.ability.extra.Xchips) * 2
            card.ability.extra.bonus_chips_applied = true
        else
            ret.xchips = card.ability.extra.Xchips
        end

    end

    if context.final_scoring_step and card.ability.extra.marked then
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                card:shatter()
                return true 
            end 
        }))
    end

    if context.destroying_card and card.ability.extra.marked then
        return {
            remove = true
        }
    end
        if not card.ability.extra.transformed and pseudorandom('porcelain_transform') < 0.1 and card.ability.extra.marked then
            card:set_ability('m_buf_porcelain')
            card.ability.extra.transformed = true
        end

        return ret
end

}
