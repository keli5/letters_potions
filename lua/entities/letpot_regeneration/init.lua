AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Use(activator, caller, useType, value)
    --
    self:Remove()
    --
    timer.Create("Regen_" .. activator:SteamID(), 0.5 * self.PotionPotency, 60 * self.PotionPotency, function()
        if activator:Health() >= activator:GetMaxHealth() then return end
        activator:SetHealth(activator:Health() + 1)
    end)
end

hook.Add("DoPlayerDeath", "ResetRunSpeed", function(ply, attacker, dmginfo)
    timer.Remove("Regen_" .. ply:SteamID())
end)