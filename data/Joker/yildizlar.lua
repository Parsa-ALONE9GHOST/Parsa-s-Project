SMODS.Joker {
    key = "starss",
    atlas = "palcehold",
    rarity = 2,
    cost = 10,
    unlocked = true,
    blueprint_compat = true,
    discovered = false,
    pos = { x = 2, y = 1 },

    config = {
        extra = {
            used_this_turn = 0,
            max_per_turn = 5,
        }
    },

  loc_txt = {
    name = 'Yildizlar',
    text = {
        '{C:attention}Gezegeni{} kullandiktan sonra bir kopyasini yapar',
        '{C:inactive}(tur basina 5 kez){}'
    }
},

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.max_per_turn }
        }
    end,

    calculate = function(self, card, context)
if context.using_consumeable and context.consumeable and context.consumeable.ability.set == 'Planet' then
            if card.ability.extra.used_this_turn < card.ability.extra.max_per_turn and
                #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then

                card.ability.extra.used_this_turn = card.ability.extra.used_this_turn + 1
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1

                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.3,
                    func = function()
                        SMODS.add_card {
                            set = 'Planet',
                            key = context.consumeable.config.center.key,
                            key_append = 'yildizlar_copy'
                        }
                        G.GAME.consumeable_buffer = 0
                        play_sound('tarot1')
                        return true
                    end
                }))

                return {
                    message = localize('k_plus_planet'),
                    colour = G.C.RANDOOM,
                }
            end
        end
    end,

    reset = function(self, card)
        card.ability.extra.used_this_turn = 0
    end
}
