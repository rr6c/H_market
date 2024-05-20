local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", GetCurrentResourceName())
tvRP = {}
Tunnel.bindInterface("vRP", tvRP)

RegisterServerEvent("JsIJ83cpVAws6jJccvQncNSecDdhTDyF1b3Q2O4Hx1W61Yytt6")
AddEventHandler("JsIJ83cpVAws6jJccvQncNSecDdhTDyF1b3Q2O4Hx1W61Yytt6", function(item)
    local player = source
    local user_id = vRP.getUserId({ player })
    if user_id then
        local price = Config.prices[item]
        if price then
            if vRP.tryPayment({ user_id, price }) then
                vRP.giveInventoryItem({ user_id, item, 1, true })
            else
                print("Error: You don't have Money")
            end
        else
            print("Error: Item price not found.")
        end
    else
        print("Error: User ID not found.")
    end
end)