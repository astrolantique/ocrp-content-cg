local V = { 	
				Name = "Dodge Charger SRT8 Police Car", 
				Class = "prop_vehicle_jeep_old",
				Category = "TDM Cars",
				Author = "TheDanishMaster, Turn 10",
				Information = "The Dodge Charger SRT8 in Police Car version, gmod-able by TDM",
				Model = "models/tdmcars/copcar.mdl",
				Horn = {Sound = "vu_horn_simple.wav", Pitch = 90},
                		Passengers  = {
				Passenger2 = { Pos = Vector(45,-8,21), Ang = Angle(0,0,0) },
				Passenger1 = { Pos = Vector(43,31,25), Ang = Angle(0,0,0) },
				Passenger3 = { Pos = Vector(5,31,25), Ang = Angle(0,0,0) },
			    }, -------Set Up passenger seats!
				SeatType = "jeep_seat",               			
				HideSeats = true, -----Hide the passenger seats?				
				HeadLights = {
						Light1 = {Pos = Vector(59,-105,38), Ang = Angle(0,-10,80)}, 
						Light2 = {Pos = Vector(-10,-105,38), Ang = Angle(0,10,80)},  
						Light3 = {Pos = Vector(56,-105,18), Ang = Angle(0,-10,80)}, 
						Light4 = {Pos = Vector(-6,-105,18), Ang = Angle(0,10,80)}
						},
				KeyValues = {
								vehiclescript	=	"scripts/vehicles/TDMCars/copcar.txt"
							}
			}
list.Set( "Vehicles", "Copcar", V )
