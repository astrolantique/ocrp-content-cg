
//
// Don't try to edit this file if you're trying to add new vehicles
// Just make a new file and copy the format below.
//

local Category = "Fueled"

	
local V = { 	
				Name = "Lambo_tame", 
				Class = "prop_vehicle_jeep",
				Category = "Fueled",
                                Author = "Master Chris",
				Information = "Lambo_tame",
				Model = "models/lambo/lambo.mdl",
				AdjustSitPos = Vector(-23,31,21), Angle(0,0,0),
				HeadLights = {
					Light1 = {Pos = Vector(-36,-90,38), Ang = Angle(0,10,90)}, 
					Light2 = {Pos = Vector(36,-90,38), Ang = Angle(0,-10,90)} 
				},
				Horn = {Sound = "vu_horn_double.wav", Pitch = 90},
				Customexits = { Vector(-90,36,22), Vector(82,36,22), Vector(22,24,90) ,Vector(2,100,30) },
				SeatType = "jeep_seat",
				ModView = { FirstPerson = Vector(0,-7,0) },
				HideSeats = true, -----Hide the passenger seats?
				KeyValues = {vehiclescript	=	"scripts/vehicles/lambo_tame.txt",
                                             SetBodyGroup = 511, 
                                             Skin = 1, 
                                            }
			}
list.Set( "Vehicles", "Lambo_tame", V )
