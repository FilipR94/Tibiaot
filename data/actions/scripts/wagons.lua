local positions = {
				--[[ Here is how it goes if player clicked the wagon which is on pos1 then he goes to that on pos2 and vice-versa]]--
					[1] = { pos1 = {x=32624,y=31920,z=11}, pos2 = {x=32672,y=31974,z=15} }, -- Steamship --
					[2] = { pos1 = {x=32627,y=31920,z=11}, pos2 = {x=32604,y=31904,z=9} },	-- Lojas --
					[3] = { pos1 = {x=32629,y=31920,z=11}, pos2 = {x=32658,y=31901,z=8} },	-- Depot --
					[4] = { pos1 = {x=32632,y=31920,z=11}, pos2 = {x=32574,y=31969,z=9} },	-- Portão principal --

					[5] = { pos1 = {x=32574,y=31969,z=9}, pos2 = {x=32658,y=31901,z=8} },	-- Depot --
					[6] = { pos1 = {x=32574,y=31972,z=9}, pos2 = {x=32604,y=31904,z=9} },	-- Lojas --
					[8] = { pos1 = {x=32574,y=31975,z=9}, pos2 = {x=32627,y=31921,z=11} },	-- Templo --
					[9] = { pos1 = {x=32574,y=31978,z=9}, pos2 = {x=32672,y=31974,z=15} }, -- Steamship --

					[10] = { pos1 = {x=32653,y=31901,z=8}, pos2 = {x=32672,y=31974,z=15} }, -- Steamship --
					[11] = { pos1 = {x=32656,y=31901,z=8}, pos2 = {x=32604,y=31904,z=9} },	-- Lojas --
					[12] = { pos1 = {x=32658,y=31901,z=8}, pos2 = {x=32627,y=31921,z=11} },	-- Templo --
					[13] = { pos1 = {x=32661,y=31901,z=8}, pos2 = {x=32574,y=31969,z=9} },	-- Portão principal --

					[14] = { pos1 = {x=32672,y=31974,z=15}, pos2 = {x=32604,y=31904,z=9} },	-- Lojas --
					[15] = { pos1 = {x=32675,y=31974,z=15}, pos2 = {x=32658,y=31901,z=8} },	-- Depot --
					[16] = { pos1 = {x=32677,y=31974,z=15}, pos2 = {x=32627,y=31921,z=11} },-- Templo --
					[17] = { pos1 = {x=32680,y=31974,z=15}, pos2 = {x=32574,y=31969,z=9} },	-- Portão principal --

					[18] = { pos1 = {x=32616,y=31901,z=9}, pos2 = {x=32618,y=31945,z=7} },	--Big Old One 1--
					[19] = { pos1 = {x=32618,y=31901,z=9}, pos2 = {x=32599,y=31888,z=7} },	--Big Old One 2--
					[20] = { pos1 = {x=32620,y=31901,z=9}, pos2 = {x=32578,y=31928,z=0} }	--Big Old One 3--

}
local days = 1182930 --empty storage, must be the same as the one in the npc file
 
function isWalkable(pos)
	if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
	for i = 0, 255 do
		pos.stackpos = i
		local tile = getTileThingByPos(pos)
		if tile.itemid ~= 0 and not isCreature(tile.uid) then
			if hasProperty(tile.uid, 2) or hasProperty(tile.uid, 7) then
				return false
			end
		end
	end
	return true
end
function doTeleportToClosestFree(cid,pos, x, y)
	local places = getArea(pos, 1, 1)
	for i = 1,#places do
		if isWalkable(places[i],false,true) then return doTeleportThing(cid,places[i]) and doSendMagicEffect(places[i],10) and true end
	end
	return false
end
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local Teleport_to,p = false,toPosition
	if getPlayerStorageValue(cid,days) < os.time() then return doPlayerSendCancel(cid,getPlayerStorageValue(cid,days) > 0 and "Your subscription have ended." or "You havn't subscribed yet.") and doSendMagicEffect(p,2) end
	for k,v in pairs(positions) do
		if doComparePositions(p, v.pos1) or doComparePositions(p, v.pos2) then Teleport_to = doComparePositions(p, v.pos1) and v.pos2 or v.pos1 break end
	end
	if not Teleport_to then return doPlayerSendCancel(cid,"wagon is out of service.") and doSendMagicEffect(p,2) end	
	if not doTeleportToClosestFree(cid,Teleport_to, 1, 1) then return doPlayerSendCancel(cid,"You need to inform wagon master about this rail block.") and doSendMagicEffect(p,2) end
	return true
end