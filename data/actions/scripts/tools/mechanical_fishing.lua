local config = {
        waterIds = {493, 4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625},
        rateSkill = getConfigValue("rateSkill"),
        allowFromPz = false,
        useNails = true
}

--water elementals config
local find_anything = 30 -- chance to find anything.
local difficulty = 20 -- 1-100 range for difficulty. The higher it is, the less likely it is that player will get a good item

local items = {
[10499] = {2238, 2226, 2148, 2376, 2509, 2168, 7588, 2169, 7589, 2152, 2146, 2149, 7632, 7633, 9811, 9808, 8764, 10220}, -- normal water and massive. I noticed that they are the same one.(based on tibiawikia) QuaS
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
local  fromPos = {x=32736, y=31142, z=8}
local toPos = {x=32856, y=31297, z=8}
if isInRange(getPlayerPosition(cid), fromPos, toPos) then
   if math.random(100) <= 50 then
      doSetMonsterOutfit(cid, "Skeleton", 200)
      doTargetCombatHealth(0, cid, COMBAT_ENERGYDAMAGE, -35, -35, 11)
      doCreatureSay(cid,"Yikes! That DID hurt!",TALKTYPE_ORANGE_1)
end
        if items[itemEx.itemid] ~= nil then
              if math.random(100) <= find_anything then
                        doTransformItem(itemEx.uid, 2016)
                        doDecayItem(itemEx.uid)
                        doSendMagicEffect(toPosition, 1)
                else
                        local geti = items[itemEx.itemid]
                        local newId
                        for i = 1, #items[itemEx.itemid] do
                                local x = math.random(100)
                                                        if (x < difficulty) then
                                                        newId = geti[i]
                                                        break
                                                        elseif (i >= #items[itemEx.itemid]) then
                                                        newId = geti[#items[itemEx.itemid]]
                                                        end    
                        end

                        doTransformItem(itemEx.uid, 2016)
                        doPlayerAddItem(cid, newId, 1)
                        doSendMagicEffect(toPosition, 1)

                end
        end

        if(not isInArray(config.waterIds, itemEx.itemid)) then
                return false
        end

        if((config.allowFromPz or not getTileInfo(getCreaturePosition(cid)).protection) and itemEx.itemid ~= 493 and
                math.random(1, (100 + (getPlayerSkill(cid, SKILL_FISHING) / 10))) < getPlayerSkill(cid, SKILL_FISHING) and
                (not config.useNails or (getPlayerItemCount(cid, ITEM_NAIL) > 0 and doPlayerRemoveItem(cid, ITEM_NAIL, 1)))) then
		if (getPlayerStorageValue(cid, 100000) == 3) then
		   setPlayerStorageValue(cid,100063, 4)
		end
                doPlayerAddItem(cid, ITEM_MECHANICAL_FISH, 1)
                doPlayerAddSkillTry(cid, SKILL_FISHING, config.rateSkill)
		doCreatureSay(cid,"You have caught one of the elusive mechanical fishes!",TALKTYPE_ORANGE_1)
        end

        doSendMagicEffect(toPosition, CONST_ME_LOSEENERGY)
	end
        return true
end 