local function TraceVehicleVeiw( Start, End , Filter)
  local trace = {}
		trace.start = Start
		trace.endpos = End
		trace.filter = Filter 
  local tr = util.TraceLine( trace ) 
return tr.HitPos
end


function DoVehicleVeiw( player, origin, angles, fov )
if player:InVehicle() and player.VehicleViewMod then
local VeiwMod = player.VehicleViewMod
 if gmod_vehicle_viewmode:GetInt() == 1 then
	if VeiwMod.ThirdOut and VeiwMod.ThirdUp then
	    local vehicle = player:GetVehicle()
		local view = {}
		view.angles = angles
		local End = origin - ( angles:Forward() * VeiwMod.ThirdOut ) + ( angles:Up() * VeiwMod.ThirdUp )
		view.origin = TraceVehicleVeiw( vehicle:GetPos() , End , VeiwMod.Filter )
	return view
	end
 else
	if VeiwMod.FirstPos then
	local Pos = VeiwMod.FirstPos
    	local view = {}
		view.angles = angles
		view.origin = origin + ( angles:Forward() * Pos.x ) + ( angles:Right() * Pos.y ) + ( angles:Up() * Pos.z )
	return view
	end
 end
end
end
hook.Add("CalcView", "DoVehicleVeiw", DoVehicleVeiw) 

local AntiCmdSpam = CurTime()
local function VehicleBlindPress( ply, bind, pressed )
if ply:InVehicle() then
	if string.find( bind, "impulse 100" )then if AntiCmdSpam + 0.8 <  CurTime() then RunConsoleCommand("ToggleHeadLights") AntiCmdSpam = CurTime() end return true end
	if string.find( bind, "+reload" )then if AntiCmdSpam + 0.5 <  CurTime() then RunConsoleCommand("HonkHorn") AntiCmdSpam = CurTime() end return true end
end
end 
hook.Add("PlayerBindPress", "VehicleBlindPress", VehicleBlindPress) 


 