function onStepIn(cid, item, pos)

local tpout = {x=32784, y=31178, z=9}
local tpin = {x=32784, y=31174, z=10}
local tp = {x=32778, y=31171, z=14}

    if item.actionid == 9105 then
		doTeleportThing(cid,tpin)
		doSendMagicEffect(getCreaturePosition(cid),10)
		doCreatureSay(cid,"The apparatus in the centre looks odd! You should inspect it.", TALKTYPE_MONSTER)
	elseif item.actionid == 9106 then
		doTeleportThing(cid,tpout)
		doSendMagicEffect(getCreaturePosition(cid),10)
	elseif item.actionid == 24061 then
		doTeleportThing(cid,tp)
		doSendMagicEffect(getCreaturePosition(cid),10)
        end
        return true
end
