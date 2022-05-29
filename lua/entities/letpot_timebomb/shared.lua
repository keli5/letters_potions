ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Spawnable = true
ENT.Category = "Letters' Drinks"
ENT.PrintName = "Time Bomb Drink"

function ENT:Initialize()
    self.PotionDuration = 25
    self.PotionPotency = 1
    self:SetModel("models/mechanics/various/211.mdl")
    self:SetColor(Color(205, 120, 0))
    self:SetMaterial("models/shiny")

    self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )

    if ( SERVER ) then self:PhysicsInit( SOLID_VPHYSICS ) end

    self:PhysWake()
    
    self:Activate()
end
