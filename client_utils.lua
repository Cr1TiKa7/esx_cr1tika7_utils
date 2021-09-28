local ESX           = nil

-- TODO: ESX
Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10)
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)

function CreateCustomBlip(pos, sprite, display, scale, color, alpha, friend, short, name, blipName)
    local blip = AddBlipForCoord(pos.x, pos.y, pos.z)
    SetBlipSprite(blip, sprite)
    SetBlipDisplay(blip, display)
    SetBlipScale(blip, scale)
    SetBlipColour(blip, color)
    SetBlipAlpha(blip, alpha)
    SetBlipAsFriendly(blip, friend)
    SetBlipAsShortRange(blip, short)
    AddTextEntry(blipName, name)
    BeginTextCommandSetBlipName(blipName)
    EndTextCommandSetBlipName(blip)
    return blip
end