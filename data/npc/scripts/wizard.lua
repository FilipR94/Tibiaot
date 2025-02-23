--------------------------------------------------------------------------------------------
------------------------------------ Advanced Addon NP
---------Script made by teh_pwnage (Revamped for The Forgotten Server by Rynwar)
--------------- Special thanks to: mokerhamer, Xidaozu and Jiddo, deaths'life --------------
------------------------------- Thanks also to everyone else -------------------------------
------------------------------ NPC based on Evolutions V0.7.7 ------------------------------
--------------------------------------------------------------------------------------------

local keywordHandler = KeywordHandler:new() 
local npcHandler = NpcHandler:new(keywordHandler) 
NpcSystem.parseParameters(npcHandler) 
local talkState = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end

-- INFO: NPC Lugri (wizard addons 1 e 2)
-- UnderWar.Org

function creatureSayCallback(cid, type, msg)
	-- Sistema de Checagem de Logs.
	CheckLogs = getConfigValue('checklogs')
	if(CheckLogs == true)then
		local scriptfile = "wizard.lua"
		local ppos = getCreaturePosition(cid)
		doWriteLogFile('UnderWarLOG.txt', "".. os.date("[%d %B %Y %X] ", os.time()) .."".. getCreatureName(cid) .." has used npc: ".. scriptfile ..". Position:["..  ppos.x ..", "..  ppos.y ..", "..  ppos.z .."].")
	end
	-- FIM do Sistema.	
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid	

        addon_need_premium = "Sorry, you need a premium account to get addons." 
        addon_have_already = "Sorry, you already have this addon." 
        addon_have_not_items = "Sorry, you don\'t have these items." 
        addon_give = "Here you are." 
        player_gold = getPlayerItemCount(cid,2148) 
        player_plat = getPlayerItemCount(cid,2152)*100 
        player_crys = getPlayerItemCount(cid,2160)*10000 
        player_money = player_gold + player_plat + player_crys 
         
        if msgcontains(msg, 'addon') or msgcontains(msg, 'outfit') or msgcontains(msg, 'wizard') then
            npcHandler:say("I can give you the {first} and the {second} wizard addons.", cid)
        elseif msgcontains(msg, 'help') or msgcontains(msg, 'job') then
            npcHandler:say("I am a priest of Zathroth, the bringer of dark secrets. Anyway, did you like my {outfit}?", cid) 
------------------------------------------------ addon ------------------------------------------------ 
        -- First Wizard Addon
		elseif msgcontains(msg, 'first') then
            if isPremium(cid) then 
                if getPlayerItemCount(cid,5922) >= 50 then 
				
                    npcHandler:say("Did you bring me 50 holy orchids?", cid) 
                    talkState[talkUser] = 21
                else 
                    npcHandler:say("I need 50 holy orchids to give you the first wizard addon. Come back when you have them.", cid) 
                    talkState[talkUser] = 0 
                end 
            else 
                npcHandler:say(addon_need_premium, cid) 
                talkState[talkUser] = 0 
            end 
		-- Second Wizard Addon
		elseif msgcontains(msg, 'second') then 
            if isPremium(cid) then 
                if getPlayerItemCount(cid,2488) >= 1 and getPlayerItemCount(cid,2123) >= 1 and getPlayerItemCount(cid,2492) >= 1 and getPlayerItemCount(cid,2536) >= 1 then 
                    npcHandler:say("Did you bring me a medusa shield, a dragon scale mail, a ring of the sky and a crown legs?", cid) 
                    talkState[talkUser] = 22
                else 
                    npcHandler:say("I need a medusa shield, a dragon scale mail, a ring of the sky and a crown legs to give you the second wizard addon. Come back when you have them.", cid) 
                    talkState[talkUser] = 0 
                end 
            else 
                npcHandler:say(addon_need_premium, cid) 
                talkState[talkUser] = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
		elseif not talkState[talkUser] then
			return true
        -- First Wizard Addon
		elseif msgcontains(msg, 'yes') and talkState[talkUser] == 21 then 
            talkState[talkUser] = 0 
            if getPlayerItemCount(cid,5922) >= 50 then 
                addon = getPlayerStorageValue(cid,31019) 
                if addon == -1 then 
						doPlayerTakeItem(cid,5922,50)
                        npcHandler:say(addon_give, cid)
						if(getPlayerSex(cid) == 1)then
							doPlayerAddOutfit(cid, 145, 1) 
						else
							doPlayerAddOutfit(cid, 149, 1) 
						end
                        setPlayerStorageValue(cid,31019,1) 
                else 
                    npcHandler:say(addon_have_already, cid)
                end 
            else 
                npcHandler:say(addon_have_not_items, cid)  
            end 
		-- Second Wizard Addon
		elseif msgcontains(msg, 'yes') and talkState[talkUser] == 22 then 
            talkState[talkUser] = 0 
            if getPlayerItemCount(cid,2488) >= 1 and getPlayerItemCount(cid,2123) >= 1 and getPlayerItemCount(cid,2492) >= 1 and getPlayerItemCount(cid,2536) >= 1 then 
                addon = getPlayerStorageValue(cid,31020) 
                if addon == -1 then 
						doPlayerTakeItem(cid,2488,1)
						doPlayerTakeItem(cid,2123,1)
						doPlayerTakeItem(cid,2492,1)
						doPlayerTakeItem(cid,2536,1)
                        npcHandler:say(addon_give, cid)
						if(getPlayerSex(cid) == 1)then
							doPlayerAddOutfit(cid, 145, 2) 
						else
							doPlayerAddOutfit(cid, 149, 2) 
						end
                        setPlayerStorageValue(cid,31020,1) 
                else 
                    npcHandler:say(addon_have_already, cid)
                end 
            else 
                npcHandler:say(addon_have_not_items, cid)  
            end 
------------------------------------------------ confirm no ------------------------------------------------ 
        elseif msgcontains(msg, 'no') and (talkState[talkUser] >= 1 and talkState[talkUser] <= 34)  

then 
            npcHandler:say("Ok than.", cid) 
            talkState[talkUser] = 0 
        end 
    -- Place all your code in here. Remember that hi, bye and all that stuff is  

--already handled by the npcsystem, so you do not have to take care of that yourself. 
    return true 
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new()) 