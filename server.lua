RegisterServerEvent("lavori:inizialavoropizza")
AddEventHandler("lavori:inizialavoropizza", function(item, count)
     local xPlayer = ESX.GetPlayerFromId(source) 
     local job = xPlayer.getJob().name
     if job == Config.jobFattorino then
     xPlayer.addInventoryItem(Config.Itempizza, Config.QuantitaPizze)
     else
          xPlayer.showNotification(Config.notificageneraleperblipenegazioni)
     end
end)

RegisterNetEvent('pizza:settalavoro')
AddEventHandler('pizza:settalavoro', function(job)
     local xPlayer = ESX.GetPlayerFromId(source)
     xPlayer.setJob(Config.jobFattorino, 0)
end)

RegisterServerEvent('camion:settalavoro')
AddEventHandler('camion:settalavoro', function(job)
     local xPlayer = ESX.GetPlayerFromId(source)
     xPlayer.setJob(Config.jobcamionista, 0)
end)

RegisterServerEvent('postino:settalavoro')
AddEventHandler('postino:settalavoro', function(job)
     local xPlayer = ESX.GetPlayerFromId(source)
     xPlayer.setJob(Config.joblettere, 0)
end)


RegisterServerEvent("lavori:suonacampanello")
AddEventHandler("lavori:suonacampanello", function(item, count)
     local xPlayer = ESX.GetPlayerFromId(source)
     local job = xPlayer.getJob().name
     if job == Config.jobFattorino then
     xPlayer.removeInventoryItem(Config.Itempizza, Config.QuantitaPizze)
     xPlayer.addInventoryItem(Config.Itemsoldi, Config.Pagafattorino)
     else
          xPlayer.showNotification(Config.notificageneraleperblipenegazioni)
     end
     Wait(2000)
     xPlayer.setJob(Config.jobbase, 0)
     xPlayer.showNotification(Config.notificaquandofiniscilavori)
end)

RegisterServerEvent('lavori:caricamerce')
AddEventHandler('lavori:caricamerce', function(item, count)
     local xPlayer = ESX.GetPlayerFromId(source) 
     local job = xPlayer.getJob().name
     if job == Config.jobcamionista then
          xPlayer.addInventoryItem(Config.itemfogliocaricamerce, Config.quantitafogli)
     else
          xPlayer.showNotification(Config.notificageneraleperblipenegazioni)
     end
end)

RegisterServerEvent('lavori:vendimerce')
AddEventHandler('lavori:vendimerce', function()
     local xPlayer = ESX.GetPlayerFromId(source) 
     local job = xPlayer.getJob().name
     if job == Config.jobcamionista then
          xPlayer.addInventoryItem(Config.Itemsoldi, Config.pagacamionista)
          xPlayer.removeInventoryItem(Config.itemfogliocaricamerce, Config.quantitafogli)
     else
          xPlayer.showNotification(Config.notificageneraleperblipenegazioni)
     end
     Wait(2000)
     xPlayer.setJob(Config.jobbase, 0)
     xPlayer.showNotification(Config.notificaquandofiniscilavori)
end)

RegisterServerEvent('lavori:prendilettere')
AddEventHandler('lavori:prendilettere', function(item, count)
     local xPlayer = ESX.GetPlayerFromId(source) 
     local job = xPlayer.getJob().name
     if job == Config.joblettere then
          xPlayer.addInventoryItem(Config.itemlettere, Config.quantitalettere)
     else
          xPlayer.showNotification(Config.notificageneraleperblipenegazioni)
     end
end)

RegisterServerEvent('lavori:venditalettere')
AddEventHandler('lavori:venditalettere', function()
     local xPlayer = ESX.GetPlayerFromId(source) 
     local job = xPlayer.getJob().name
     if job == Config.joblettere then
          xPlayer.addInventoryItem(Config.Itemsoldi, Config.pagalettere)
          xPlayer.removeInventoryItem(Config.itemlettere, Config.quantitalettere)
     else
          xPlayer.showNotification(Config.notificageneraleperblipenegazioni)
     end
     Wait(2000)
     xPlayer.setJob(Config.jobbase, 0)
     xPlayer.showNotification(Config.notificaquandofiniscilavori)
end)

