ENT.Editable = true
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Spawnable = true
ENT.Category = "Letters' Drinks"
ENT.PrintName = "Speed Drink"

function ENT:Initialize()
    self:SetPotionPotency(1.5)
    self:SetPotionDuration(30)
    self:SetModel("models/mechanics/various/211.mdl")
    self:SetColor(Color(64, 64, 255))
    self:SetMaterial("models/shiny")

    self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )

    if ( SERVER ) then self:PhysicsInit( SOLID_VPHYSICS ) end

    self:PhysWake()
    self:Activate()
end

function ENT:SetupDataTables()
    self:NetworkVar("Int", 1, "PotionPotency", {
        KeyName = "potency",
        Edit = {
            title = "Effect strength multiplier",
            type = "Float",
            order = 1,
            min = 1,
            max = 10
        }
    })
    self:NetworkVar("Int", 2, "PotionDuration", {
        KeyName = "duration",
        Edit = {
            title = "Potion duration (sec)",
            type = "Float",
            order = 1,
            min = 1,
            max = 600
        }
    })
end