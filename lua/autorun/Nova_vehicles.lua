
local function HandleRollercoasterAnimation( vehicle, player )
	return player:SelectWeightedSequence( ACT_GMOD_SIT_ROLLERCOASTER ) 
end

local V = { 	
				Name = "Airboat Seat", 
				Class = "prop_vehicle_prisoner_pod",
				Category = "VU-MOD",
				Author = "Nova[X]",
				Information = "Airboat passenger Seat",
				Model = "models/nova/airboat_seat.mdl",
				ModView = { ThirdPerson = { Out = 80 , Up = 25 } },
				KeyValues = {vehiclescript	=	"scripts/vehicles/prisoner_pod.txt",
							 limitview		=	"0" },
				Members = {
								HandleAnimation = HandleRollercoasterAnimation,
							}
			}
list.Set( "Vehicles", "airboat_seat", V )

local V = { 	
				Name = "Jeep Seat", 
				Class = "prop_vehicle_prisoner_pod",
				Category = "VU-MOD",
				Author = "Nova[X]",
				Information = "Classic Jeep passenger Seat",
				Model = "models/nova/jeep_seat.mdl",
				ModView = { ThirdPerson = {Out = 80 , Up = 25} },
				KeyValues = {vehiclescript	=	"scripts/vehicles/prisoner_pod.txt",
							 limitview		=	"0" },
				Members = {
								HandleAnimation = HandleRollercoasterAnimation,
							}
			}
list.Set( "Vehicles", "jeep_seat", V )

local V = { 	
				Name = "Wood Chair", 
				Class = "prop_vehicle_prisoner_pod",
				Category = "VU-MOD",
				Author = "Nova[X]",
				Information = "Good Ol' Wodden chair",
				Model = "models/nova/chair_wood01.mdl",
				ModView = { ThirdPerson = {Out = 80 , Up = 25} },
				KeyValues = {vehiclescript	=	"scripts/vehicles/prisoner_pod.txt",
							 limitview		=	"0"},
				Members = {
								HandleAnimation = HandleRollercoasterAnimation,
							}
			}
list.Set( "Vehicles", "wood_chair", V )

local V = { 	
				Name = "Office Chair big", 
				Class = "prop_vehicle_prisoner_pod",
				Category = "VU-MOD",
				Author = "Nova[X]",
				Information = "Big and Comfortable office chair",
				Model = "models/nova/chair_office02.mdl",
				ModView = { ThirdPerson = {Out = 80 , Up = 25} },
				KeyValues = {vehiclescript	=	"scripts/vehicles/prisoner_pod.txt",
							 limitview		=	"0"},
				Members = {
								HandleAnimation = HandleRollercoasterAnimation,
							}
			}
list.Set( "Vehicles", "office_chair_big", V )
local V = { 	
				Name = "Office Chair small", 
				Class = "prop_vehicle_prisoner_pod",
				Category = "VU-MOD",
				Author = "Nova[X]",
				Information = "Just a Basic office chair",
				Model = "models/nova/chair_office01.mdl",
				ModView = { ThirdPerson = {Out = 80 , Up = 25} },
				KeyValues = {vehiclescript	=	"scripts/vehicles/prisoner_pod.txt",
							 limitview		=	"0"},
				Members = {
								HandleAnimation = HandleRollercoasterAnimation,
							}
			}
list.Set( "Vehicles", "office_chair_small", V )
local V = { 	
				Name = "Plastic Chair", 
				Class = "prop_vehicle_prisoner_pod",
				Category = "VU-MOD",
				Author = "Nova[X]",
				Information = "Cheap plastic chair",
				Model = "models/nova/chair_plastic01.mdl",
				ModView = { ThirdPerson = {Out = 80 , Up = 25} },
				KeyValues = {vehiclescript	=	"scripts/vehicles/prisoner_pod.txt",
							 limitview		=	"0"},
				Members = {
								HandleAnimation = HandleRollercoasterAnimation,
							}
			}
list.Set( "Vehicles", "plastic_chair", V )

local V = { 	
				Name = "Jeep", 
				Class = "prop_vehicle_jeep_old",
				Category = "VU-MOD",
				Author = "Nova[X]",
				Information = "The regular old jeep, with an extra seat",
				Model = "models/buggy.mdl",
				HeadLights = {
					Light1 = { Pos = Vector(-13,-50,40), Ang = Angle(0,10,90) } , 
					Light2 = { Pos = Vector(13,-50,40), Ang = Angle(0,-10,90) } 
				},
				Horn = {Sound = "vu_horn_simple.wav", Pitch = 90},
				Passengers  = { passenger1 = { Pos = Vector(16,37,19), Ang = Angle(0,0,0) } }, -------Set Up passenger seats!
				SeatType = "jeep_seat", ----if were not hideing the seat you probably want to choose a seat.
				HideSeats = false, -----Hide the passenger seats?
				KeyValues = {
								vehiclescript	=	"scripts/vehicles/jeep_test.txt"
							}
			}
list.Set( "Vehicles", "Jeep(VU)", V )

local V = { 	
				Name = "Airboat", 
				Class = "prop_vehicle_airboat",
				Category = "VU-MOD",
				Author = "Nova[X]",
				HeadLights = { Light1 = { Pos = Vector(-13,-24,30), Ang = Angle(0,-5,90) }},
				Horn = {Sound = "vu_horn_quick.wav", Pitch = 100},
				Passengers  = { passenger1 = { Pos = Vector(32,22,18), Ang = Angle(0,-90,00) },
								passenger2 = { Pos = Vector(-32,22,18), Ang = Angle(0,90,00) }				}, -------Set Up passenger seats!
				SeatType = "airboat_seat", ----if were not hideing the seat you probably want to choose a seat.
				HideSeats = false, -----Hide the passenger seats?
				Information = "Airboat from Half-Life 2",
				Model = "models/airboat.mdl",
				KeyValues = {
								vehiclescript	=	"scripts/vehicles/airboat.txt"
							}
			}
list.Set( "Vehicles", "Airboat(VU)", V )


----Just so those poor people who dont own EP2 dont have a cry
if 	util.IsValidModel( "models/vehicle.mdl" ) then		
local V = { 
				Name = "Jalopy Seat", 
				Class = "prop_vehicle_prisoner_pod",
				Category = "VU-MOD",
				Author = "Nova[X]",
				Information = "Jalopy passenger Seat",
				Model = "models/nova/jalopy_seat.mdl",
				ModView = { ThirdPerson = {Out = 80 , Up = 25} },
				KeyValues = {vehiclescript	=	"scripts/vehicles/prisoner_pod.txt",
							 limitview		=	"0"},
				Members = {
								HandleAnimation = HandleRollercoasterAnimation,
							}
			}
list.Set( "Vehicles", "jalopy_seat", V )
local V = { 	
				Name = "Jalopy", 
				Class = "prop_vehicle_jeep",
				Category = "VU-MOD",
				Author = "Nova[X]",
				Information = "Jalopy, With a working passanger seat!",
				Model = "models/vehicle.mdl",
				AdjustSitPos = Vector(-18,36,22),
				HeadLights = {
					Light1 = {Pos = Vector(-26,-78,30), Ang = Angle(0,10,90)}, 
					Light2 = {Pos = Vector(26,-78,30), Ang = Angle(0,-10,90)} 
				},
				Horn = {Sound = "vu_horn_simple.wav", Pitch = 90},
				Passengers  = { passenger1 = { Pos = Vector(22,24,22), Ang = Angle(0,0,0) } }, -------Set Up passenger seats!
				Customexits = { Vector(-90,36,22), Vector(82,36,22), Vector(22,24,90) ,Vector(2,100,30) },
				SeatType = "jeep_seat",
				ModView = { FirstPerson = Vector(0,0,12) },
				HideSeats = true, -----Hide the passenger seats?
				KeyValues = {vehiclescript	=	"scripts/vehicles/jalopy.txt"}
			}
list.Set( "Vehicles", "Jalopy(VU)", V )
end

