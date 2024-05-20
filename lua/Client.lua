local display = false
local display2 = false

function SetDisplay(bool)
    if display ~= bool then
        display = bool
        SetNuiFocus(false, false)
        SendNUIMessage({
            type = "H_market_eays",
            status = bool,
        })
    end
end

function SetDisplay2(bool)
    if display2 ~= bool then
        display2 = bool
        SetNuiFocus(bool, bool)
        SendNUIMessage({
            type = "H_market_test",
            status = bool,
        })
    end
end

RegisterNUICallback("close", function()
    SetDisplay(false)
    SetDisplay2(false)
end)

RegisterNUICallback("buyItem", function(data)
    local item = data.item
    TriggerServerEvent("JsIJ83cpVAws6jJccvQncNSecDdhTDyF1b3Q2O4Hx1W61Yytt6", item)
end)

CreateThread(function()
    while true do
        if not HasStreamedTextureDictLoaded("H_market") then
            RequestStreamedTextureDict("H_market", true)
            while not HasStreamedTextureDictLoaded("H_market") do
                Wait(1)
            end
        else
            local time = 3000
            local Player = PlayerPedId()
            local coords = GetEntityCoords(Player)
            
            local nearestLocation = nil
            local nearestDistance = math.huge
            
            for location, locationCoords in pairs(Config.Coords) do
                local dist = #(coords - vector3(locationCoords[1], locationCoords[2], locationCoords[3]))

                if dist < nearestDistance then
                    nearestDistance = dist
                    nearestLocation = location
                end
            end

            if nearestDistance < 2 then
                DrawMarker(9, Config.Coords[nearestLocation][1], Config.Coords[nearestLocation][2], Config.Coords[nearestLocation][3], 0.0, 0.0, 0.0, 0.0, 90.0, 0.5, 1.5, 1.5, 1.1, 255, 255, 255, 255, false, false, 2, false, "H_market", "H_market", false)
            end

            if nearestDistance < 1 then
                time = 0
                if not display and not display2 then
                    SetDisplay(true)
                end
                if IsControlJustPressed(0, 38) then
                    SetDisplay(false)
                    SetDisplay2(true)
                end
            else
                if display or display2 then
                    SetDisplay(false)
                    SetDisplay2(false)
                end
            end
        end
        Wait(time)
    end
end)