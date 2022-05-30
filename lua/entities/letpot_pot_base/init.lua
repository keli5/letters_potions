AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Use(activator, caller, useType, value)
    -- apply the effect
    --
    self:Remove()
    --
    timer.Simple(self:GetPotionDuration(), function()
        -- remove the potion effect
    end)
end