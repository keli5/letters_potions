AddCSLuaFile("shared.lua")
include("shared.lua")

BaseJumpPower = {}

function ENT:Use(activator, caller, useType, value)
    if BaseJumpPower[activator:SteamID()] then
        return false
    end
    BaseJumpPower[activator:SteamID()] = activator:GetJumpPower()
    activator:SetJumpPower(activator:GetJumpPower() * 1.5)
    --
    self:Remove()
    --
    timer.Simple(self.PotionDuration, function()
        if BaseJumpPower[activator:SteamID()] then
            activator:SetJumpPower(BaseJumpPower[activator:SteamID()])
            BaseJumpPower[activator:SteamID()] = nil
        end
    end)
end

hook.Add("DoPlayerDeath", "ResetJumpPower", function(ply, attacker, dmginfo)
    if BaseJumpPower[ply:SteamID()] then
        ply:SetJumpPower(BaseJumpPower[ply:SteamID()])
        BaseJumpPower[ply:SteamID()] = nil
    end
end)