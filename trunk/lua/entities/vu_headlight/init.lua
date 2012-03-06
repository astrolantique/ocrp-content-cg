
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')
function ENT:Initialize()
self:SetOn( false )
end
function ENT:Toggle()
	if ( self.flashlight ) then
		SafeRemoveEntity( self.flashlight )
		self.flashlight = nil
		self:SetOn( false )
		return
	end
	self:SetOn( true )
	local angForward = self.Entity:GetAngles() + Angle( 90, 0, 0 )
	self.flashlight = ents.Create( "env_projectedtexture" )
		self.flashlight:SetParent( self.Entity )	
		self.flashlight:SetLocalPos( Vector( 0, 0, 0 ) )
		self.flashlight:SetLocalAngles( Angle(90,90,90) )
		self.flashlight:SetKeyValue( "enableshadows", 1 )
		self.flashlight:SetKeyValue( "farz", 2048 )
		self.flashlight:SetKeyValue( "nearz", 8 )
		self.flashlight:SetKeyValue( "lightfov", 50 )
		self.flashlight:SetKeyValue( "lightcolor", "255 255 255" )
		self.flashlight:Spawn()
end


