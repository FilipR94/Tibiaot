function onPrepareDeath(cid, corpse)
	if isPlayer(cid) then
		if (getPlayerLevel(cid) < 1 and getPlayerSkullType(cid) ~= nil) then
			doPlayerSetLossPercent(cid, PLAYERLOSS_ITEMS, 100)
            doPlayerSetLossPercent(cid, PLAYERLOSS_CONTAINERS, 100)
        else
            doPlayerSetLossPercent(cid, PLAYERLOSS_ITEMS, 100)
            doPlayerSetLossPercent(cid, PLAYERLOSS_CONTAINERS, 100)
		end
	end
	return true
end