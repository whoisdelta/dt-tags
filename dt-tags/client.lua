RegisterNetEvent('dt-tags:addTag', function(data)
    Citizen.CreateThread(function()
        while type(data) == 'table' do
            local players = GetActivePlayers();
            local myPed = PlayerPedId();
            local myCoords = GetEntityCoords(myPed);
            local wait = 1000;
            
            for _, player in ipairs(players) do
                local targetPed = GetPlayerPed(player);
                local targetCoords = GetEntityCoords(targetPed);
                local distance = #(myCoords - targetCoords);
                
                if distance <= 6.0 and targetPed ~= myPed then
                    wait = 0;

                    SetDrawOrigin(targetCoords.x, targetCoords.y, targetCoords.z + 1.4, 0);
                    BeginTextCommandDisplayText("STRING");
                    AddTextComponentSubstringPlayerName(data['playerName'] .. "\n" .. data['playerId']);
                    SetTextScale(0.40, 0.37);
                    SetTextFont(6);
                    SetTextColour(255, 255, 255, 215);
                    SetTextCentre(true);
                    SetTextDropshadow(1, 0, 0, 0, 255);
                    EndTextCommandDisplayText(0.0, 0.0);
                    ClearDrawOrigin();
                end
            end
            
            Citizen.Wait(wait);
        end
    end)
end)