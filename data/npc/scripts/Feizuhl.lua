local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end
keywordHandler:addKeyword({'container'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I seel wooden drawer, dresser, locker, large trunk, box, chest, crate, barrel and trough."})

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell furniture both to the mourned and the enlightened."})
keywordHandler:addKeyword({'shop'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell furniture both to the mourned and the enlightened."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm the mourned Feizuhl, pilgrim."})
keywordHandler:addKeyword({'thank'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It was a pleasure, pilgrim."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The false prophet lead his people into damnation. Mourned shall he be."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is the continent of my birth, my death and also of my ascension, if I learn enough in my mortal days."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If they would only see the light and follow the way of ascension. Thrice mourned be they."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our city is old. Older even then our beloved pharaoh."})
keywordHandler:addKeyword({'city'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our city is old. Older even then our beloved pharaoh."})
keywordHandler:addKeyword({'pharaoh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our pharaoh holds the key to our ascension. Praised be our pharaoh."})
keywordHandler:addKeyword({'arkhothep'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our pharaoh holds the key to our ascension. Praised be our pharaoh."})
keywordHandler:addKeyword({'mortality'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Only if we leave mortality behind will we attain ascension."})
keywordHandler:addKeyword({'ascension'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The ascension to salvation and perhaps even to divine status."})
keywordHandler:addKeyword({"Akh'rah Uthun"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Akh'rah Uthun is the union of the three parts that were never meant to be bound together."})
keywordHandler:addKeyword({'Akh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Akh is our vulnerable, ageing flesh."})
keywordHandler:addKeyword({'undea'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Undeath is an important step towards ascension."})
keywordHandler:addKeyword({'Rah'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Rah is our spiritual essence."})
keywordHandler:addKeyword({'uthun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Uthun is our memory. Call it personality if you like."})
keywordHandler:addKeyword({'mourn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are mortals and thus to be mourned, for while we are trapped in this frail form we are excluded from enlightenment and ascension."})
keywordHandler:addKeyword({'arena'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Look for the arena in the heart of our city."})
keywordHandler:addKeyword({'palace'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The palace is located in the centre of our city, south of the arena."})
keywordHandler:addKeyword({'temple'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Look for the temple in the south-eastern section of Ankrahmun."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell statues, tables, chairs, flowers, pillows, pottery, instruments, decoration, tapestries and containers."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell statues, tables, chairs, flowers, pillows, pottery, instruments, decoration, tapestries and containers."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell statues, tables, chairs, flowers, pillows, pottery, instruments, decoration, tapestries and containers."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell statues, tables, chairs, flowers, pillows, pottery, instruments, decoration, tapestries and containers."})
keywordHandler:addKeyword({'furniture'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell statues, tables, chairs, flowers, pillows, pottery, instruments, decoration, tapestries and containers."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell statues, tables, chairs, flowers, pillows, pottery, instruments, decoration, tapestries and containers."})
npcHandler:addModule(FocusModule:new())