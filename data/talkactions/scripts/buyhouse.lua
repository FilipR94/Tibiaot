function onSay(cid, words, param)

	local lookPos = getPlayerLookPos(cid)
	local LEVEL = getConfigInfo("levelToBuyHouse")
	local house = House.getHouseByPos(lookPos)
	if(house == nil) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You must be looking to a house to buy one.")
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, words)
		return FALSE
	end

	if(house:buy(cid)) then
		doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
	else
		doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
	end

	if(getPlayerLevel(cid) < LEVEL) then
		doPlayerSendCancel(cid, "You need level "..LEVEL.." to buy a house.")
		return TRUE
	end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, words)
	return FALSE
end