local config = {
    ["Monday"] = {pos = {x=32209, y=31158, z=7},	frompos = {x=32202, y=31153, z=7},	topos = {x=32218, y=31161, z=7}}, -- DankWart - Svargrond

    ["Tuesday"] = {pos = {x=32290, y=32831, z=7},	frompos = {x=32288, y=32830, z=7},	topos = {x=32294, y=32837, z=7}}, -- Lyonel - Liberty Bay

    ["Wednesday"] = {pos = {x=32579, y=32754, z=7},	frompos = {x=32572, y=32751, z=7},	topos = {x=32581, y=32757, z=7}}, -- Clyde - Port Hope

    ["Thursday"] = {pos = {x=33066, y=32880, z=6},	frompos = {x=33065, y=32876, z=6},	topos = {x=33071, y=32887, z=6}}, -- Arito - Ankrahmun

    ["Friday"] = {pos = {x=33239, y=32483, z=7},	frompos = {x=33238, y=32482, z=7},	topos = {x=33240, y=32484, z=7}}, -- Miraia - Darishia

    ["Saturday"] = {pos = {x=33171, y=31810, z=6},	frompos = {x=33165, y=31806, z=6},	topos = {x=33175, y=31816, z=7}}, -- Mirabell - Edron

    ["Sunday"] = {pos = {x=32326, y=31783, z=6},	frompos = {x=32324, y=31779, z=6},	topos = {x=32330, y=31786, z=6}} -- Carlin Depot 2floor
}
 
function onStartup()
	local dzienTygodnia = config[os.date("%A")]
	local npck = getCreatureByName("Rashid")
 
	if isNpc(npck) then
		if (isInRange(getThingPosition(npck), dzienTygodnia.frompos, dzienTygodnia.topos)) then
			return true
		else
		    doRemoveCreature(npck, dzienTygodnia.pos)
			doCreateNpc("Rashid", dzienTygodnia.pos)
		end
	else
		local effect = CONST_ME_MAGIC_RED
		errors(false)
		local ret = doCreateNpc("Rashid", dzienTygodnia.pos)
		errors(true)
 
		if(tonumber(ret) == nil) then
			effect = CONST_ME_POFF
		end
 
		doSendMagicEffect(dzienTygodnia.pos, effect)
	end
 
	return true
end