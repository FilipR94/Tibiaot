local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'Beholder Shield'}, 2518, 7000, 1, 'Beholder Shield')
shopModule:addBuyableItem({'Noble Armor'}, 2486, 8000, 1, 'Noble Armor')
shopModule:addBuyableItem({'Spike sword'}, 2383, 8000, 1, 'Spike sword')
shopModule:addBuyableItem({'War hammer'}, 2391, 10000, 1, 'War hammer')

shopModule:addSellableItem({'Beholder Shield'}, 2518, 1200, 'Beholder Shield')
shopModule:addSellableItem({'Crown shield'}, 2519,8000,'Crown shield')
shopModule:addSellableItem({'Dragon Shield'}, 2516, 4000, 'Dragon Shield')
shopModule:addSellableItem({'Guardian shield'}, 2515, 2000, 'Guardian shield')
shopModule:addSellableItem({'Phoenix shield'}, 2539, 16000, 'Phoenix shield')
shopModule:addSellableItem({'Blue Robe'}, 2656, 10000, 'Blue Robe')
shopModule:addSellableItem({'Crown armor'}, 2487,12000, 'Crown armor')
shopModule:addSellableItem({'Noble Armor'}, 2486, 8000, 'Noble Armor')
shopModule:addSellableItem({'Boots of haste'},2195,30000, 'Boots of haste')
shopModule:addSellableItem({'Broad sword'}, 2413,500, 'Broad sword')
shopModule:addSellableItem({'Dragon lance'}, 2414,9000, 'Dragon lance')
shopModule:addSellableItem({'Fire axe'}, 2432,8000, 'Fire axe')
shopModule:addSellableItem({'Fire sword'}, 2392,4000, 'Fire sword')
shopModule:addSellableItem({'Ice rapier'}, 2396,1000, 'Ice rapier')
shopModule:addSellableItem({'Obsidian lance'},2425,500, 'Obsidian lance')
shopModule:addSellableItem({'Spike sword'},2383,1000, 'Spike sword')
shopModule:addSellableItem({'War hammer'},2391,1200, 'War hammer')
shopModule:addSellableItem({'Crown helmet'},2491,2500, 'Crown helmet')
shopModule:addSellableItem({'Crusader helmet'},2497,6000, 'Crusader helmet')
shopModule:addSellableItem({'Royal helmet'},2498,30000, 'Royal helmet')
shopModule:addSellableItem({'Crown legs'},2488,12000, 'Crown legs')

	end

