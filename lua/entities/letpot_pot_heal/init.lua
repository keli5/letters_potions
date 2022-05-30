AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Use(activator, caller, useType, value)
    if (activator:Health() >= activator:GetMaxHealth()) then
        return false
    end
    activator:SetHealth(activator:Health() + (10 * self:GetPotionPotency()))
    if (activator:Health() > activator:GetMaxHealth()) then
        activator:SetHealth(activator:GetMaxHealth())
    end
    self:Remove()
    -- no effect to remove
end