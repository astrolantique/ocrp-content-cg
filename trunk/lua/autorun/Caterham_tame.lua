
//
// Don't try to edit this file if you're trying to add new vehicles
// Just make a new file and copy the format below.
//

local Category = "Fueled"

	
local V = { 	
				Name = "Caterham_tame", 
				Class = "prop_vehicle_jeep",
				Category = "Fueled",
                                Author = "Master Chris",
				Information = "Caterham_tame",
				Model = "models/caterham/caterham.mdl",
				AdjustSitPos = Vector(-15,40,0), Angle(0,0,0),
				HeadLights = {
					Light1 = {Pos = Vector(-13,-53,32), Ang = Angle(0,10,90)}, 
					Light2 = {Pos = Vector(18,-53,32), Ang = Angle(0,-10,90)} 
				},
				Horn = {Sound = "vu_horn_double.wav", Pitch = 90},
				Customexits = { Vector(-90,36,22), Vector(82,36,22), Vector(22,24,90) ,Vector(2,100,30) },
				SeatType = "jeep_seat",
				ModView = { FirstPerson = Vector(2,-1,-8) },
				HideSeats = true, -----Hide the passenger seats?
				KeyValues = {vehiclescript	=	"scripts/vehicles/Caterham_tame.txt",
                                             SetBodyGroup = 7, 
                                             Skin = 4 
                                            } 
			}
list.Set( "Vehicles", "Caterham_tame", V )
