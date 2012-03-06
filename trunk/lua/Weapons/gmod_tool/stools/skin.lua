
TOOL.Category		= "Render"
TOOL.Name			= "#Skin"
TOOL.Command		= nil
TOOL.ConfigName		= ""

TOOL.ClientConVar[ "propskin" ] = 0

if (CLIENT) then

	language.Add( "skin", "Skin" )
	language.Add( "Tool_skin_name", "Skin" )
	language.Add( "Tool_skin_desc", "Sets a props skin" )
	language.Add( "Tool_skin_0", "Left click to set the prop's skin." )
	
end

function TOOL:LeftClick( trace )

	if trace.Entity && 		// Hit an entity
	   trace.Entity:IsValid() && 	// And the entity is valid
	   trace.Entity:EntIndex() != 0 // And isn't worldspawn
	then

		if (CLIENT) then
			return true 
		end
	
		local propskin		= self:GetClientNumber( "propskin" )

		trace.Entity:SetSkin(propskin)

		return true
		
	end
	
end

function TOOL.BuildCPanel( CPanel )

	// HEADER
	CPanel:AddControl( "Header", {Text = "#Tool_skin_name", Description	= "#Tool_skin_desc" } )
	
	CPanel:AddControl("Slider",  {Label	= "#Skin Number",
					Type	= "Integer",
					Min		= 0,
					Max		= 16,
					Command = "skin_propskin"}
					)
end

