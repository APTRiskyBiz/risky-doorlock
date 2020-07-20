# risky-doorlock
My second releae from my personal mods collection to share with the FiveM community.  This is a highly modified copy of qalle-fivem's version of esx_doorlock with a variety of configurable options, as well as integrated Utkuali's new Fingerprint Hacking Minigame, special thanks to Utk for allowing me to use it!

qalle-fivem's esx_doorlock can be found here https://github.com/qalle-fivem/esx_doorlock

Utk's Fingerprint Hacking Minigame can be found here https://github.com/utkuali/Finger-Print-Hacking-Game

Preview https://streamable.com/mqgqxm

Large variety on configurable options! Enjoy the little EFT twist there.

```lua
Risky = {}

Risky.ShadowedText = true	--True if you want the rectagle shadow background, false if you want the origional esx_doorlock promt with no background.

--Configuration for Utkuali's Finger Print Hacking minigame.
Risky.Utk = {
	Item = 'laptop',	--Item from your DB to be used to initiate hacking on a door.
	Levels = 1,		--How many stages of the minigame to be played.  Max is 4, Min is 1
	Lifes = 2,		--How many chances you get to complete the minigame before failure.  Max is 6, Min is 1
	Time = 2,		--How much time a player has in minutes to complete the minigame before failure.  Max is 9, min is 1 (I highly recommend to set it between 3-1).
}

Risky.DoorList = {
	--
	-- Mission Row First Floor
	--
	-- Entrance Doors
	{
		textCoords = vector3(434.81, -981.93, 30.89),  --Coords for prompt to be displayed
		authorizedJobs = { 'police' },	--Authorized jobs allowed to access the door.  Allows multiple jobs i.e. authorizedJobs = { 'police', 'ambulance' }
		key = { 'labskeycard' },	--Item in your database to be used as a key to lock and unlock.  can be whatever you want but player must have said item.  Allows multiple keys i.e. key = { 'labskeycard', 'kibakey' },
		locking = false, --Don't Touch.
		locked = false, --Whether the door is locked(true) or unlocked(false) by default.
		hackable = true, --If the door is hackable, uses Utkuali's Finger Print Hacking Minigame.
		distance = 2.5, --Distance from Obj that prompt is displayed.
		doors = {
			{
				objName = 'v_ilev_ph_door01',
				objYaw = -90.0,
				objCoords = vector3(434.7, -980.6, 30.8)
			},

			{
				objName = 'v_ilev_ph_door002',
				objYaw = -90.0,
				objCoords = vector3(434.7, -983.2, 30.8)
			}
		}
	},
```

Enjoy!

A highly configurable door lock script for ESX.
