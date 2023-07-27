ESX = exports["es_extended"]:getSharedObject()

local started = false
local blokada1 = false
local blokada2 = false
local blokada3 = false  
local blokada4 = false 
local blokada5 = false

local function loadAnimDict(dict)
    RequestAnimDict(dict)
local repeater = 0
repeat 
    Wait(1)
    repeater = HasAnimDictLoaded(dict)
until (repeater == 1)
end

local function loadModel(model)
    RequestModel(model)
    local repeater = 0
    repeat 
        Wait(1) 
        repeater = HasModelLoaded(model)
    until (repeater == 1)
end

AddEventHandler('esx:onPlayerDeath', function(data)

    if PlayerPedId() then
        blokada1 = false
        blokada2 = false
        blokada3 = false  
        blokada4 = false 
        blokada5 = false
        DeletewaypointBlip1()
        DeletewaypointBlip2()
        DeletewaypointBlip3()
        DeletewaypointBlip4()
        DeletewaypointBlip5()
        DeleteWolfProp1()
        DeleteWolfProp2()
        DeleteWolfProp3()
        DeleteWolfProp4()
        DeleteWolfProp5()
    end
end)

--if cops >= Config.PoliceNumberRequired then
    local function startheist()
        loadAnimDict('misscarsteal4@actor')  
        loadAnimDict('amb@world_human_prostitute@cokehead@base')  
        DoScreenFadeOut(300)
        started = true
        SetEntityCoords(PlayerPedId(), Config.MainGrave.Playerpos.x, Config.MainGrave.Playerpos.y, Config.MainGrave.Playerpos.z-1)
        SetEntityHeading(PlayerPedId(), Config.MainGrave.Playerpos.w)     
        cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 1, true, true)
        SetCamCoord(cam, Config.MainGrave.Camerapos.x, Config.MainGrave.Camerapos.y, Config.MainGrave.Camerapos.z)
        PointCamAtCoord(cam, Config.MainGrave.camlook.x, Config.MainGrave.camlook.y, Config.MainGrave.camlook.z, 0.7)
        ESX.UI.Menu.CloseAll()
        Wait(900)
        DoScreenFadeIn(350)
        Wait(500)
        TriggerEvent("grave:PnjTalk","Oil Rig Agent : Listen carefully.",300)
        --ESX.ShowNotification(Config.MainGrave.Cam1)
        Wait(5000)
        TriggerEvent("grave:PnjTalk","Oil Rig Agent : Go to the Rig and Collect 5 Items..",350)
        --ESX.ShowNotification(Config.MainGrave.Cam2)
        Wait(4000)
        TriggerEvent("grave:PnjTalk","Oil Rig Agent : I see you here in 10 minutes.",400)
        --ESX.ShowNotification(Config.MainGrave.Cam3)
        SetCamActive(cam, false)
        RenderScriptCams(false, false, 0, true, true)
        FreezeEntityPosition(PlayerPedId(), true)
        TaskPlayAnim(PlayerPedId(), 'amb@world_human_prostitute@cokehead@base', 'base', 1.0, 1.0, -1, 49, 0, 0, 0, 0) 
        TaskPlayAnim(ped, 'misscarsteal4@actor', 'actor_berating_loop', 1.0, 1.0, -1, 49, 0, 0, 0, 0) 
        Wait(1000)
        ClearPedTasks(PlayerPedId())
        ClearPedTasks(ped)
        FreezeEntityPosition(PlayerPedId(), false)
        prop1()
        prop2()
        prop3()
        prop4()
        prop5()
        waypointBlip1()
        waypointBlip2()
        waypointBlip3()
        waypointBlip4()
        waypointBlip5()
        timer()
    end

--end

RegisterNetEvent("grave:PnjTalk")
AddEventHandler('grave:PnjTalk', function(text,timew)

	
	PnjTalk(text,timew)
end)

CurrentOpacity = 150
CurrentTextOpacity = 255

function DrawAdvancedText(x,y,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextScale(sc, sc)
	SetTextJustification(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text) --99 char max
	DrawText(x, y-0.015)
end

function PnjTalk(text,timeaff)
	local cpt = 0
	while cpt < timeaff do
		Wait(0)
		cpt = cpt + 1
		-- print("cpt :"..tostring(cpt))
		DrawRect(0.5, 0.92, 0.40, 0.07, 0, 0, 0, CurrentOpacity)
		DrawRect(0.5, 0.965, 0.40, 0.0025, 180, 180, 180, CurrentOpacity)
		if string.len(text) > 99 then
			splittext1 = string.sub(text,0,98)
			splittext2 = string.sub(text,99)
			DrawAdvancedText(0.5, 0.91, 0.4, tostring(splittext1), 255, 255, 255, CurrentTextOpacity, 6, 0)
			DrawAdvancedText(0.5, 0.93, 0.4, tostring(splittext2), 255, 255, 255, CurrentTextOpacity, 6, 0)
		else
			DrawAdvancedText(0.5, 0.92, 0.4, tostring(text), 255, 255, 255, CurrentTextOpacity, 6, 0)
		end
	end
end

local blips = {
    -- {title="", colour=, id=, x=, y=, z=}-296.3001, 2786.2449, 61.1020, 59.4433
    {title="Oil Rig Robbery", colour=1, id=438, x = -3045.2727, y = 7353.9004, z = 8.0024},
 }

      
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.7)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

function timer()
   if started then 
    Wait(Config.MainGrave.Cooldown*60000)
    started = false
    blokada1 = false
    blokada2 = false
    blokada3 = false  
    blokada4 = false 
    blokada5 = false
   end 
end   


function kopanie(id)
    loadAnimDict('amb@world_human_welding@male@base')
    loadAnimDict('anim@gangops@facility@servers@bodysearch@')
    loadModel('prop_ld_shovel')
    FreezeEntityPosition(PlayerPedId(), true)
    SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"), true)

    if id == 1 then
    TriggerEvent("utk_fingerprint:Start", 1, 2, 2, function(outcome, reason)
        if outcome == true then
            blokada1 = true
            SetEntityCoords(PlayerPedId(), -3037.5896, 7468.4814, 50.0, 0, 0, 0, 0)
            SetEntityHeading(PlayerPedId(),  39.4428)
            local shovel = CreateObject("prop_weld_torch", pos, true, false, true)
            TaskPlayAnim(PlayerPedId(), 'amb@world_human_welding@male@base', 'base', 1.0, 1.0, -1, 1, 0, 0, 0, 0)
            AttachEntityToEntity(shovel, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1)
            Wait(10000)
            ClearPedTasks(PlayerPedId())
            DeleteObject(shovel)
            PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", true)
            DeleteWolfProp1()
            DeletewaypointBlip1()
            trumnaspawn(1)
        end  
    end)         
    elseif id == 2 then
    blokada2 = true 
    SetEntityCoords(PlayerPedId(), -3050.5042, 7449.8076, 50.0, 0, 0, 0, 0)
    SetEntityHeading(PlayerPedId(),  128.2113)
    local shovel = CreateObject("prop_weld_torch", pos, true, false, true)
    TaskPlayAnim(PlayerPedId(), 'amb@world_human_welding@male@base', 'base', 1.0, 1.0, -1, 1, 0, 0, 0, 0)
    AttachEntityToEntity(shovel, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1)
    Wait(10000)
    ClearPedTasks(PlayerPedId())
    DeleteObject(shovel)
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", true)
    DeleteWolfProp2()
    DeletewaypointBlip2()
    trumnaspawn(2)

    elseif id == 3 then
    blokada3 = true 
    SetEntityCoords(PlayerPedId(), -3012.5149, 7461.6992, 50.0, 0, 0, 0, 0)
    SetEntityHeading(PlayerPedId(),  128.8227)
    local shovel = CreateObject("prop_weld_torch", pos, true, false, true)
    TaskPlayAnim(PlayerPedId(), 'amb@world_human_welding@male@base', 'base', 1.0, 1.0, -1, 1, 0, 0, 0, 0)
    AttachEntityToEntity(shovel, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1)
    Wait(10000)
    ClearPedTasks(PlayerPedId())
    DeleteObject(shovel)
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", true)
    DeleteWolfProp3()
    DeletewaypointBlip3()
    trumnaspawn(3)

    elseif id == 4 then
    blokada4 = true 
    SetEntityCoords(PlayerPedId(), -3004.8337, 7465.5669, 57.5, 0, 0, 0, 0)
    SetEntityHeading(PlayerPedId(),  306.2715)
    local shovel = CreateObject("prop_weld_torch", pos, true, false, true)
    TaskPlayAnim(PlayerPedId(), 'amb@world_human_welding@male@base', 'base', 1.0, 1.0, -1, 1, 0, 0, 0, 0)
    AttachEntityToEntity(shovel, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1)
    Wait(10000)
    ClearPedTasks(PlayerPedId())
    DeleteObject(shovel)
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", true)
    DeleteWolfProp4()
    DeletewaypointBlip4()
    trumnaspawn(4)

    elseif id == 5 then
      blokada5 = true
      SetEntityCoords(PlayerPedId(), -3056.2297, 7498.9609, 50.0, 0, 0, 0, 0)
      SetEntityHeading(PlayerPedId(), 31.1697)
      local shovel = CreateObject("prop_weld_torch", pos, true, false, true)
      TaskPlayAnim(PlayerPedId(), 'amb@world_human_welding@male@base', 'base', 1.0, 1.0, -1, 1, 0, 0, 0, 0)
      AttachEntityToEntity(shovel, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1)
      Wait(10000)
      ClearPedTasks(PlayerPedId())
      DeleteObject(shovel)
      PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", true)
      DeleteWolfProp5()
      DeletewaypointBlip5()
      trumnaspawn(5)
      
    end     
end

function trumnaspawn(id)
    if id == 1 then
    local trumna = CreateObject("prop_devin_box_01", Config.MainGrave.Coffin1pos.x, Config.MainGrave.Coffin1pos.y, Config.MainGrave.Coffin1pos.z-1,  true, false, true) 
    SetEntityHeading(trumna, Config.MainGrave.Coffin1pos.w)  
    FreezeEntityPosition(trumna, true)
    Wait(1000)
    TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
    Wait(7500)
    DeleteObject(trumna)
    FreezeEntityPosition(PlayerPedId(), false)
    ClearPedTasks(PlayerPedId())
    ESX.TriggerServerCallback('rs-trummna:additem', function(source) end)
    elseif id == 2 then
        local trumna = CreateObject("prop_devin_box_01", Config.MainGrave.Coffin2pos.x, Config.MainGrave.Coffin2pos.y, Config.MainGrave.Coffin2pos.z-1,  true, false, true)
        SetEntityHeading(trumna, Config.MainGrave.Coffin2pos.w) 
        FreezeEntityPosition(trumna, true)
        Wait(1000)
        TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
        Wait(2500)
        DeleteObject(trumna)
        FreezeEntityPosition(PlayerPedId(), false)
        ClearPedTasks(PlayerPedId())
        ESX.TriggerServerCallback('rs-trummna:additem', function(source) end)
    elseif id == 3 then    
        local trumna = CreateObject("prop_devin_box_01", Config.MainGrave.Coffin3pos.x, Config.MainGrave.Coffin3pos.y, Config.MainGrave.Coffin3pos.z-1, true, false, true)
        SetEntityHeading(trumna, Config.MainGrave.Coffin3pos.w) 
        FreezeEntityPosition(trumna, true)
        Wait(1000)
        TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
        Wait(7500)
        DeleteObject(trumna)
        FreezeEntityPosition(PlayerPedId(), false)
        ClearPedTasks(PlayerPedId())
        ESX.TriggerServerCallback('rs-trummna:additem', function(source) end)
    elseif id == 4 then
        local trumna = CreateObject("prop_devin_box_01", Config.MainGrave.Coffin4pos.x, Config.MainGrave.Coffin4pos.y, Config.MainGrave.Coffin4pos.z-1, true, false, true)
        SetEntityHeading(trumna, Config.MainGrave.Coffin4pos.w)   
        FreezeEntityPosition(trumna, true)
        Wait(1000)
        TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
        Wait(7500)
        DeleteObject(trumna)
        FreezeEntityPosition(PlayerPedId(), false)
        ClearPedTasks(PlayerPedId())
        ESX.TriggerServerCallback('rs-trummna:additem', function(source) end)
    elseif id == 5 then    
        local trumna = CreateObject("prop_devin_box_01", Config.MainGrave.Coffin5pos.x, Config.MainGrave.Coffin5pos.y, Config.MainGrave.Coffin5pos.z-1,  true, false, true)
        SetEntityHeading(trumna, Config.MainGrave.Coffin5pos.w)   
        FreezeEntityPosition(trumna, true)
        Wait(1000)
        TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false ) 
        Wait(7500)
        DeleteObject(trumna)
        FreezeEntityPosition(PlayerPedId(), false)
        ClearPedTasks(PlayerPedId())
        ESX.TriggerServerCallback('rs-trummna:additem', function(source) end)
    end 
end

local function sellitem()
    ESX.TriggerServerCallback('rs-trummna:storageitem', function(haveitem)
        if haveitem then 
            TriggerEvent("grave:PnjTalk","Graveyard Robber : You have received Payment for Items",200)
            --ESX.ShowNotification(Config.MainGrave.HaveItem)
        else 
            TriggerEvent("grave:PnjTalk","Graveyard Robber : You have no Items that interest me",200)
            --ESX.ShowNotification(Config.MainGrave.NotHaveItem)
        end
    
    end)
end

Citizen.CreateThread(function()
    loadModel(Config.MainGrave.PedName)
    ped =  CreatePed(4, Config.MainGrave.PedName, Config.MainGrave.PedPos.x, Config.MainGrave.PedPos.y, Config.MainGrave.PedPos.z-1.0, Config.MainGrave.PedPos.w, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    exports[Config.target]:AddBoxZone("Ped_trumny", vector3(Config.MainGrave.PedPos.x, Config.MainGrave.PedPos.y, Config.MainGrave.PedPos.z), 0.7, 0.7, {  --Nazwa Locala ALbo Hash Peda
    name="Ped_trumny",
    heading=Config.MainGrave.PedPos.w,
    --debugPoly=true,
    minZ=Config.MainGrave.PedPos.z-1,
    maxZ=Config.MainGrave.PedPos.z+1    
   }, {
   options = {
    {
        action = function()
            if started then
                print("Already On Going")
            else    
                police()  
            end             
        end,
        icon = "fa-regular fa-oil-well fa-bounce", 
        label = "let's talk about the bloody 30 acres of lakh",
        num = 1,
        canInteract = function()
            return not started
        end,
    },    
       {
     --   event = 'sellitem',
        action = function()
            sellitem()
        end,
        icon = "fa-light fa-cart-shopping fa-bounce", 
        label = "Sell ​​Items",
        canInteract = function()
        return started 
        end,
    },
   },
   distance = 1.5 
   })


exports[Config.target]:AddBoxZone("trumna_1", vector3(Config.MainGrave.Coffin1pos.x, Config.MainGrave.Coffin1pos.y, Config.MainGrave.Coffin1pos.z), 10.7, 10.7, {
    name="trumna_1",
    heading=Config.MainGrave.Coffin1pos.w,
   -- debugPoly=true,
    minZ=Config.MainGrave.Coffin1pos.z-2,
    maxZ=Config.MainGrave.Coffin1pos.z+0.3 
}, {
options = {
   {
       action = function(id)
            kopanie(1)
       end,
       icon = "fa-solid fa-bomb fa-bounce", 
       label = "Crack The Box",
       num = 1,
       canInteract = function()
        return started and not blokada1
        end,
   },
},
distance = 15.5 -- dystans
})
exports[Config.target]:AddBoxZone("trumna_2", vector3(Config.MainGrave.Coffin2pos.x, Config.MainGrave.Coffin2pos.y, Config.MainGrave.Coffin2pos.z), 10.7, 10.7, {
    name="trumna_2",
    heading=Config.MainGrave.Coffin2pos.w,
    --debugPoly=true,
    minZ=Config.MainGrave.Coffin2pos.z-2,
    maxZ=Config.MainGrave.Coffin2pos.z+0.3    
}, {
options = {
   {
       action = function(id)
        kopanie(2)
       end,
       icon = "fa-solid fa-bomb fa-bounce", 
       label = "Crack The Box",
       num = 1,
       canInteract = function()
        return started and not blokada2
        end,
   },
},
distance = 15.5 -- dystans
})
exports[Config.target]:AddBoxZone("trumna_3", vector3(Config.MainGrave.Coffin3pos.x, Config.MainGrave.Coffin3pos.y, Config.MainGrave.Coffin3pos.z), 10.7, 10.7, {
    name="trumna_3",
    heading=Config.MainGrave.Coffin3pos.w,
    --debugPoly=true,
    minZ=Config.MainGrave.Coffin3pos.z-2,
    maxZ=Config.MainGrave.Coffin3pos.z+0.3 
}, {
options = {
   {
       action = function(id)
        kopanie(3)
       end,
       icon = "fa-solid fa-bomb fa-bounce", 
       label = "Crack The Box",
       num = 1,
       canInteract = function()
        return started and not blokada3
        end,
   },
},
distance = 15.5 -- dystans
})
exports[Config.target]:AddBoxZone("trumna_4", vector3(Config.MainGrave.Coffin4pos.x, Config.MainGrave.Coffin4pos.y, Config.MainGrave.Coffin4pos.z), 10.7, 10.7, {
    name="trumna_4",
    heading=Config.MainGrave.Coffin4pos.w,
    --debugPoly=true,
    minZ=Config.MainGrave.Coffin4pos.z-2,
    maxZ=Config.MainGrave.Coffin4pos.z+0.3 
}, {
options = {
   {
       action = function(id)
        kopanie(4)
       end,
       icon = "fa-solid fa-bomb fa-bounce", 
       label = "Crack The Box",
       num = 1,
       canInteract = function()
        return started and not blokada4
        end,
   },
},
distance = 15.5 -- dystans
})
exports[Config.target]:AddBoxZone("trumna_5", vector3(Config.MainGrave.Coffin5pos.x, Config.MainGrave.Coffin5pos.y, Config.MainGrave.Coffin5pos.z), 10.7, 10.7, {
    name="trumna_5",
    heading=Config.MainGrave.Coffin5pos.w,
    --debugPoly=true,
    minZ=Config.MainGrave.Coffin5pos.z-2,
    maxZ=Config.MainGrave.Coffin5pos.z+0.3 
}, {
options = {
   {
       action = function(id)
        kopanie(5)
       end,
       icon = "fa-solid fa-bomb fa-bounce", 
       label = "Crack The Box",
       num = 1,
       canInteract = function()
        return started and not blokada5
        end,
   },
},
distance = 15.5 -- dystans
})

end)





--------------------------------------------- PROPS

function prop1()

  local x = Config.MainGrave.Coffin1pos.x
  local y = Config.MainGrave.Coffin1pos.y
  local z = Config.MainGrave.Coffin1pos.z - 1

  wolfProp1 = CreateObject("prop_devin_box_closed", x, y, z, true, false, true)
  SetEntityHeading(wolfProp1, Config.MainGrave.Coffin1pos.w)
end

function DeleteWolfProp1()
    DeleteEntity(wolfProp1)   
end


function prop2()

  local x = Config.MainGrave.Coffin2pos.x
  local y = Config.MainGrave.Coffin2pos.y
  local z = Config.MainGrave.Coffin2pos.z - 1

  wolfProp2 = CreateObject("prop_devin_box_closed", x, y, z, true, false, true)
  SetEntityHeading(wolfProp2, Config.MainGrave.Coffin2pos.w)
end

function DeleteWolfProp2()
    DeleteEntity(wolfProp2)
end


function prop3()

  local x = Config.MainGrave.Coffin3pos.x
  local y = Config.MainGrave.Coffin3pos.y
  local z = Config.MainGrave.Coffin3pos.z - 1

  wolfProp3 = CreateObject("prop_devin_box_closed", x, y, z, true, false, true)
  SetEntityHeading(wolfProp3, Config.MainGrave.Coffin3pos.w)
end

function DeleteWolfProp3()
    DeleteEntity(wolfProp3)
end


function prop4()

  local x = Config.MainGrave.Coffin4pos.x
  local y = Config.MainGrave.Coffin4pos.y
  local z = Config.MainGrave.Coffin4pos.z - 1

  wolfProp4 = CreateObject("prop_devin_box_closed", x, y, z, true, false, true)
  SetEntityHeading(wolfProp4, Config.MainGrave.Coffin4pos.w)
end

function DeleteWolfProp4()
    DeleteEntity(wolfProp4)
end


function prop5()

  local x = Config.MainGrave.Coffin5pos.x
  local y = Config.MainGrave.Coffin5pos.y
  local z = Config.MainGrave.Coffin5pos.z - 1

  wolfProp5 = CreateObject("prop_devin_box_closed", x, y, z, true, false, true)
  SetEntityHeading(wolfProp5, Config.MainGrave.Coffin5pos.w)
end

function DeleteWolfProp5()
    DeleteEntity(wolfProp5)
end









-------------------------------------------------------------- Blips

function waypointBlip1()
  Blip1 = AddBlipForCoord(Config.MainGrave.Coffin1pos.x,Config.MainGrave.Coffin1pos.y,Config.MainGrave.Coffin1pos.z - 1)
  SetBlipSprite(Blip1, 485)
  SetBlipColour(Blip1, 1)
  SetBlipAlpha(Blip1, 60)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Crack The Box")
  EndTextCommandSetBlipName(Blip1)
end

function DeletewaypointBlip1()
    RemoveBlip(Blip1)   
end


function waypointBlip2()
  Blip2 = AddBlipForCoord(Config.MainGrave.Coffin2pos.x,Config.MainGrave.Coffin2pos.y,Config.MainGrave.Coffin2pos.z - 1)
  SetBlipSprite(Blip2, 485)
  SetBlipColour(Blip2, 1)
  SetBlipAlpha(Blip2, 60)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Crack The Box")
  EndTextCommandSetBlipName(Blip2)
end

function DeletewaypointBlip2()
    RemoveBlip(Blip2)
end

local Blip3 = nil

function waypointBlip3()
  if Blip3 ~= nil then
    -- Object already exists, do nothing
    return
  end

  Blip3 = AddBlipForCoord(Config.MainGrave.Coffin3pos.x,Config.MainGrave.Coffin3pos.y,Config.MainGrave.Coffin3pos.z - 1)
  SetBlipSprite(Blip3, 485)
  SetBlipColour(Blip3, 1)
  SetBlipAlpha(Blip3, 60)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Crack The Box")
  EndTextCommandSetBlipName(Blip3)
end

function DeletewaypointBlip3()
  if Blip3 ~= nil then
    RemoveBlip(Blip3)
    Blip3 = nil
  end
end

local Blip4 = nil

function waypointBlip4()
  if Blip4 ~= nil then
    -- Object already exists, do nothing
    return
  end

  Blip4 = AddBlipForCoord(Config.MainGrave.Coffin4pos.x,Config.MainGrave.Coffin4pos.y,Config.MainGrave.Coffin4pos.z - 1)
  SetBlipSprite(Blip4, 485)
  SetBlipColour(Blip4, 1)
  SetBlipAlpha(Blip4, 60)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Crack The Box")
  EndTextCommandSetBlipName(Blip4)
end

function DeletewaypointBlip4()
  if Blip4 ~= nil then
    RemoveBlip(Blip4)
    Blip4 = nil
  end
end

local Blip5 = nil

function waypointBlip5()
  if Blip5 ~= nil then
    -- Object already exists, do nothing
    return
  end

  Blip5 = AddBlipForCoord(Config.MainGrave.Coffin5pos.x,Config.MainGrave.Coffin5pos.y,Config.MainGrave.Coffin5pos.z - 1)
  SetBlipSprite(Blip5, 485)
  SetBlipColour(Blip5, 1)
  SetBlipAlpha(Blip5, 60)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Crack The Box")
  EndTextCommandSetBlipName(Blip5)
end

function DeletewaypointBlip5()
  if Blip5 ~= nil then
    RemoveBlip(Blip5)
    Blip5 = nil
  end
end

-- Assuming you have a table called "Config" with the value of "PoliceNumberRequired" defined

-- Function to check the number of cops
function police()
    ESX.TriggerServerCallback('oil:rig', function(passed)
        if passed then 
            startheist()
        else
            TriggerEvent("grave:PnjTalk","There Is No Enough Officers",500)  
        end    
    end)        
end



