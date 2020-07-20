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
		lck = false, --Don't Touch.
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
	-- To locker room & roof
	--
	-- Mission Row First Floor
	--
	-- Entrance Doors
	{
		textCoords = vector3(434.81, -981.93, 30.89),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 2.5,
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
	-- To locker room & roof
	{
		objName = 'v_ilev_ph_gendoor004',
		objYaw = 90.0,
		objCoords  = vector3(449.6, -986.4, 30.6),
		textCoords = vector3(450.09, -986.92, 30.68),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 1.5,
	},
	-- Rooftop
	{
		objName = 'v_ilev_gtdoor02',
		objYaw = 90.0,
		objCoords  = vector3(464.3, -984.6, 43.8),
		textCoords = vector3(464.38, -983.64, 43.8),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 1.5,
	},
	-- Hallway to roof
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = 90.0,
		objCoords  = vector3(461.2, -985.3, 30.8),
		textCoords = vector3(461.34, -986.283, 30.8),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 1.5,
	},
	-- Armory
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = -90.0,
		objCoords  = vector3(452.6, -982.7, 30.6), 
		textCoords = vector3(452.95, -982.16, 30.99),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 1.5,
	},
	-- Captain Office
	{
		objName = 'v_ilev_ph_gendoor002',
		objYaw = -180.0,
		objCoords  = vector3(447.2, -980.6, 30.6),
		textCoords = vector3(447.61, -979.9, 30.7),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 1.5,
	},
	-- To downstairs (double doors)
	{
		textCoords = vector3(444.71, -989.43, 30.92),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 2.0,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 180.0,
				objCoords = vector3(443.9, -989.0, 30.6)
			},

			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 0.0,
				objCoords = vector3(445.3, -988.7, 30.6)
			}
		}
	},
	--
	-- Mission Row Cells
	--
	-- Main Cells
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 0.0,
		objCoords  = vector3(463.8, -992.6, 24.9),
		textCoords = vector3(463.3, -992.6, 25.1),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 1.0,
	},
	-- Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = -90.0,
		objCoords  = vector3(462.3, -993.6, 24.9),
		textCoords = vector3(461.8, -993.3, 25.0),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 1.0,
	},
	-- Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vector3(462.3, -998.1, 24.9),
		textCoords = vector3(461.8, -998.8, 25.0),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 1.0,
	},
	-- Cell 3
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vector3(462.7, -1001.9, 24.9),
		textCoords = vector3(461.8, -1002.4, 25.0),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 1.0,
	},
	-- To Back
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 0.0,
		objCoords  = vector3(464.61, -1003.64, 24.98),
		textCoords = vector3(464.61, -1003.64, 24.98),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 1.0,
	},
	--
	-- Mission Row Back
	--
	-- Back (double doors)
	{
		textCoords = vector3(468.67, -1014.43, 26.48),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_rc_door2',
				objYaw = 0.0,
				objCoords  = vector3(467.3, -1014.4, 26.5)
			},

			{
				objName = 'v_ilev_rc_door2',
				objYaw = 180.0,
				objCoords  = vector3(469.9, -1014.4, 26.5)
			}
		}
	},
	-- Back Gate
	{
		objName = 'hei_prop_station_gate',
		objYaw = 90.0,
		objCoords  = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 14,
		size = 2
	},
	--
	-- Mission Row Extension
	--
	-- Briefing room
	{
		textCoords = vector3(455.86, -981.31, 26.86),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 90.0,
				objCoords  = vector3(455.94, -980.57, 26.67)
			},

			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 270.0,
				objCoords  = vector3(455.85, -982.14, 26.67)
			}
		}
	},
	-- To Breakrooms
	{
		objName = 'v_ilev_ph_gendoor005',
		objYaw = 90.0,
		objCoords  = vector3(465.62, -985.93, 25.74),
		textCoords = vector3(465.62, -985.93, 25.74),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 1.0,
	},
	-- New Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 180.0,
		objCoords  = vector3(468.57, -999.44, 25.07),
		textCoords = vector3(468.57, -999.44, 25.07),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 1.0,
	},
	-- New Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 180.0,
		objCoords  = vector3(472.16, -999.47, 25.05),
		textCoords = vector3(472.16, -999.47, 25.05),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 1.0,
	},
	-- New Cell 3
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 180.0,
		objCoords  = vector3(476.4, -1007.68, 24.41),
		textCoords = vector3(476.4, -1007.68, 24.41),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 1.0,
	},
	-- New Cell 4
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 180.0,
		objCoords  = vector3(480.0, -1007.7, 24.41),
		textCoords = vector3(480.0, -1007.7, 24.41),
		authorizedJobs = { 'police' },
		key = { 'labskeycard' },
		lck = false,
		locked = false,
		hackable = true,
		distance = 1.0,
	}
}
