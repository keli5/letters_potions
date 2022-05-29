AddCSLuaFile("shared.lua")
include("shared.lua")

BaseMaxHealth = {}

function ENT:Use(activator, caller, useType, value)
    if BaseMaxHealth[activator:SteamID()] then
        return false
    end
    BaseMaxHealth[activator:SteamID()] = activator:GetMaxHealth()
    activator:SetMaxHealth(activator:GetMaxHealth() * 2)
    --
    self:Remove()
    --
    timer.Simple(self.PotionDuration, function()
        if BaseMaxHealth[activator:SteamID()] then
            activator:SetMaxHealth(BaseMaxHealth[activator:SteamID()])
            BaseMaxHealth[activator:SteamID()] = nil
        end
    end)
end

hook.Add("DoPlayerDeath", "ResetMaxHealth", function(ply, attacker, dmginfo)
    if BaseMaxHealth[ply:SteamID()] then
        ply:SetMaxHealth(BaseMaxHealth[ply:SteamID()])
        BaseMaxHealth[ply:SteamID()] = nil
    end
end)