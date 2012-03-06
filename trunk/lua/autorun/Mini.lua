
//
// Don't try to edit this file if you're trying to add new vehicles
// Just make a new file and copy the format below.
//

local Category = "Fueled"

	
local V = { 	
				Name = "Mini", 
				Class = "prop_vehicle_jeep",
				Category = "Fueled",
                                Author = "Master Chris",
				Information = "Mini",
				Model = "models/mini/mini.mdl",
				AdjustSitPos = Vector(13,10,15), Angle(0,0,0),
				HeadLights = {
					Light1 = {Pos = Vector(-24,-65,30), Ang = Angle(0,10,90)}, 
					Light2 = {Pos = Vector(24,-65,30), Ang = Angle(0,-10,90)} 
				},
				Horn = {Sound = "vu_horn_double.wav", Pitch = 90},
				Customexits = { Vector(-90,36,22), Vector(82,36,22), Vector(22,24,90) ,Vector(2,100,30) },
				SeatType = "jeep_seat",
				ModView = { FirstPerson = Vector(5,-4,5)},
				HideSeats = true, -----Hide the passenger seats?
				KeyValues = {vehiclescript	=	"scripts/vehicles/Mini.txt",
                                             SetBodyGroup = 1023, 
                                             Skin = 2
                                            } 
			}
list.Set( "Vehicles", "Mini", V )
