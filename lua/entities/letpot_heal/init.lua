AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Use(activator, caller, useType, value)
    if (activator:Health() >= activator:GetMaxHealth()) then
        return false
    end
    activator:SetHealth(activator:GetMaxHealth())
    self:Remove()
    -- no effect to remove
end