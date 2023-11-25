-- Function to check if a player is in a vehicle
function DisplayHud()
    while true do
        Wait(2)

        local playerPed = GetPlayerPed(-1)  -- Get the player's Ped (character) handle

        if IsPlayerInVehicle(playerPed) then
            local speed = math.floor(GetPedSpeed(playerPed))
            if Config.Units == "KMH" then
                DisplayText(speed  .. " KMH")
                
            else
                DisplayText(speed  .. " MPH")
            end
        end
    end
end



-- Function to check if a player is in a vehicle
function IsPlayerInVehicle(playerPed)
    return IsPedInAnyVehicle(playerPed, false)  -- Check if the player is in any vehicle
end

-- To convert to MPH: speed * 2.236936
-- To convert to KPH: speed * 3.6

function GetPedSpeed(playerPed)
    if Config.Units == "KMH" then
        return (GetEntitySpeed(playerPed) * 3.6)
    else
        return (GetEntitySpeed(playerPed) * 2.236936)
    end
end

-- Create a thread to run the CheckPlayerInVehicle function continuously
Citizen.CreateThread(function()
    DisplayHud()
end)

-- Function to display text on the screen
function DisplayText(text)
    SetTextFont(7)  -- Font type (0-4 are valid)
    SetTextScale(Config.Hud.scale, Config.Hud.scale)
    SetTextColour(Config.Color.r, Config.Color.g, Config.Color.b, 255)  -- Text color (RGBA)
    SetTextOutline()  -- Enable text outline
    SetTextCentre(false)  -- Align text to the left
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(Config.Hud.x, Config.Hud.y)
end
