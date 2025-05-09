local vRP = exports['vrp']:link(); 

AddEventHandler('vRP:playerSpawn', function(user_id, source, first_spawn)
    if first_spawn then
        TriggerClientEvent('dt-tags:addTag', source, {
            playerName = GetPlayerName(source), -- Aici puteti folosi functia voastra din vrp de a lua numele in game al jucatorului;
            playerId = 'ID: '..user_id
        });
    end
end)