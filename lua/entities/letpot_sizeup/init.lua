AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Use(activator, caller, useType, value)
    activator:SetModelScale(0.5, 0.5)
    --
    self:Remove()
    --
    timer.Simple(self.PotionDuration, function()
        activator:SetModelScale(1, 0.5)
    end)
end

hook.Add("DoPlayerDeath", "ResetRunSpeed", function(ply, attacker, dmginfo)
    ply:SetModelScale(1, 0.0001)
end)