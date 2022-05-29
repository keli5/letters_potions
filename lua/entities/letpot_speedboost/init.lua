AddCSLuaFile("shared.lua")
include("shared.lua")

BaseRunSpeed = {}

function ENT:Use(activator, caller, useType, value)
    if BaseRunSpeed[activator] then
        return false
    end
    BaseRunSpeed[activator] = activator:GetRunSpeed()
    activator:SetRunSpeed(activator:GetRunSpeed() * 2)
    --
    self:Remove()
    --
    timer.Simple(self.PotionDuration, function()
        if BaseRunSpeed[activator] then
            activator:SetRunSpeed(BaseRunSpeed[activator])
            BaseRunSpeed[activator] = nil
        end
    end)
end

hook.Add("DoPlayerDeath", "ResetRunSpeed", function(ply, attacker, dmginfo)
    if BaseRunSpeed[ply] then
        ply:SetRunSpeed(BaseRunSpeed[ply])
        BaseRunSpeed[ply] = nil
    end
end)