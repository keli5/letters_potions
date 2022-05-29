ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Spawnable = true
ENT.Category = "Letters' Drinks"
ENT.PrintName = "Speed Drink"

function ENT:Initialize()
    self.PotionDuration = 30
    self:SetModel("models/mechanics/various/211.mdl")
    self:SetColor(Color(64, 64, 255))
    self:SetMaterial("models/shiny")

    self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )

    if ( SERVER ) then self:PhysicsInit( SOLID_VPHYSICS ) end

    self:PhysWake()
    
    self:Activate()
end
