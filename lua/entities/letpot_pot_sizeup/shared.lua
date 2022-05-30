ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Spawnable = true
ENT.Category = "Letters' Drinks"
ENT.PrintName = "Growing Drink"

function ENT:Initialize()
    self.PotionDuration = 30
    self:SetModel("models/mechanics/various/211.mdl")
    self:SetColor(Color(198, 255, 114))
    self:SetMaterial("models/shiny")

    self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )

    if ( SERVER ) then self:PhysicsInit( SOLID_VPHYSICS ) end

    self:PhysWake()
    self:Activate()
end