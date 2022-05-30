ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Spawnable = true
ENT.Category = "Letters' Drinks: Crafting"
ENT.PrintName = "Mixing Barrel"

function ENT:Initialize()
    self:SetResultPotencyMult(1)
    self:SetResultDurationMult(1)
    
    self:SetModel("models/props_wasteland/laundry_washer003.mdl")

    self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )

    if ( SERVER ) then self:PhysicsInit( SOLID_VPHYSICS ) end

    self:PhysWake()
    self:Activate()
end

function ENT:SetupDataTables()
    self:NetworkVar("Int", 1, "ResultPotencyMult")
    self:NetworkVar("Int", 2, "ResultDurationMult")
end