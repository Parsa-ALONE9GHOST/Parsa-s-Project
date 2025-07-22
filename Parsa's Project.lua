Palatro = SMODS.current_mod
Palatro.compat = {
	buffoonery = (SMODS.Mods['Buffoonery'] or {}).can_load,
	unstable = (SMODS.Mods['UnStable'] or {}).can_load,
	ortalab = (SMODS.Mods['Ortalab'] or {}).can_load,
    familiar = (SMODS.Mods['familiar'] or {}).can_load,
    toga = (SMODS.Mods["TOGAPack"] or {}).can_load,
    maximus = (SMODS.Mods["Maximus"] or {}).can_load,
    aiko = (SMODS.Mods["aikoyorisshenanigans"] or {}).can_load,
    funk = (SMODS.Mods["celestial_funk_limeeffy"] or {}).can_load,
}
G.C.RANDOOM = {201/255, 0/255, 101/255, 1}
SMODS.ConsumableType{
    key = 'randmcrd',
    collection_rows = {4,5},
    name = 'Random',
    loc_txt = {
        name = 'Random Cards',
        collection = 'Random Cards',
    },
    primary_colour = G.C.WHITE,
    secondary_colour = G.C.RANDOOM,
    shop_rate = 0,
    pack_weights = {
        common = 1,
        rare = 0.5
    },
}
--load
NFS.load(Palatro.path .. 'data/Atlas/Atlas.lua')()
NFS.load(Palatro.path .. 'data/Enhance/Mint.lua')()
NFS.load(Palatro.path .. 'data/Joker/Rohamsi.lua')()
NFS.load(Palatro.path .. 'data/Joker/Title.lua')()
NFS.load(Palatro.path .. 'data/Joker/green_tree.lua')()
NFS.load(Palatro.path .. 'data/cons/Mintation.lua')()
NFS.load(Palatro.path .. 'data/cons/see.lua')()
NFS.load(Palatro.path .. 'data/cons/hcon.lua')()
-- NFS.load(Palatro.path .. 'data/cons/countries.lua')()
NFS.load(Palatro.path .. 'data/Enhance/countries.lua')()
NFS.load(Palatro.path .. 'data/Joker/art.lua')()
NFS.load(Palatro.path .. 'data/Joker/ace.lua')()
NFS.load(Palatro.path .. 'data/Joker/parsi.lua')()
NFS.load(Palatro.path .. 'data/Joker/poker_face.lua')()
NFS.load(Palatro.path .. 'data/Joker/walker.lua')()
NFS.load(Palatro.path .. 'data/Joker/Parsa.lua')()
--dorkshire tea for hard water (only when buffoonery mod is active)
		if Palatro.compat.buffoonery then
             NFS.load(Palatro.path .. 'data/Joker/dorkshire_h.lua')()
             NFS.load(Palatro.path .. 'data/Enhance/Porcelain.lua')()
		end
        NFS.load(Palatro.path .. 'data/Joker/swap_tree.lua')()
        SMODS.Sound({
            key = 'ring',
        path = 'Ring.ogg'
        })
        SMODS.Sound({
            key = 'randmusic',
        path = 'Rand.ogg',
	select_music_track = function() --unstable
		return ( G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and G.pack_cards.cards[1].ability.set == "randmcrd")
	end,
        })
NFS.load(Palatro.path .. 'data/Joker/ring_of_door.lua')()
NFS.load(Palatro.path .. 'data/Joker/jokerkala.lua')()
NFS.load(Palatro.path .. 'data/Enhance/double.lua')()
NFS.load(Palatro.path .. 'data/booster/booster.lua')()
NFS.load(Palatro.path .. 'data/Ranks/hranks.lua')()
NFS.load(Palatro.path .. 'data/Joker/nom.lua')()
NFS.load(Palatro.path .. 'data/Joker/pi.lua')()
NFS.load(Palatro.path .. 'data/Joker/sina.lua')()
NFS.load(Palatro.path .. 'data/Joker/yildizlar.lua')()
NFS.load(Palatro.path .. 'data/cons/countries.lua')()
local old_main_menu = Game.main_menu
Game.main_menu = function(change_context)
    -- color
    G.C.MY_PRIMARY   = {245/255, 203/255, 66/255, 1}   -- gold
    G.C.MY_SECONDARY = {66/255, 247/255, 165/255, 1}   -- mint-green
    G.C.TROOPS = {255/255, 68/255, 0/255, 1}

    local result = old_main_menu(change_context)

    -- background
    G.SPLASH_BACK:define_draw_steps({ {
        shader = 'splash',
        send = {
            { name = 'time',       ref_table = G.TIMERS, ref_value = 'REAL_SHADER' },
            { name = 'vort_speed', val = 0.4 },
            { name = 'colour_1',   ref_table = G.C,      ref_value = 'MY_PRIMARY' },
            { name = 'colour_2',   ref_table = G.C,      ref_value = 'MY_SECONDARY' },
        }
    } })

    -- main menu joker (base code from revo's vault)
local scale = 1.1 * 1.25

local newcard = Card(
    G.title_top.T.x,
    G.title_top.T.y,
    G.CARD_W * scale,
    G.CARD_H * scale,
    G.P_CARDS.empty,
    G.P_CENTERS.j_pal_parsi,
    { bypass_discovery_center = true }
)

G.title_top.T.w = G.title_top.T.w * scale
G.title_top.T.x = G.title_top.T.x - 0.8 

newcard:start_materialize({G.C.MY_PRIMARY, G.C.MY_SECONDARY}, true, 2.5)
G.title_top:emplace(newcard)

newcard.no_ui = true
    return result
end
SMODS.Rarity{
	key = "sum",
	loc_txt = {
		name = "Med-Rare"
	},
	badge_colour = HEX('eb9b34'),
	pools = {
		["Joker"] = true,  -- jokers with this rarity can apear in shop
    ["Joker"] = { rate = 0.5 }
	},
	get_weight = function(self, weight, object_type)
		if object_type == "Joker" then
			return weight * 0.4  -- its % of apear in the shop
		end
		return weight
	end,
}
--icon of mod
SMODS.Atlas {
	key = "modicon",
	path = "modicon.png",
	px = 34,
	py = 34
}