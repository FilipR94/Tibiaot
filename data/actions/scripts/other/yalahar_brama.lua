function onUse(cid, item, fromPosition, itemEx, toPosition)
        local newPosition = {x=32729, y=31201, z=5}
		local newPosition1 = {x=32734, y=31201, z=5}
		local newPosition2 = {x=32745, y=31161, z=5}
		local newPosition3 = {x=32745, y=31164, z=5}
		local newPosition4 = {x=32777, y=31141, z=5}
		local newPosition5 = {x=32777, y=31145, z=5}
		local newPosition6 = {x=32773, y=31116, z=7}
		local newPosition7 = {x=32780, y=31116, z=7}
		local newPosition8 = {x=32874, y=31201, z=5}
		local newPosition9 = {x=32869, y=31201, z=5}
		local newPosition10 = {x=32855, y=31251, z=5}
		local newPosition11 = {x=32855, y=31248, z=5}
		local newPosition12 = {x=32834, y=31269, z=5}
		local newPosition13 = {x=32834, y=31266, z=5}
		local stor = 100013
        if(item.itemid == 9531 and item.actionid == 51151 and getPlayerStorageValue(cid,stor) >= 6) then
                doTeleportThing(cid, newPosition, TRUE)
                doSendMagicEffect(newPosition, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
		elseif(item.itemid == 9531 and item.actionid == 51152 and getPlayerStorageValue(cid,stor) >= 6) then
                doTeleportThing(cid, newPosition1, TRUE)
                doSendMagicEffect(newPosition1, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
		elseif(item.itemid == 9534 and item.actionid == 51153 and getPlayerStorageValue(cid,stor) >= 3) then
                doTeleportThing(cid, newPosition2, TRUE)
                doSendMagicEffect(newPosition2, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
		elseif(item.itemid == 9534 and item.actionid == 51154 and getPlayerStorageValue(cid,stor) >= 3) then
                doTeleportThing(cid, newPosition3, TRUE)
                doSendMagicEffect(newPosition3, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
		elseif(item.itemid == 9531 and item.actionid == 51155 and getPlayerStorageValue(cid,stor) >= 8) then
                doTeleportThing(cid, newPosition4, TRUE)
                doSendMagicEffect(newPosition4, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
		elseif(item.itemid == 9531 and item.actionid == 51156 and getPlayerStorageValue(cid,stor) >= 8) then
                doTeleportThing(cid, newPosition5, TRUE)
                doSendMagicEffect(newPosition5, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
		elseif(item.itemid == 9534 and item.actionid == 51157) then
                doTeleportThing(cid, newPosition6, TRUE)
                doSendMagicEffect(newPosition6, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
		elseif(item.itemid == 9534 and item.actionid == 51158) then
                doTeleportThing(cid, newPosition7, TRUE)
                doSendMagicEffect(newPosition7, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
		elseif(item.itemid == 9531 and item.actionid == 51159 and getPlayerStorageValue(cid,stor) >= 10) then
                doTeleportThing(cid, newPosition8, TRUE)
                doSendMagicEffect(newPosition8, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
		elseif(item.itemid == 9531 and item.actionid == 51160 and getPlayerStorageValue(cid,stor) >= 10) then
                doTeleportThing(cid, newPosition9, TRUE)
                doSendMagicEffect(newPosition9, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
		elseif(item.itemid == 9534 and item.actionid == 51161 and getPlayerStorageValue(cid,stor) >= 11) then
                doTeleportThing(cid, newPosition10, TRUE)
                doSendMagicEffect(newPosition10, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
		elseif(item.itemid == 9534 and item.actionid == 51162 and getPlayerStorageValue(cid,stor) >= 11) then
                doTeleportThing(cid, newPosition11, TRUE)
                doSendMagicEffect(newPosition11, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
		elseif(item.itemid == 9534 and item.actionid == 51163 and getPlayerStorageValue(cid,stor) >= 4) then
                doTeleportThing(cid, newPosition12, TRUE)
                doSendMagicEffect(newPosition12, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
		elseif(item.itemid == 9534 and item.actionid == 51164 and getPlayerStorageValue(cid,stor) >= 4) then
                doTeleportThing(cid, newPosition13, TRUE)
                doSendMagicEffect(newPosition11, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
        else
        doPlayerSendTextMessage(cid,25,"The gate mechanism won't move. You probably have to find a way around until you figure out how to operate the gate.")
        end
     return true
  end