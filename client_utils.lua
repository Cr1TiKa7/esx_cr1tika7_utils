local Keys      = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


local ESX           = nil

-- TODO: ESX
Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10)
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)

-- Allows to create normal blips (Jobs, PD etc.)
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

-- Allows to create  small blips (Job points etc.)
function CreateSmallBlip(pos, sprite, color)
    sprite = sprite or 1
    color = color or 40
    local blip = AddBlipForCoord(pos.x, pos.y, pos.z)
    SetBlipSprite(blip, 1)
    SetBlipDisplay(blip, 2)
    SetBlipScale(blip, 0.4)
    SetBlipColour(blip, 40)
    return blip
end

function IsTrailerAttached()
    local chk,trailer = GetVehicleTrailerVehicle(GetVehiclePedIsUsing(PlayerPedId()))
    return trailer == trailerVeh
end

function IsPedInCar(veh)
	return (GetVehiclePedIsIn(PlayerPedId(), false) == veh)
end

function DeleteVehicle(veh)
    if DoesEntityExist(veh) and IsEntityAVehicle(veh) then
        ESX.Game.DeleteVehicle(veh)
    end
end


function DrawCustomMarker(sprite, pos, bobUp, scale, rotate, rotateToUser, directionX, directionY, directionZ, 
    rotX, rotY, rotZ, red, green, blue , alpha)
    sprite = sprite or 2
    scale = scale or 1.3
    bobUp = bobUp or true
    directionX = directionX or 0.0
    directionY = directionY or 0.0
    directionZ = directionZ or 0.0
    rotX = rotX or 0.0
    rotY = rotY or 0.0
    rotZ = rotZ or 0.0
    red = red or 255
    green = green or 255
    blue = blue or 0
    alpha = alpha or 200
    rotate = rotate or false
    rotateToUser = rotateToUser or false
    DrawMarker(sprite, pos.x, pos.y, pos.z, directionX, directionY, directionZ, 
        rotX, rotY, rotZ, scale, scale, scale, 
        red, green, blue, alpha, 
        bobUp, rotateToUser, 2, rotate, nil, nil, false)
end

function ResetSkin()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
end

function JobSetUniform(male, female)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		else
			if female ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		end
	end)
end

function ShowPedHelpDialog(text)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end
