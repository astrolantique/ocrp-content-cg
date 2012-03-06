include('shared.lua')
local matLight 		= Material( "sprites/light_ignorez" )
local matBeam		= Material( "effects/lamp_beam" )
ENT.RenderGroup 	= RENDERGROUP_BOTH
function ENT:Initialize()
	self.PixVis = util.GetPixelVisibleHandle()
end
function ENT:Draw()
end
function ENT:DrawTranslucent()
	self.BaseClass.DrawTranslucent( self )
	if ( !self:GetOn() ) then return end
	local LightNrm = self.Entity:GetAngles():Up()
	local ViewNormal = self.Entity:GetPos() - EyePos()
	local Distance = ViewNormal:Length()
	ViewNormal:Normalize()
	local ViewDot = ViewNormal:Dot( LightNrm )
	local LightPos = self.Entity:GetPos() + LightNrm * -6
	/*
	render.SetMaterial( matBeam )
	local BeamDot = BeamDot = 0.25
	render.StartBeam( 3 )
		render.AddBeam( LightPos + LightNrm * 1, 128, 0.0, Color( 255, 255, 255, 255 * BeamDot) )
		render.AddBeam( LightPos - LightNrm * 100, 128, 0.5, Color( 255, 255, 255, 64 * BeamDot) )
		render.AddBeam( LightPos - LightNrm * 200, 128, 1, Color( 255, 255, 255, 0) )
	render.EndBeam()
	*/
	if ( ViewDot >= 0 ) then
		render.SetMaterial( matLight )
		local Visibile	= util.PixelVisible( LightPos, 16, self.PixVis )	
		if (!Visibile) then return end
		local Size = math.Clamp( Distance * Visibile * ViewDot * 2, 64, 512 )
		Distance = math.Clamp( Distance, 32, 800 )
		local Alpha = math.Clamp( (1000 - Distance) * Visibile * ViewDot, 0, 100 )
		local Col = Color( 255, 255, 255, Alpha )
		render.DrawSprite( LightPos, Size, Size, Col, Visibile * ViewDot )
		render.DrawSprite( LightPos, Size*0.4, Size*0.4, Color(255, 255, 255, Alpha), Visibile * ViewDot )
	end
end

