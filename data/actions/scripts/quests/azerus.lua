local topLeft = {x=32776, y=31158, z=10}
local bottomRight = {x=32790, y=31175, z=10}

local entry = {x=32784, y=31177, z=9}
local tp = {x=32783, y=31175, z=10}
local glo = {x=32783, y=31166, z=10}

local function getCreaturesInArea()
	local t = {}
	for x = topLeft.x, bottomRight.x do
		for y = topLeft.y, bottomRight.y do
			for z = topLeft.z, bottomRight.z do
				local c = getTopCreature({x=x, y=y, z=z})
				if c.type == 2 then
					table.insert(t, c.uid)
				end
			end
		end
	end

	local c = getTopCreature({x=32781, y=31157, z=10})
	if c.type == 2 then
		table.insert(t, c.uid)
	end

	return t
end

local function summon(name, pos)
	doCreateMonster(name, pos, true)
	doSendMagicEffect(pos, CONST_ME_TELEPORT)
end

local function reset()
	local m, p = {}, {}
	for x = topLeft.x, bottomRight.x do
		for y = topLeft.y, bottomRight.y do
			for z = topLeft.z, bottomRight.z do
				local c = getTopCreature({x=x, y=y, z=z})
				if c.type == 1 then
					table.insert(p, c.uid)
				elseif c.type == 2 then
					table.insert(m, c.uid)
				end
			end
		end
	end

	local c = getTopCreature({x=32781, y=31157, z=10})
	if c.type == 1 then
		table.insert(p, c.uid)
	elseif c.type == 2 then
		table.insert(m, c.uid)
	end

	if #p ~= 0 and #m ~= 0 then
		addEvent(reset, 300*1000)
	else
		if #m ~= 0 then
			for i = 1, #m do
				doRemoveCreature(m[i])
			end
		end
		if #p ~= 0 then
			for i = 1, #p do
				doTeleportThing(p[i], {x=32782, y=31179, z=9})
			end
		end
		doTransformItem(getTileItemById(tp, 9772).uid, 1387)
		doTransformItem(getTileItemById(entry, 9772).uid, 1387)
		doItemSetAttribute(getTileItemById(glo, 9767).uid, 'aid', 58261)
	end
end

local function SeventhWave()
	for _, monster in ipairs(getCreaturesInArea()) do
		if getCreatureName(monster) == 'Azerus' then
			doTeleportThing(monster, {x= glo.x - 7,y=glo.y,z=glo.z})
			break
		end
	end
	summon('War Golem', {x= glo.x - 2,y=glo.y,z=glo.z})
	summon('War Golem', {x= glo.x + 2,y=glo.y,z=glo.z})
	summon('War Golem', {x= glo.x - 1,y=glo.y,z=glo.z})
	summon('War Golem', {x= glo.x + 1,y=glo.y,z=glo.z})
	addEvent(reset, 1)
end

local function FourthWave()
	for _, m in ipairs(getCreaturesInArea()) do
		if getCreatureName(m) == 'Azerus' then
			doRemoveCreature(m)
			break
		end
	end
	summon('Azerus1', {x=glo.x,y=glo.y - 5,z=glo.z})
	summon('War Golem', {x= glo.x - 7,y=glo.y,z=glo.z})
	summon('War Golem', {x= glo.x + 7,y=glo.y,z=glo.z})
	summon('War Golem', {x= glo.x - 6,y=glo.y,z=glo.z})
	summon('War Golem', {x= glo.x + 6,y=glo.y,z=glo.z})
	addEvent(SeventhWave, 20*1000)
end

local function ThirdWave1()
	summon('Rift Scythe', {x=glo.x,y=glo.y + 4,z=glo.z})
	summon('Rift Scythe', {x=glo.x,y=glo.y - 4,z=glo.z})
	summon('Rift Scythe', {x=glo.x,y=glo.y + 5,z=glo.z})
	addEvent(FourthWave, 20*1000)
end

local function ThirdWave()
	for _, m in ipairs(getCreaturesInArea()) do
		if getCreatureName(m) == 'Azerus' then
			doTeleportThing(m, {x=glo.x,y=glo.y + 4,z=glo.z})
			break
		end
	end
	summon('Rift Scythe', {x= glo.x - 4,y=glo.y,z=glo.z})
	summon('Rift Scythe', {x= glo.x + 4,y=glo.y,z=glo.z})
	summon('Rift Scythe', {x= glo.x + 4,y=glo.y,z=glo.z})
	summon('Rift Scythe', {x=glo.x,y=glo.y + 4,z=glo.z})
	addEvent(ThirdWave1, 20*1000)
end

local function SixthWave()
	summon('Rift Brood', {x= glo.x - 4,y=glo.y,z=glo.z})
	summon('Rift Brood', {x= glo.x + 4,y=glo.y,z=glo.z})
	summon('Rift Brood', {x=glo.x,y=glo.y + 4,z=glo.z})
	summon('Rift Brood', {x=glo.x,y=glo.y - 4,z=glo.z})
	summon('Rift Brood', {x=glo.x,y=glo.y + 5,z=glo.z})
	addEvent(ThirdWave, 20*1000)
end

local function SecondWave()
	for _, m in ipairs(getCreaturesInArea()) do
		if getCreatureName(m) == 'Azerus' then
			doTeleportThing(m, {x= glo.x - 4,y=glo.y,z=glo.z})
			break
		end
	end
	summon('Rift Brood', {x= glo.x - 4,y=glo.y,z=glo.z})
	summon('Rift Brood', {x= glo.x + 4,y=glo.y,z=glo.z})
	summon('Rift Brood', {x=glo.x,y=glo.y + 4,z=glo.z})
	summon('Rift Brood', {x=glo.x,y=glo.y - 4,z=glo.z})
	summon('Rift Brood', {x=glo.x,y=glo.y + 5,z=glo.z})
	addEvent(SixthWave, 20*1000)
end

local function FifthWave()
	summon('Rift Worm', {x= glo.x - 4,y=glo.y,z=glo.z})
	summon('Rift Worm', {x= glo.x + 4,y=glo.y,z=glo.z})
	summon('Rift Worm', {x=glo.x,y=glo.y + 4,z=glo.z})
	summon('Rift Worm', {x=glo.x,y=glo.y - 4,z=glo.z})
	summon('Rift Worm', {x=glo.x,y=glo.y + 5,z=glo.z})
	addEvent(SecondWave, 20*1000)
end

local function FirstWave() 
	summon('Rift Worm', {x= glo.x - 4,y=glo.y,z=glo.z})
	summon('Rift Worm', {x= glo.x + 4,y=glo.y,z=glo.z})
	summon('Rift Worm', {x=glo.x,y=glo.y + 4,z=glo.z})
	summon('Rift Worm', {x=glo.x,y=glo.y - 4,z=glo.z})
	summon('Rift Worm', {x=glo.x,y=glo.y + 5,z=glo.z})
	summon('Azerus', {x=glo.x,y=glo.y - 5,z=glo.z})
	addEvent(FifthWave, 15*1000)
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid == 58261 then
---------------------------------------
	local g = getCreaturePosition(cid)
    local amountOfPlayers = 1
 
    local centerPos = {x = g.x, y = g.y, z = g.z, stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE}
    local rangeX = 7
    local rangeY = 7
    local p = getSpectators(centerPos, rangeX, rangeY)  
 
    local players = #p
    if players >= amountOfPlayers then
	   for _, pid in pairs(p) do
           		doItemSetAttribute(item.uid, 'aid', 58263)
		doTransformItem(getTileItemById(tp, 1387).uid, 9772)
		doTransformItem(getTileItemById(entry, 1387).uid, 9772)
		for x = 32779, 32787, 8 do
			for y = 31161, 31171, 10 do      
				doSendMagicEffect({x=x, y=y, z=10}, CONST_ME_HOLYAREA)
			end
		end
		addEvent(FirstWave, 10*1000)
	   end
    else
	    doPlayerSendTextMessage(cid, 25, "You need atleast 5 players.")
	    doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
end
-----------------------------------------
	elseif item.actionid == 58263 then
		doCreatureSay(cid, 'You have to wait some time before this globe charges.', TALKTYPE_ORANGE_1, false, cid)
	end
	return true
end