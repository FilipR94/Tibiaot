local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                    npcHandler:onThink() end
--[[Editable]]--
local customer = 11998 ---empty storage
local days = 1182930 --empty storage, must be the same as the one in the action file
local storage2 = 100168
 
local  add_days = 7 -- amount of days added per ticket
local price = 250 -- ticket price in gp
 
--[[Script]]--
function greetCallback(cid)
	talkState[cid] = 0
	if getPlayerStorageValue(cid,customer) <1 then
		selfSay("Ah ".. getCreatureName(cid).." there, right!? I have been expecting you. Seems you are interested in my little wagon system , aren't you?",cid)
	else
		if getPlayerStorageValue(cid,days) > os.time() then
			selfSay("Welcome again ".. getCreatureName(cid).."! I bet you want to ask when your subscription will end right? ",cid)
		else
			selfSay("Welcome back ".. getCreatureName(cid).."! I see your subscription have ended, do you want to re-subscribe?",cid)
		end
	end
	return npcHandler:addFocus(cid)
end
function farewellCallback(cid)
	if getPlayerStorageValue(cid,customer) < 1 then selfSay(talkState[cid] == 0 and "Humm..! Okay then, maybe you would subscribe later. Bye Bye!" or "Humm..! You dont have enough money, come back later.",cid) end
	return npcHandler:releaseFocus(cid)
end
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

    	if (msgcontains(msg, 'measurements')) and (getPlayerStorageValue(cid, storage2) == 24 and getPlayerStorageValue(cid, 100177) == -1) then
		npcHandler:say("Come on, I have no clue what they are. Better ask my armorer Kroox for such nonsense.Go and ask him for good ol' {Lokurs measurements}, he'll know.",cid)
		setPlayerStorageValue(cid, 100177,1)
	if (getPlayerStorageValue(cid,100174) == 1 and getPlayerStorageValue(cid,100175) == 1 and getPlayerStorageValue(cid,100176) == 1 and getPlayerStorageValue(cid,100178) == 1 and getPlayerStorageValue(cid,100179) == 1) then
		setPlayerStorageValue(cid,10071,29)
		setPlayerStorageValue(cid, storage2, 31)
		end
	end 
 
	if getPlayerStorageValue(cid,customer) < 1 then
		if  msgcontains(msg, 'yes') and talkState[talkUser] == 0 then
			selfSay("Well Well! You can take a ".. add_days.." days subscribtion for ".. price .." gold coins. So is it a deal?",cid)
			talkState[talkUser] = 1
		elseif msgcontains(msg, 'yes') and talkState[talkUser] == 1 then
			if doPlayerRemoveMoney(cid,price) then
				setPlayerStorageValue(cid,customer,1)
				setPlayerStorageValue(cid,days,os.time()+(add_days*24*60*60))
				selfSay("You have successfuly subscribed for ".. add_days.." days , hope you don't have any complains.",cid)
				talkState[talkUser] = 0
				npcHandler:unGreet(cid)
			else
				npcHandler:unGreet(cid)
			end
		elseif msgcontains(msg, 'no') then
			npcHandler:unGreet(cid)
		end
 
	elseif getPlayerStorageValue(cid,customer) > 0 and getPlayerStorageValue(cid,days) > os.time() then
		if  msgcontains(msg, 'yes') and talkState[talkUser] == 0 then
			selfSay("Your subscribtion will end on "..os.date("%A %d of %B at %X",getPlayerStorageValue(cid,days))..", you can renew it by then.",cid)
			npcHandler:unGreet(cid)
		elseif msgcontains(msg, 'no') and talkState[talkUser] == 0 then
			selfSay("I wonder why you came then. You know you can't renew unless your current subscribtion ends. Bye Bye!",cid)
			npcHandler:unGreet(cid)
		end
	elseif getPlayerStorageValue(cid,customer) > 0 and getPlayerStorageValue(cid,days) < os.time() then
		if  msgcontains(msg, 'yes') and talkState[talkUser] == 0 then
			if doPlayerRemoveMoney(cid,price) then
				setPlayerStorageValue(cid,days,os.time()+(add_days*24*60*60))
				selfSay("You have renewed your subscription with more ".. add_days.." days.",cid)
				npcHandler:unGreet(cid)
			else
				selfSay("Humm..! You dont have enough money, come back later.",cid)
				npcHandler:unGreet(cid)
			end
		elseif msgcontains(msg, 'no') and talkState[talkUser] == 0 then
			selfSay("Maybe later then. Bye Bye!",cid)
			npcHandler:unGreet(cid)
		end
 
 
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_FAREWELL, farewellCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())