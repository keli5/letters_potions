ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Spawnable = true
ENT.Category = "Letters' Drinks"
ENT.PrintName = "Shrinking Drink"

function ENT:Initialize()
    self.PotionDuration = 30
    self:SetModel("models/mechanics/various/211.mdl")
    self:SetColor(Color(105, 175, 0))
    self:SetMaterial("models/shiny")

    self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )

    if ( SERVER ) then self:PhysicsInit( SOLID_VPHYSICS ) end

    self:PhysWake()
    self:SetModelScale(2, 0.0005)
    self:Activate()
end