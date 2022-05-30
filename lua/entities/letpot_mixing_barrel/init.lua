AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Use(activator, caller, useType, value)
    local createdPot = ents.Create("letpot_pot_timebomb")
    createdPot:SetPotionPotency(3)
    createdPot:SetPos(self:GetPos() + Vector(0, 0, 10))
    createdPot:SetAngles(self:GetAngles())
    createdPot:Spawn()
    createdPot:Activate()

end