ESX = exports.es_extended:getSharedObject()
local display = false
local MarkerPosition = {
    {x = -239.6664, y = -989.6124, z = 29.2882}, -- position for change the marker 
}

RegisterNetEvent('lavori:setdisplay')
AddEventHandler('lavori:setdisplay', function(bool) 
    display = bool     
    SetNuiFocus(bool, bool)     
    SendNUIMessage({ type = "ui",  status = bool, })
end )

RegisterNUICallback('exit', function(data)
    TriggerEvent('lavori:setdisplay', false)
 end)

 --inizio parte fattorino--
 
 RegisterNetEvent('veicolo:p')
 AddEventHandler('veicolo:p', function()
    local ped = PlayerPedId()
    local heading = GetEntityHeading(ped)

    ESX.Game.SpawnVehicle('bf400', Config.spawndeiveicoli, heading, function(entity)       
        TaskWarpPedIntoVehicle(ped, entity, -1)
        waypoint = SetNewWaypoint(Config.SpawnNPCPizza)
        TriggerEvent('esx:showNotification', Config.notificaprendipizza)
    end)
 end)

 RegisterNetEvent('vendipizze')
 AddEventHandler('vendipizze', function()
    TriggerServerEvent("lavori:inizialavoropizza")
    waypoint = SetNewWaypoint(Config.Venditapizze)
end)

 RegisterNUICallback('fattorino', function()
    TriggerEvent('veicolo:p')
    TriggerServerEvent('pizza:settalavoro')
    TriggerEvent('lavori:setdisplay', false)
 end)

--fine fattorino--

--inizio camionista--

RegisterNetEvent('veicolo:c')
AddEventHandler('veicolo:c', function()
    local ped = PlayerPedId()
    local heading = GetEntityHeading(ped)

    ESX.Game.SpawnVehicle('mule2', Config.spawndeiveicoli, heading, function(entity)       
        TaskWarpPedIntoVehicle(ped, entity, -1)
        waypoint = SetNewWaypoint(Config.prendimerce)
        Wait(2000)
        TriggerEvent('esx:showNotification', Config.notificaprendimerce)
    end)
end)

 RegisterNUICallback('camionista', function()
    TriggerEvent('veicolo:c')
    TriggerServerEvent('camion:settalavoro')
    TriggerEvent('lavori:setdisplay', false)
 end)

 --fine camionista--

 --inizio postino--

 RegisterNetEvent('veicolo:po')
 AddEventHandler('veicolo:po', function()
    local ped = PlayerPedId()
    local heading = GetEntityHeading(ped)

    ESX.Game.SpawnVehicle('mule4', Config.spawndeiveicoli, heading, function(entity)       
        TaskWarpPedIntoVehicle(ped, entity, -1)
        waypoint = SetNewWaypoint(Config.prendilettere)
        Wait(2000)
        TriggerEvent('esx:showNotification', Config.notificaprendilettere)
    end)
end)

RegisterNuiCallback('postino', function()
    TriggerEvent('veicolo:po')
    TriggerServerEvent('postino:settalavoro')
    TriggerEvent('lavori:setdisplay', false)
end)


TriggerEvent('gridsystem:registerMarker', {
    name = "lavorinowl",
    pos = vector3(1218.4395751953,-1266.9835205078,36.423366546631),
    size = vector3(1.2, 1.2, 1.2),
    scale = vector3(0.8, 0.8, 0.8),
    control = 'E',
    rotate = 0.0,
    rotate2 = 0.0,
    shouldBob = false,
    shouldRotate = true,
    color = { r = 255, g = 255, b = 255 },
    trasparent = 255,
    type = 21,
    msg = 'Lavori NO-WL',
    action = function()
        CreateThread(function()
            TriggerEvent('lavori:setdisplay', true)
            while display do 
                DisableControlAction(0,1, display)
                DisableControlAction(0,142, display)
                DisableControlAction(0,18, display)
                DisableControlAction(0,322, display)
                DisableControlAction(0,2, display)
                DisableControlAction(0,106, display)
                Wait(0)
            end
        end)
    end
})

Citizen.CreateThread(function()
    if not HasModelLoaded('a_m_y_smartcaspat_01') then
       RequestModel('a_m_y_smartcaspat_01')
       while not HasModelLoaded('a_m_y_smartcaspat_01') do
          Citizen.Wait(5)
       end
    end

    Npc = CreatePed(4, 'a_m_y_smartcaspat_01', Config.SpawnNPCPizza, false, true)
    FreezeEntityPosition(Npc, true)
    SetEntityInvincible(Npc, true)
    SetBlockingOfNonTemporaryEvents(Npc, true)
end)

Citizen.CreateThread(function()
    if not HasModelLoaded('a_m_y_smartcaspat_01') then
       RequestModel('a_m_y_smartcaspat_01')
       while not HasModelLoaded('a_m_y_smartcaspat_01') do
          Citizen.Wait(5)
       end
    end

    Npc = CreatePed(4, 'a_m_y_smartcaspat_01', Config.spawnNPCCamionista, false, true)
    FreezeEntityPosition(Npc, true)
    SetEntityInvincible(Npc, true)
    SetBlockingOfNonTemporaryEvents(Npc, true)
end)

Citizen.CreateThread(function()
    if not HasModelLoaded('a_m_y_smartcaspat_01') then
       RequestModel('a_m_y_smartcaspat_01')
       while not HasModelLoaded('a_m_y_smartcaspat_01') do
          Citizen.Wait(5)
       end
    end

    Npc = CreatePed(4, 'a_m_y_smartcaspat_01', Config.Npcvenditamerci, false, true)
    FreezeEntityPosition(Npc, true)
    SetEntityInvincible(Npc, true)
    SetBlockingOfNonTemporaryEvents(Npc, true)
end)

Citizen.CreateThread(function()
    if not HasModelLoaded('a_m_y_smartcaspat_01') then
       RequestModel('a_m_y_smartcaspat_01')
       while not HasModelLoaded('a_m_y_smartcaspat_01') do
          Citizen.Wait(5)
       end
    end

    Npc = CreatePed(4, 'a_m_y_smartcaspat_01', Config.NPCprendilettere, false, true)
    FreezeEntityPosition(Npc, true)
    SetEntityInvincible(Npc, true)
    SetBlockingOfNonTemporaryEvents(Npc, true)
end)

TriggerEvent('gridsystem:registerMarker', {
    name = 'anything_u_want',
    pos = vector3(536.39953613281,99.296424865723,96.472190856934),--Coords of the place
    scale = vector3(0.8, 0.8, 0.8),
    msg = 'Prendi pizze',--Text
    control = 'E',
    type = 21,--The Type of the marker(https://docs.fivem.net/docs/game-references/markers/)
    color = { r = 130, g = 120, b = 110 },
    action = function()
      TriggerEvent('vendipizze')
    end
})

TriggerEvent('gridsystem:registerMarker', {
    name = 'casdasdas',
    pos = vector3(1640.8682861328,3730.9287109375,35.067142486572),
    scale = vector3(0.8, 0.8, 0.8),
    msg = 'Suona al campanello',--Text
    control = 'E',
    type = 21,--The Type of the marker(https://docs.fivem.net/docs/game-references/markers/)
    color = { r = 130, g = 120, b = 110 },
    action = function()
        TriggerServerEvent('lavori:suonacampanello')
    end
})

TriggerEvent('gridsystem:registerMarker', {
    name = 'dasuodasgiudasgdaswiughd',
    pos = vector3(-979.27801513672,-2232.4992675781,8.8617010116577),
    scale = vector3(0.8, 0.8, 0.8),
    msg = 'Merce',--Text
    control = 'E',
    type = 21,--The Type of the marker(https://docs.fivem.net/docs/game-references/markers/)
    color = { r = 130, g = 120, b = 110 },
    action = function()
        TriggerServerEvent('lavori:caricamerce')
        waypoint = SetNewWaypoint(Config.VenditaMerci)
    end
})

TriggerEvent('gridsystem:registerMarker', {
    name = 'ASDASDJASDBASHDGVASDHJAS',
    pos = vector3(1700.5301513672,4936.720703125,42.078163146973),
    scale = vector3(0.8, 0.8, 0.8),
    msg = 'Merce',--Text
    control = 'E',
    type = 21,--The Type of the marker(https://docs.fivem.net/docs/game-references/markers/)
    color = { r = 130, g = 120, b = 110 },
    action = function()
        TriggerServerEvent('lavori:vendimerce')
    end
})

TriggerEvent('gridsystem:registerMarker', {
    name = 'asdasdasdasS',
    pos = vector3(1204.2119140625,-3102.7016601563,5.8680453300476),
    scale = vector3(0.8, 0.8, 0.8),
    msg = 'Lettere',--Text
    control = 'E',
    type = 21,--The Type of the marker(https://docs.fivem.net/docs/game-references/markers/)
    color = { r = 130, g = 120, b = 110 },
    action = function()
        TriggerServerEvent('lavori:prendilettere')
        waypoint = SetNewWaypoint(Config.venditalettere)
    end
})

TriggerEvent('gridsystem:registerMarker', {
    name = 'akdnasdjasdioksadhasujodghasbduijhasgdasyidgasyidasgyuisadgayidgadiuyagsdiuysagdsbyidgasbdydhasud',
    pos = vector3(-2553.1096191406,1914.6231689453,169.04135131836),
    scale = vector3(0.8, 0.8, 0.8),
    msg = 'Vendi lettere',--Text
    control = 'E',
    type = 21,--The Type of the marker(https://docs.fivem.net/docs/game-references/markers/)
    color = { r = 130, g = 120, b = 110 },
    action = function()
        TriggerServerEvent('lavori:venditalettere')
    end
})

