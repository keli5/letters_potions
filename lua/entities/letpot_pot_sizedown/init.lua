AddCSLuaFile("shared.lua")
include("shared.lua")

OGVZ = {}

function ENT:Use(activator, caller, useType, value)
    if OGVZ[activator] then return false end
    activator:SetModelScale(0.5, 0.5)
    --
    local viewOffset = activator:GetViewOffset()
    OGVZ[activator] = viewOffset.z
    viewOffset.z = viewOffset.z * 0.5
    activator:SetViewOffset(viewOffset)
    --
    self:Remove()
    --
    timer.Simple(self:GetPotionDuration(), function()
        if not OGVZ[activator] then return false end -- other stuff can modify this
        activator:SetModelScale(1, 0.5)
        viewOffset = activator:GetViewOffset()
        viewOffset.z = OGVZ[activator]
        activator:SetViewOffset(viewOffset)
        OGVZ[activator] = nil
    end)
end

hook.Add("DoPlayerDeath", "ResetSize", function(ply, attacker, dmginfo)
    if OGVZ[ply] then
        ply:SetModelScale(1, 0.0001)
        viewOffset = ply:GetViewOffset()
        viewOffset.z = OGVZ[ply]
        ply:SetViewOffset(viewOffset)
        OGVZ[ply] = nil
    end
end)
