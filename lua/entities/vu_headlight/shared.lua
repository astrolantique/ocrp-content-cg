ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Spawnable			= false
ENT.AdminSpawnable		= false
function ENT:SetOn( set )
	self:SetNetworkedBool( "Enabled", set )
end
function ENT:GetOn()
	return self:GetNetworkedVar( "Enabled", true )
end

