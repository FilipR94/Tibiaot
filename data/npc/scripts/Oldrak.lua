local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100077
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I guard this humble temple as a monument for the order of the nightmare knights."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Oldrak."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "These plains are not safe for ordinary travellers. It will take heroes to survive here."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can't help you, sorry!"})
keywordHandler:addKeyword({'goshnar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The greatest necromant who ever cursed our land with the steps of his feet. He was defeated by the nightmare knights."})
keywordHandler:addKeyword({'nightmare'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This ancient order was created by a circle of wise humans who were called 'the dreamers'. The order became extinct a long time ago."})
keywordHandler:addKeyword({'extinct'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Many perished in their battles against evil, some went mad, not able to stand their nightmares any longer. Others were seduced by the darkness."})
keywordHandler:addKeyword({'dreamers'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They learned the ancient art of dreamwalking from some elves they befriended."})
keywordHandler:addKeyword({'dreamwalking'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "While the dreamwalkers of the elves experienenced the brightest dreams of pleasure, the humans strangely had dreams of dark omen."})
keywordHandler:addKeyword({'omen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They dreamed of doom, destruction, talked to dead, tormented souls, and gained unwanted insight into the schemes of darkness."})
keywordHandler:addKeyword({'schemes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They figured out how to interpret their dark dreams and so could foresee the plans of the dark gods and their minions."})
keywordHandler:addKeyword({'plan'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Using this knowledge they formed an order to thwart these plans, and because they battled their nightmares as brave as knights, they named their order accordingly."})
keywordHandler:addKeyword({'necromant'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is rumoured to open the entrance to the pits of inferno, also called the nightmare pits. Even if I knew about this secret I wouldn't tell you."})
keywordHandler:addKeyword({'havok'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Before the battles raged across them, they were called the fair plains."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That's where we are. The world of Tibia."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They created Tibia and all life on it ... and unlife, too."})
keywordHandler:addKeyword({'unlife'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Beware the foul undead!"})
keywordHandler:addKeyword({'undead'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Beware the foul undead!"})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A weapon of myth and legend. It was lost in ancient times ... perhaps lost forever."})
keywordHandler:addKeyword({'hugo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ah, the bane of the Plains of Havoc, the hidden beast, the unbeatable foe. I live here for years and I am sure it's only a myth."})
keywordHandler:addKeyword({'yenny'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yenny, known as the Gentle, was one of most powerfull magicwielders in ancient times and known throughout the world for her mercy and kindness."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you the holy tible for a small fee."})
keywordHandler:addKeyword({'trade'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you the holy tible for a small fee."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you the holy tible for a small fee."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you the holy tible for a small fee."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you the holy tible for a small fee."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you the holy tible for a small fee."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Now, it is "..getWorldTime().."."})
 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end
 
function creatureSayCallback(cid, type, msg)
   local v = getPlayerStorageValue(cid, storage)
   if not npcHandler:isFocused(cid) then return false end
	if msgcontains(msg, 'no') and Topic[cid] == 1 then
		npcHandler:say("What a pity! Let me know when you managed to get in there. Maybe I can help you when we know what we are dealing with.",cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'no') and Topic[cid] == 2 then
        npcHandler:say("Not then.",cid)
        Topic[cid] = 0
    end 
	if  (msgcontains(msg, 'mission') or msgcontains(msg, 'demon oak')) and getPlayerStorageValue(cid, storage) == -1 then
		npcHandler:say("How do you know? Did you go into the infested area?", cid)
		Topic[cid] = 1
	elseif Topic[cid] == 1 then
		if msgcontains(msg, 'yes') then
		if getPlayerStorageValue(cid, 100076) == 1 and getPlayerStorageValue(cid, storage) == -1 then
		   npcHandler:say("A demon oak?!? <mumbles some blessings> May the gods be on our side. You'll need a {hallowed axe} to harm that tree. Bring me a simple {axe} and I'll prepare it for you.",cid)
		   setPlayerStorageValue(cid, storage, 1)
		   setPlayerStorageValue(cid, 100072, 2)
		   setPlayerStorageValue(cid, 100076, 2) 
       else
           npcHandler:say("I don't believe a word of it! How rude to lie to a monk!",cid)
           end
           Topic[cid] = 0
		end
	elseif msgcontains(msg, 'axe') or msgcontains(msg, 'hallowed axe') then
	    if v == 1 then
        if getPlayerItemCount(cid,2386) >= 1 then  
           npcHandler:say("Ahh, you've got an axe. Very good. I can make a hallowed axe out of it. It will cost you... er... a donation of 1,000 gold. Alright?",cid)
           Topic[cid] = 2
        else
           npcHandler:say("There is no axe with you.",cid)
       end 
    end
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'demon oak')) then
		if (v == 1 or v == 2) then
		if getPlayerStorageValue(cid,100070) == 1 then
		    npcHandler:say("You chopped down the demon oak?!? Unbelievable!! Let's hope it doesn't come back. As long as evil is still existent in the soil of the plains, it won't be over. Still, the demons suffered a setback, that's for sure. ...",cid)
            npcHandler:say("For your brave action, I tell you a secret which has been kept for many many years. There is an old house south of the location where you found the demon oak. There should be a grave with the name 'Yesim Adeit' somewhere close by. ...",cid, 4000)
            npcHandler:say("It belongs to a Daramian nobleman named 'Teme Saiyid'. I knew him well and he told me -almost augured- that someone will come who is worthy to obtain his treasure. I'm sure this 'someone' is you. Good luck in finding it!",cid, 8000)
            setPlayerStorageValue(cid,100070, 2)
            setPlayerStorageValue(cid,storage, 3)
	    setPlayerStorageValue(cid, 100072, 4)
        else
            npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
        end
        elseif v == 3 and getPlayerStorageValue(cid,100070) == 2  then
	       npcHandler:say("I'm really thankful for your help and so should be every citizen of Tibia.",cid)
        end
	elseif Topic[cid] == 2 then
	if msgcontains(msg, 'yes') then
	if getPlayerItemCount(cid,2386) >= 1 then
	if doPlayerRemoveMoney(cid,1000) then
            npcHandler:say("Let's see....<mumbles a prayer>....here we go. The blessing on this axe will be absorbed by all the demonic energy around here. I presume it will not last very long, so better hurry. Actually, I can refresh the blessing as often as you like.",cid)
	    doPlayerAddItem(cid,8293,1)
	    doPlayerRemoveItem(cid, 2386, 1)
	else
	    npcHandler:say("It costs 1000 gold coins.",cid)
        end
        else
            npcHandler:say("There is no axe with you.",cid)
            end
        end
		Topic[cid] = 0
		end
	return true
end
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())