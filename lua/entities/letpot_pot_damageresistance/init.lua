AddCSLuaFile("shared.lua")
include("shared.lua")

ScaleBy = {}

function ENT:Use(activator, caller, useType, value)
    if ScaleBy[activator] then return false end
    if not activator:IsPlayer() then return false end
    ScaleBy[activator] = self:GetPotionPotency()
    --
    self:Remove()
    --
    timer.Simple(self:GetPotionDuration(), function()
        if ScaleBy[activator] then ScaleBy[activator] = nil end
    end)
end

hook.Add("DoPlayerDeath", "ResetRunSpeed", function(ply, attacker, dmginfo)
    if ScaleBy[ply] then ScaleBy[ply] = nil end
end)

hook.Add("EntityTakeDamage", "DamageResistanceHook", function(ent, dmginfo)
    if ScaleBy[ent] then
        dmginfo:SetDamage(dmginfo:GetDamage() / ScaleBy[ent])
    end
end)