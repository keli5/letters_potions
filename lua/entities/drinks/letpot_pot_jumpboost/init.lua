AddCSLuaFile("shared.lua")
include("shared.lua")

BaseJumpPower = {}

function ENT:Use(activator, caller, useType, value)
    if BaseJumpPower[activator] then
        return false
    end
    BaseJumpPower[activator] = activator:GetJumpPower()
    activator:SetJumpPower(activator:GetJumpPower() * self.PotionPotency)
    --
    self:Remove()
    --
    timer.Simple(self.PotionDuration, function()
        if BaseJumpPower[activator] then
            activator:SetJumpPower(BaseJumpPower[activator])
            BaseJumpPower[activator] = nil
        end
    end)
end

hook.Add("DoPlayerDeath", "ResetJumpPower", function(ply, attacker, dmginfo)
    if BaseJumpPower[ply] then
        ply:SetJumpPower(BaseJumpPower[ply])
        BaseJumpPower[ply] = nil
    end
end)