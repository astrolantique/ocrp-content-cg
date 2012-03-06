AddCSLuaFile("Client/ClientVehicleScript.lua")
vu_enablehorn = CreateConVar( "vu_enablehorn", "1", { FCVAR_PROTECTED } )  
local function SpawnedVehicle(player, vehicle)
local localpos = vehicle:GetPos() local localang = vehicle:GetAngles()
			----Add passenger seats
if vehicle.VehicleTable then
	if vehicle.VehicleTable.Passengers then		
			-----Grab the data for the extra seats, we do want the lovely sitting anim dont we.
			local SeatName = vehicle.VehicleTable.SeatType
			
			local seatdata = list.Get( "Vehicles" )[ SeatName ]
			
			-----Repeat for each seat.
		for a,b in pairs(vehicle.VehicleTable.Passengers) do
			local SeatPos = localpos + ( localang:Forward() * b.Pos.x) + ( localang:Right() * b.Pos.y) + ( localang:Up() * b.Pos.z)
			local Seat = ents.Create( "prop_vehicle_prisoner_pod" )
			Seat:SetModel( seatdata.Model )
			Seat:SetKeyValue( "vehiclescript" , "scripts/vehicles/prisoner_pod.txt" )
			Seat:SetAngles( localang + b.Ang )
			Seat:SetPos( SeatPos )
				Seat:Spawn()
				Seat:Activate()
				Seat:SetParent(vehicle)
				if vehicle.VehicleTable.HideSeats then
					Seat:SetColor(255,255,255,0)
				end
				if ( seatdata.Members ) then
				table.Merge( Seat, seatdata.Members )
				end
				if ( seatdata.KeyValues ) then
					for k, v in pairs( seatdata.KeyValues ) do
					Seat:SetKeyValue( k, v )
					end		
				end
			Seat.VehicleName = "Jeep Seat"
			Seat.VehicleTable = seatdata
			Seat.ClassOverride = "prop_vehicle_prisoner_pod"
			Seat:DeleteOnRemove( vehicle )
			----------- Replace the position with the ent so we can find it later.
			vehicle.VehicleTable.Passengers[a].Ent = Seat
		end
	end
	if vehicle.VehicleTable.HeadLights then
		vehicle.HeadLights = {}
		local lights = vehicle.VehicleTable.HeadLights
		local angles = vehicle:GetAngles()
		for a,b in pairs(lights) do
		local pos = vehicle:GetPos() + ( angles:Forward() * b.Pos.x ) + ( angles:Right() * b.Pos.y ) + ( angles:Up() * b.Pos.z )
				vehicle.HeadLights[a] = ents.Create( "vu_headlight" )
				vehicle.HeadLights[a]:SetPos(pos)
				vehicle.HeadLights[a]:SetAngles( angles + b.Ang )
				vehicle.HeadLights[a]:SetParent(vehicle)
				vehicle.HeadLights[a]:Spawn()
				vehicle.HeadLights[a]:DeleteOnRemove( vehicle )
		end
	end
end
end

local NormalExits = { "exit1","exit2","exit3","exit4","exit5","exit6"}
local function GetVehicleExit(player,vehicle)
if vehicle.VehicleTable then
	if vehicle.VehicleTable.Customexits then
		for a,b in pairs(vehicle.VehicleTable.Customexits) do
		----------------Calculate actual postion ------------------
		local localpos = vehicle:GetPos() local localang = vehicle:GetAngles()
		localpos = localpos + ( localang:Forward() * b.x) + ( localang:Right() * b.y) + ( localang:Up() * b.z)
		-----------Trace to see if we can get out there------
		if vehicle:VisibleVec(localpos) then
		player:SetPos(localpos)
		return
		end
		end
	end
	for a,b in pairs(NormalExits) do
		local angpos = vehicle:GetAttachment( vehicle:LookupAttachment( b ) )
		if angpos != nil then
		if 	vehicle:VisibleVec( angpos.Pos ) then
		player:SetPos( angpos.Pos )
		return
		end
		end
	end
end
end

local function DoVehicleExit( player ) 
	local vehicle = player:GetVehicle()
	----i need to make sure the player is deffinately out of the car.
	if player:InVehicle() then
	player:ExitVehicle()
	end
	----by now we should be out of the car, we better check this just to prevent any errors
	if !player:InVehicle() then
		if vehicle.VehicleTable then
		if vehicle:GetParent():IsValid() then
		local parent = vehicle:GetParent()
			if parent:IsVehicle() then
				if parent.VehicleTable.Passengers then
					GetVehicleExit(player,parent)
				end
			end
		elseif vehicle.VehicleTable.Customexits then
			GetVehicleExit(player,vehicle)
		end
		end
		
		--if vehicle.VehicleTable.HeadLights then
		---vehicle:SetNetworkedVar("HeadLights", false )
		--end
	end
end

-------The "PlayerUse" seems to repeat about 3 times, i better stop this.
local function GetInCar( player , vehicle )	
   ------Seat trace, allows you to access seats inside a car.
	if vehicle:IsVehicle() then 
		if vehicle.VehicleTable && vehicle.VehicleTable.Passengers then
			-----trace trough the car and see if your looking at a seat----
			local Start = player:GetShootPos() local Forward = player:GetAimVector()
			local trace = {} trace.start = player:GetShootPos() trace.endpos = Start + (Forward * 90)
			trace.filter = { player , vehicle } local trace = util.TraceLine( trace ) 
			-----did we hit a seat? if so, can we get in it?
			if trace.Entity:IsValid() && trace.Entity:IsVehicle() then
			player:EnterVehicle( trace.Entity )
			end 
		end
	end
end


local function RepositionPlayer( player, vehicle )
					---------Calculate Pos-------------
		local localpos = vehicle:GetPos() local localang = vehicle:GetAngles()
		local definepos = vehicle.VehicleTable.AdjustSitPos
		localpos = localpos + ( localang:Forward() * definepos.x) + ( localang:Right() * definepos.y) + ( localang:Up() * definepos.z)
					----------------------------------------
		player:SetParent()
		player:SetPos(localpos)
		player:SetParent(vehicle)
end

local function EnteredVehicle( player, vehicle, role )
	----Setup / clear VeiwData
	player:SendLua("LocalPlayer().VehicleViewMod = {}" )
	if vehicle.VehicleTable && vehicle.VehicleTable.ModView then
		if vehicle.VehicleTable.ModView.FirstPerson then
		local Vec = vehicle.VehicleTable.ModView.FirstPerson
		player:SendLua("LocalPlayer().VehicleViewMod.FirstPos = Vector("..Vec.x..","..Vec.y..","..Vec.z..")" )
		end
		if vehicle.VehicleTable.ModView.ThirdPerson then
		local LuaLine = "LocalPlayer().VehicleViewMod.Filter = { Entity("..vehicle:EntIndex()..")"
		local Passangers = vehicle.VehicleTable.Passengers or vehicle:GetParent().VehicleTable.Passengers or nil
			if Passangers then
				for a,b in pairs(Passangers) do 
				LuaLine = LuaLine .. ",Entity(".. b.Ent:EntIndex()..")"
				end
			end
			if vehicle:GetParent() && vehicle:GetParent():IsValid() then
				LuaLine = LuaLine .. ",Entity("..vehicle:GetParent():EntIndex()..")"
			end
		player:SendLua( LuaLine.."}" )
		player:SendLua("LocalPlayer().VehicleViewMod.ThirdOut = ".. vehicle.VehicleTable.ModView.ThirdPerson.Out )
		player:SendLua("LocalPlayer().VehicleViewMod.ThirdUp = ".. vehicle.VehicleTable.ModView.ThirdPerson.Up )
		end	
	if vehicle.VehicleTable && vehicle.VehicleTable.AdjustSitPos then
	--I Had to delay the function, Otherwise it just looses effect
	timer.Simple(0.1, RepositionPlayer, player, vehicle) 
	end
	end
end 

local function ExitingCar ( player, key )
 if key == IN_USE and player:InVehicle() then
	DoVehicleExit(player)
	---now i need to set the position after i get out of the car... so instead of waiting for this to pass, ill forse it myself
	return false
 end
end


local function ToggleHeadLights( player,cmd,arg )
if player:InVehicle() then
	local vehicle = player:GetVehicle()
	if vehicle.VehicleTable && vehicle.VehicleTable.HeadLights then
			for a,b in pairs(vehicle.HeadLights) do
			b:Toggle()
			vehicle:EmitSound("items/flashlight1.wav", 100, 100)  
			end
	end
end
end
concommand.Add( "ToggleHeadLights", ToggleHeadLights )

local function HonkHorn( player,cmd,arg )
if player:InVehicle() and vu_enablehorn:GetInt() != 0 then
local vehicle = player:GetVehicle()
   if vehicle.VehicleTable && vehicle.VehicleTable.Horn then
   player:GetVehicle():EmitSound(vehicle.VehicleTable.Horn.Sound, 100, vehicle.VehicleTable.Horn.Pitch) 
   end
end
end
concommand.Add( "HonkHorn", HonkHorn )

if SERVER then
hook.Add( "KeyPress", "ExitingCar", ExitingCar ) 
end
hook.Add( "PlayerSpawnedVehicle", "SpawnedVehicle", SpawnedVehicle ); 
hook.Add( "PlayerEnteredVehicle", "EnteredVehicle", EnteredVehicle ); 
hook.Add( "PlayerUse", "GetInCar", GetInCar ) 