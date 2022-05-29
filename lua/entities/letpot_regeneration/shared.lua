ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Spawnable = true
ENT.Category = "Letters' Drinks"
ENT.PrintName = "Regeneration Drink"

function ENT:Initialize()
    self.PotionDuration = 25
    self:SetModel("models/mechanics/various/211.mdl")
    self:SetColor(Color(255, 101, 219))
    self:SetMaterial("models/shiny")

    self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )

    if ( SERVER ) then self:PhysicsInit( SOLID_VPHYSICS ) end

    self:PhysWake()
    self:SetModelScale(2, 0.0005)
    self:Activate()
end
