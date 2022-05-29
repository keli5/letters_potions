AddCSLuaFile("shared.lua")
include("shared.lua")

BaseRunSpeed = {}

function ENT:Use(activator, caller, useType, value)
    if BaseRunSpeed[activator:SteamID()] then
        return false
    end
    BaseRunSpeed[activator:SteamID()] = activator:GetRunSpeed()
    activator:SetRunSpeed(activator:GetRunSpeed() * 2)
    --
    self:Remove()
    --
    timer.Simple(self.PotionDuration, function()
        if BaseRunSpeed[activator:SteamID()] then
            activator:SetRunSpeed(BaseRunSpeed[activator:SteamID()])
            BaseRunSpeed[activator:SteamID()] = nil
        end
    end)
end

hook.Add("DoPlayerDeath", "ResetRunSpeed", function(ply, attacker, dmginfo)
    if BaseRunSpeed[ply:SteamID()] then
        ply:SetRunSpeed(BaseRunSpeed[ply:SteamID()])
        BaseRunSpeed[ply:SteamID()] = nil
    end
end)