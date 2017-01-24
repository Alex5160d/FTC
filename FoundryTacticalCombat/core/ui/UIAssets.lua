--[[----------------------------------------------------------
    INITIALIZE UI ASSETS
  ]] ----------------------------------------------------------

FTC.UI.Fonts = {
	["meta"] = "FoundryTacticalCombat/lib/fonts/Metamorphous.otf",
	["standard"] = "EsoUi/Common/Fonts/Univers57.otf",
	["esobold"] = "EsoUi/Common/Fonts/Univers67.otf",
	["antique"] = "EsoUI/Common/Fonts/ProseAntiquePSMT.otf",
	["handwritten"] = "EsoUI/Common/Fonts/Handwritten_Bold.otf",
	["trajan"] = "EsoUI/Common/Fonts/TrajanPro-Regular.otf",
	["futura"] = "EsoUI/Common/Fonts/FuturaStd-CondensedLight.otf",
	["futurabold"] = "EsoUI/Common/Fonts/FuturaStd-Condensed.otf",
}

FTC.UI.Textures = {
	["grainy"] = 'FoundryTacticalCombat/lib/textures/grainy.dds',
	["regenLg"] = 'FoundryTacticalCombat/lib/textures/regen_lg.dds',
	["regenSm"] = 'FoundryTacticalCombat/lib/textures/regen_sm.dds',
}

--[[----------------------------------------------------------
    FONTS
  ]] ----------------------------------------------------------

--[[
 * Translate between font name and tag
 * --------------------------------
 * Called by FTC.Menu:Controls()
 * --------------------------------
 ]] --
function FTC.UI:TranslateFont(font)

	-- Maintain a translation between tags and names
	local fonts = {
		['meta'] = "Metamorphous",
		["standard"] = "ESO Standard",
		["esobold"] = "ESO Bold",
		["antique"] = "Prose Antique",
		["handwritten"] = "Handwritten",
		["trajan"] = "Trajan Pro",
		["futura"] = "Futura Standard",
		["futurabold"] = "Futura Bold",
	}

	-- Iterate through the table matching
	for k, v in pairs(fonts) do
		if (font == k) then return v
		elseif (font == v) then return k
		end
	end
end

--[[
 * Retrieve requested font, size, and style
 * --------------------------------
 * Called at control creation
 * --------------------------------
 ]] --
function FTC.UI:Font(font, size, shadow)

	local font = (FTC.UI.Fonts[font] ~= nil) and FTC.UI.Fonts[font] or font
	local size = size or 14
	local shadow = shadow and '|soft-shadow-thick' or ''

	-- Return font
	return font .. '|' .. size .. shadow
end

--[[----------------------------------------------------------
    ICONS
  ]] ----------------------------------------------------------

function FTC.UI:GetAbilityIcons()

	-- Iterate over categories, lines, and abilities
	for c = 1, 8 do
		for l = 1, 10 do
			for a = 1, 10 do

				-- Load ability info into table
				local name, texture, rank, actionSlotType, passive, showInSpellbook = GetSkillAbilityInfo(c, l, a)
				if (name ~= "") then FTC.UI.Textures[name] = texture end
			end
		end
	end

	-- Add additional custom icons
	local custom = {
		-- Status Effects
		[776] = '/esoui/art/icons/death_recap_poison_aoe.dds', -- Poisoned
		[1339] = '/esoui/art/icons/ability_dragonknight_004_b.dds', -- Burning
		[2445] = '/esoui/art/icons/death_recap_bleed.dds', -- Bleed
		[6035] = '/esoui/art/icons/death_recap_bleed.dds', -- Bleeding
		[8041] = '/esoui/art/icons/death_recap_fire_aoe.dds', -- Explosion
		[21925] = '/esoui/art/icons/death_recap_disease_aoe.dds', -- Diseased
		[21928] = '/esoui/art/icons/death_recap_disease_aoe.dds', -- Pestilence
		[58856] = '/esoui/art/icons/death_recap_disease_aoe.dds', -- Infection

		-- Environmental
		[11338] = '/esoui/art/icons/death_recap_environmental.dds', -- Lava
		[5139] = '/esoui/art/icons/death_recap_environmental.dds', -- In Lava
		[21132] = '/esoui/art/icons/death_recap_environmental.dds', -- Intense Cold

		-- Defenses
		[2890] = '/esoui/art/icons/ability_warrior_030.dds', -- Block
		[30869] = '/esoui/art/icons/ability_mage_058.dds', -- Absorb
		[30934] = '/esoui/art/icons/ability_rogue_037.dds', -- Dodge
		[20309] = '/esoui/art/icons/ability_rogue_044.dds', -- Hidden
		[24684] = '/esoui/art/icons/ability_rogue_044.dds', -- Stealth
		[16565] = '/esoui/art/icons/ability_warrior_032.dds', -- CC Breaker

		-- Weapon Attacks
		[4858] = '/esoui/art/icons/ability_warrior_011.dds', -- Bash
		[7880] = '/esoui/art/icons/death_recap_melee_basic.dds', -- Light Attack
		[7095] = '/esoui/art/icons/death_recap_melee_heavy.dds', -- Heavy Attack
		[16420] = '/esoui/art/icons/ability_warrior_013.dds', -- Heavy Attack (Dual Wield)

		-- Weapon Abilities
		[29293] = '/esoui/art/icons/ability_dualwield_001.dds', -- Twin Slashes Bleed
		[38841] = '/esoui/art/icons/ability_dualwield_001.dds', -- Rending Slashes Bleed
		[38848] = '/esoui/art/icons/ability_dualwield_001.dds', -- Blood Craze Bleed
		--[xxxxx] = ,                                                             -- Blade Cloak

		[38401] = '/esoui/art/icons/ability_1handed_003.dds', -- Shielded Assault

		[28385] = '/esoui/art/icons/ability_restorationstaff_004.dds', -- Grand Healing
		[8205] = '/esoui/art/icons/ability_restorationstaff_002.dds', -- Regeneration

		[29078] = '/esoui/art/icons/ability_destructionstaff_005.dds', -- Frost Touch
		[29089] = '/esoui/art/icons/ability_destructionstaff_006.dds', -- Shock Touch
		[4539] = '/esoui/art/icons/ability_destructionstaff_007.dds', -- Flame Touch
		[62648] = '/esoui/art/icons/ability_destructionstaff_007.dds', -- Fire Touch
		[39145] = '/esoui/art/icons/ability_destructionstaff_010.dds', -- Fire Ring
		[39146] = '/esoui/art/icons/ability_destructionstaff_008.dds', -- Frost Ring
		[39147] = '/esoui/art/icons/ability_destructionstaff_009.dds', -- Shock Ring
		-- Wall of Elements
		-- Weapon Enchantments
		[3653] = '/esoui/art/icons/ability_healer_033.dds', -- Replenish
		[5187] = '/esoui/art/icons/death_recap_poison_melee.dds', -- Poisoned Weapon
		[17895] = '/esoui/art/icons/death_recap_fire_melee.dds', -- Fiery Weapon
		[17897] = '/esoui/art/icons/death_recap_cold_melee.dds', -- Frozen Weapon
		[17899] = '/esoui/art/icons/death_recap_shock_melee.dds', -- Charged Weapon
		[17904] = '/esoui/art/icons/death_recap_disease_melee.dds', -- Befouled Weapon
		[28919] = '/esoui/art/icons/ability_healer_031.dds', -- Life Drain
		[40337] = '/esoui/art/icons/ability_rogue_008.dds', -- Prismatic Weapon
		[46743] = '/esoui/art/icons/death_recap_magic_melee.dds', -- Absorb Magicka
		[46746] = '/esoui/art/icons/death_recap_magic_melee.dds', -- Absorb Stamina
		[46215] = '/esoui/art/icons/ability_mage_002.dds', -- Damage Health
		[47405] = '/esoui/art/icons/death_recap_cold_ranged.dds', -- Frozen Weapon and Hardening

		-- Dragonknight
		[23105] = '/esoui/art/icons/ability_dragonknight_001_a.dds', -- Flame Lash Heal
		[20320] = '/esoui/art/icons/ability_dragonknight_007.dds', -- Spiked Armor Damage Return
		[20324] = '/esoui/art/icons/ability_dragonknight_007_a.dds', -- Volatile Armor Damage Return
		[20329] = '/esoui/art/icons/ability_dragonknight_007_b.dds', -- Hardened Armor Damage Return
		[31859] = '/esoui/art/icons/ability_dragonknight_012.dds', -- Inhale Heal
		[29037] = '/esoui/art/icons/ability_dragonknight_014.dds', -- Petrify

		-- Sorcerer
		[18719] = '/esoui/art/icons/ability_sorcerer_thunder_burst.dds', -- Mages' Fury Explosion
		[23682] = '/esoui/art/icons/ability_sorcerer_critical_surge.dds', -- Surge Heal
		[19128] = '/esoui/art/icons/ability_sorcerer_thunder_burst.dds', -- Mages' Wrath Explosion
		[19120] = '/esoui/art/icons/ability_sorcerer_thunder_burst.dds', -- Endless Fury Explosion
		[24792] = '/esoui/art/icons/ability_sorcerer_016.dds', -- Overload Light Attack
		[24794] = '/esoui/art/icons/ability_sorcerer_016.dds', -- Overload Heavy Attack
		[24587] = '/esoui/art/icons/ability_sorcerer_dark_exchange.dds', -- Dark Exchange Heal
		[21493] = '/esoui/art/icons/death_recap_shock_aoe.dds', -- Disintegration

		-- Nightblade
		[33195] = '/esoui/art/icons/ability_nightblade_010.dds', -- Path of Darkness
		[2383] = '/esoui/art/icons/ability_nightblade_001.dds', -- Gloom Bolt
		[33219] = '/esoui/art/icons/ability_nightblade_001.dds', -- Corrode
		[33326] = '/esoui/art/icons/ability_nightblade_006.dds', -- Cripple
		[61907] = '/esoui/art/icons/ability_rogue_058.dds', -- Assassin's Will
		[61932] = '/esoui/art/icons/ability_rogue_058.dds', -- Assassin's Will

		-- Templar
		[22138] = '/esoui/art/icons/ability_templar_radial_sweep.dds', -- Radial Sweep
		[22304] = '/esoui/art/icons/ability_templar_cleansing_ritual.dds', -- Healing Ritual
		[26824] = '/esoui/art/icons/ability_templar_restoring_sigil.dds', -- Repentance Heal
		[26879] = '/esoui/art/icons/ability_templarsun_thrust.dds', -- Blazing Spear Pulse
		[63029] = '/esoui/art/icons/ability_templar_over_exposure.dds', -- Radiant Destruction

		-- Racials
		[36214] = '/esoui/art/icons/ability_dragonknight_028.dds', -- Star of the West

		-- Guilds
		[35713] = '/esoui/art/icons/ability_fightersguild_005.dds', -- Dawnbreaker

		-- Werewolf and Vampire
		[32480] = '/esoui/art/icons/ability_werewolf_002_b.dds', -- Heavy Attack Werewolf
		[33152] = '/esoui/art/icons/ability_vampire_002.dds', -- Feed

		-- Champion Abilities
		[60370] = '/esoui/art/icons/ability_healer_026.dds', -- Critical Leech
		[60407] = '/esoui/art/icons/ability_warrior_011.dds', -- Invigorating Bash
		[61660] = '/esoui/art/icons/ability_healer_003.dds', -- Resilient

		-- Synergies
		[23196] = '/esoui/art/icons/ability_sorcerer_thunder_burst.dds', -- Conduit
		[18076] = '/esoui/art/icons/ability_mage_001.dds', -- Impale
		[25440] = '/esoui/art/icons/ability_rogue_052.dds', -- Slip Away
		[26832] = '/esoui/art/icons/gear_nord_staff_d.dds', -- Blessed Shards
		[26858] = '/esoui/art/icons/gear_nord_staff_d.dds', -- Luminous Shards
		[41838] = '/esoui/art/icons/ability_warrior_010.dds', -- Radiate
		[32910] = '/esoui/art/icons/ability_mage_023.dds', -- Shackle
		[31538] = '/esoui/art/icons/ability_healer_013.dds', -- Supernova
		[31603] = '/esoui/art/icons/ability_healer_013.dds', -- Gravity Crush
		[22260] = '/esoui/art/icons/ability_healer_028.dds', -- Purify
		[3263] = '/esoui/art/icons/ability_mage_057.dds', -- Combustion

		-- Pet Attacks
		[3757] = '/esoui/art/icons/ability_sorcerer_unstable_clannfear.dds', -- Claw
		[4799] = '/esoui/art/icons/ability_sorcerer_unstable_clannfear.dds', -- Tail Spike
		-- Zap
		-- Familiar Melee
		[23659] = '/esoui/art/icons/ability_sorcerer_storm_atronach.dds', -- Atronach
		[23428] = '/esoui/art/icons/ability_sorcerer_storm_atronach.dds', -- Atronach Zap

		-- Items
		[9866] = '/esoui/art/icons/consumable_potion_001_type_005.dds', -- Restore Health
		[17302] = '/esoui/art/icons/consumable_potion_001_type_005.dds', -- Restore Health

		-- AvA Damage
		[7011] = '/esoui/art/icons/ava_siege_ui_001.dds', -- Ballista Bolt
		[14361] = '/esoui/art/icons/ava_siege_ui_001.dds', -- Fire Ballista Bolt
		[66239] = '/esoui/art/icons/ava_siege_ui_001.dds', -- Cold Fire Ballista Bolt
		[13853] = '/esoui/art/icons/crafting_heavy_armor_sp_names_001.dds', -- Wall Repair Kit
		[14156] = '/esoui/art/icons/ava_siege_ammo_004.dds', -- Stone Trebuchet
		[7007] = '/esoui/art/icons/ava_siege_ammo_004.dds', -- Firepot Trebuchet
		[13550] = '/esoui/art/icons/ava_siege_ammo_004.dds', -- Iceball Trebuchet
		[14610] = '/esoui/art/icons/ava_siege_ammo_003.dds', -- Scattershot Catapult
		[14773] = '/esoui/art/icons/ava_siege_ammo_003.dds', -- Meatbag Catapult
		[16788] = '/esoui/art/icons/ava_siege_ammo_003.dds', -- Meatbag Catapult
		[15774] = '/esoui/art/icons/ava_siege_weapon_002.dds', -- Flaming Oil
		[16723] = '/esoui/art/icons/crafting_forester_weapon_component_005.dds', -- Door Repair Kit
		[35099] = '/esoui/art/icons/ava_siege_ammo_002.dds', -- Ice Damage
		[35129] = '/esoui/art/icons/ava_siege_weapon_002.dds', -- Oil Pot
		[12355] = '/esoui/art/icons/ava_siege_ui_002.dds', -- Destroy Siege Weapon

		-- Item Procs
		[16536] = '/esoui/art/icons/ability_mageguild_005.dds', -- Meteor
		[59541] = '/esoui/art/icons/quest_dungeons_razaks_opus.dds', -- Dwemer Automation Restore HP
		[59593] = '/esoui/art/icons/ability_mage_020.dds', -- Lich Crystal

		--[[
		-- some reflected skills
		['Quick Shot']                      = '/esoui/art/icons/death_recap_ranged_basic.dds', -- EN
		['Coiled Lash']                     = '/esoui/art/icons/death_recap_ranged_basic.dds', -- EN
		['Throw Dagger']                    = '/esoui/art/icons/ability_rogue_026.dds', -- EN
		['Flare']                           = '/esoui/art/icons/death_recap_fire_ranged.dds', -- EN
		['Ice Arrow']                       = '/esoui/art/icons/death_recap_cold_ranged.dds', -- EN
		['Entropic Flare']                  = '/esoui/art/icons/death_recap_magic_ranged.dds', -- EN
		['Necrotic Spear']                  = '/esoui/art/icons/death_recap_magic_ranged.dds', -- EN
		['Chasten']                         = '/esoui/art/icons/death_recap_magic_ranged.dds', -- EN
		['Minor Wound']                     = '/esoui/art/icons/death_recap_magic_ranged.dds', -- EN
		]] --
	}
	for k, v in pairs(custom) do
		FTC.UI.Textures[GetAbilityName(k)] = v
	end
end

