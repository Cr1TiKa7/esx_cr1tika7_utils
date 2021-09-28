# esx_cr1tika7_utils
Util classes for fivem/esx

## How to install
- Copy the folder into the 'Resources' folder of your server
- Add to 'start cr1tika7_utils' to the server.cfg
- Add the following lines to your fxmanifest.lua:
- - '@cr1tika7_utils/client_utils.lua' -- To the client_scripts section
- - '@cr1tika7_utils/server_utils.lua' -- To the server_scripts section

## Available methods/functions


### CreateCustomBlip (Returns the blip)
- Position [vector3]
- Sprite [int]
- Display [int]
- Scale [double]
- Colour [int]
- Alpha [int]
- Friend [int]
- Short [int]
- Name [string]
- BlipName [string]

> Creates a blip on the minimap. E.g. for jobs or PD

### CreateSmallBlip (Returns the blip)
- Position [vector3]
- Sprite [int]
- Colour [int]

> Creates a small blip on the minimap. E.g. for job markers

### IsTrailerAttached (Returns a boolean)
> Returns true if the vehicle the player is driving has an trailer attached

### IsPedInCar (Returns a boolean)
> Returns true if the player is inside a vehicle

### DeleteVehicle
- Vehicle [vehicle]

> Deletes the given vehicle

### DrawCustomMarker
- Sprite [int] -> Default 2
- Position [vector3] 
- BopUpAndDown [bool] -> default true
- Rotate [bool] -> default false
- RotateToUser [bool] -> default false
- DirectionX [double] -> default 0.0
- DirectionY [double] -> default 0.0
- DirectionZ [double] -> default 0.0
- RotX [double] -> default 0.0
- RotY [double] -> default 0.0
- RotZ [double] -> default 0.0
- Red [int] -> default 255
- Green [int] -> default 255
- Blue [int] -> default 0
- Alpha [int] -> default 200

> Creates markes in the 3d world space. E.g. for job points

### ResetSkin
> Resets the skin of the player to the one set in the database

### JobSetUniform
- Male [dictionary]
- Female [dictionary]
> Sets the players clothes to the given ones (config.lua example below)

### ShowPedHelpDialog
- Text [string]
> Shows the player a small dialog in the top left corner with the given text

## Examples

### Job Clothes config.lua Sample
``` lua
Config.JobUniforms = {
	male = {
		['sex'] = 0,
    ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    ['torso_1'] = 41,   ['torso_2'] = 0,
    ['decals_1'] = 0,   ['decals_2'] = 0,
    ['arms'] = 1,
    ['pants_1'] = 8,   ['pants_2'] = 0,
    ['shoes_1'] = 15,   ['shoes_2'] = 0,
    ['chain_1'] = 0,    ['chain_2'] = 0,
    ['bproof_1'] = 0,     ['bproof_2'] = 0	
	},
	female = {
		['sex'] = 1,		
    ['tshirt_1'] = 86,  ['tshirt_2'] = 0,
    ['torso_1'] = 3,   ['torso_2'] = 0,
    ['decals_1'] = 0,   ['decals_2'] = 0,
    ['arms'] = 1,
    ['pants_1'] = 1,   ['pants_2'] = 0,
    ['shoes_1'] = 28,   ['shoes_2'] = 0,
    ['chain_1'] = 0,    ['chain_2'] = 0,
    ['bproof_1'] = 0,     ['bproof_2'] = 0	
	}
}
```