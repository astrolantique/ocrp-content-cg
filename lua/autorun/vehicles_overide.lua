


if 	util.IsValidModel( "models/props_phx/carseat2.mdl" ) then		
local V = { 	
				Name = "Car Seat 2", 
				Class = "prop_vehicle_prisoner_pod",
				Category = "PhoeniX-Storms",
				Author = "PhoeniX-Storms",
				Information = "PHX Airboat Seat Animation 2",
				Model = "models/props_phx/carseat2.mdl",
				Animation = "sit",
				KeyValues = {
								vehiclescript	=	"scripts/vehicles/prisoner_pod.txt"
							}
			}
list.Set( "Vehicles", "phx_seat2", V )
end

if 	util.IsValidModel( "models/props_phx/carseat3.mdl" ) then		
local V = { 	
				Name = "Car Seat 3", 
				Class = "prop_vehicle_prisoner_pod",
				Category = "PhoeniX-Storms",
				Author = "PhoeniX-Storms",
				Information = "PHX Airboat Seat Animation 3",
				Model = "models/props_phx/carseat3.mdl",
				Animation = "drive_jeep",
				KeyValues = {
								vehiclescript	=	"scripts/vehicles/prisoner_pod.txt"
							}
			}
list.Set( "Vehicles", "phx_seat3", V )
end

if 	util.IsValidModel( "models/props_phx/trains/fsd-overrun2.mdl" ) then		
local V = { 	
				Name = "Phoenix Train", 
				Class = "prop_vehicle_prisoner_pod",
				Category = "Phoenix Model Pack",
				Author = "Phoenix Storms",
				Information = "Phoenix Train",
				Model = "models/props_phx/trains/fsd-overrun2.mdl",
				Animation = "sit",
				AdjustSitPos = Vector(20,0,18), -------Move the sitting pos
				AdjustSpawnPos = { Pos = Vector(0,0,80) , Ang = Angle(0,0,0) },
				KeyValues = {
								vehiclescript	=	"scripts/vehicles/prisoner_pod.txt"
							}
			}
list.Set( "Vehicles", "phx_train", V )
end


