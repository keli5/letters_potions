AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Use(activator, caller, useType, value)
    -- apply the effect
    --
    self:Remove()
    --
    timer.Simple(self.PotionDuration, function()
        -- remove the potion effect
    end)
end