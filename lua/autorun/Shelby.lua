
//
// Don't try to edit this file if you're trying to add new vehicles
// Just make a new file and copy the format below.
//

local Category = "Fueled"

	
local V = { 	
				Name = "Shelby", 
				Class = "prop_vehicle_jeep",
				Category = "Fueled",
                                Author = "Master Chris",
				Information = "Shelby",
				Model = "models/shelby/shelby.mdl",
				AdjustSitPos = Vector(-15,20,22), Angle(0,0,0),
				HeadLights = {
					Light1 = {Pos = Vector(-29.5,-90.5,31), Ang = Angle(0,10,90)}, 
					Light2 = {Pos = Vector(29.5,-90.5,31), Ang = Angle(0,-10,90)} 
				},
				Horn = {Sound = "vu_horn_double.wav", Pitch = 90},
				Customexits = { Vector(-90,36,22), Vector(82,36,22), Vector(22,24,90) ,Vector(2,100,30) },
				SeatType = "jeep_seat",
				ModView = { FirstPerson = Vector(0,-5.5,8)},
				HideSeats = true, -----Hide the passenger seats?
				KeyValues = {vehiclescript	=	"scripts/vehicles/Shelby_edited.txt",
                                             SetBodyGroup = 511, 
                                             Skin = 7
                                            } 
			}
list.Set( "Vehicles", "Shelby", V )
