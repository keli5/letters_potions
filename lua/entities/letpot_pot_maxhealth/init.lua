AddCSLuaFile("shared.lua")
include("shared.lua")

BaseMaxHealth = {}

function ENT:Use(activator, caller, useType, value)
    if BaseMaxHealth[activator] then
        return false
    end
    BaseMaxHealth[activator] = activator:GetMaxHealth()
    activator:SetMaxHealth(activator:GetMaxHealth() * self.PotionPotency)
    --
    self:Remove()
    --
    timer.Simple(self.PotionDuration, function()
        if BaseMaxHealth[activator] then
            activator:SetMaxHealth(BaseMaxHealth[activator])
            BaseMaxHealth[activator] = nil
        end
    end)
end

hook.Add("DoPlayerDeath", "ResetMaxHealth", function(ply, attacker, dmginfo)
    if BaseMaxHealth[ply] then
        ply:SetMaxHealth(BaseMaxHealth[ply])
        BaseMaxHealth[ply] = nil
    end
end)