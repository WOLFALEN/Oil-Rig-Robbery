ESX = exports["es_extended"]:getSharedObject()
local cooldown = 0

ESX.RegisterServerCallback('rs-trummna:additem', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local random = math.random(1,100)
    if random < 50 then
    local rareitem = math.random(1,10)
    xPlayer.addInventoryItem(Config.MainGrave.ItemReward, 1)
    if Config.MainGrave.Enable2itemsReward then 
    xPlayer.addInventoryItem(Config.MainGrave.Item2Reward, 1)
    end
    cb(true)
    elseif random > 50 then
    local rareitem = math.random(1,10)  
    xPlayer.addInventoryItem(Config.MainGrave.Item3Reward, 1)
    if Config.MainGrave.Enable2itemsReward then 
    xPlayer.addInventoryItem(Config.MainGrave.Item4Reward, 1)
    end   
    end

end)


ESX.RegisterServerCallback('rs-trummna:storageitem', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item1 = xPlayer.getInventoryItem(Config.MainGrave.ItemReward)
    local item2 = xPlayer.getInventoryItem(Config.MainGrave.Item2Reward)
    local item3 = xPlayer.getInventoryItem(Config.MainGrave.Item3Reward)
    local item4 = xPlayer.getInventoryItem(Config.MainGrave.Item4Reward)

    if item1.count >= 1 then 
        xPlayer.removeInventoryItem(Config.MainGrave.ItemReward, 1)
        xPlayer.addInventoryItem("money", Config.MainGrave.ItemMoneyReward)
        cb(true)
    elseif item2.count >= 1 then 
        xPlayer.removeInventoryItem(Config.MainGrave.Item2Reward, 1)
        xPlayer.addInventoryItem("money", Config.MainGrave.Item2MoneyReward)
        cb(true)
    elseif item3.count >= 1 then
        xPlayer.removeInventoryItem(Config.MainGrave.Item3Reward, 1)  
        xPlayer.addInventoryItem("money", Config.MainGrave.Item3MoneyReward)
        cb(true)   
    elseif item4.count >= 1 then 
        xPlayer.removeInventoryItem(Config.MainGrave.Item4Reward, 1)
        xPlayer.addInventoryItem("money", Config.MainGrave.Item4MoneyReward)
        cb(true)
    else 
        cb(false)  
    end
end)

ESX.RegisterServerCallback('oil:rig', function(source, cb)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	
	local xPlayers = ESX.GetPlayers()

	totalPolice = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			totalPolice = totalPolice + 1
		end
	end
	
	if totalPolice >= Config.MinPolice then 
		cb(true)
	else 
		cb(false)
	end 
end)


