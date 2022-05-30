AddCSLuaFile("shared.lua")
include("shared.lua")

OriginalColor = {}
Timing = {}

function ENT:Use(activator, caller, useType, value)
    if Timing[activator] then return false end
    Timing[activator] = 1
    local potency = self.PotionPotency -- why do i have to do this? idk, maybe scope
    --
    self:Remove()
    --
    OriginalColor[activator] = activator:GetColor()
    activator:SetColor(Color(200, 0, 0, 255))
    timer.Create("TimeBomb_" .. activator:SteamID(), 1.15, 7, function()
        activator:EmitSound("garrysmod/ui_click.wav", 100, 110, 1)
        Timing[activator] = Timing[activator] + 1

        if Timing[activator] == 8 then -- EWWW
            local explode = ents.Create( "env_explosion" )
            explode:SetPos(activator:GetPos())
            explode:SetOwner(activator)
            explode:Spawn()
            explode:SetKeyValue("iMagnitude", 250 * activator:GetModelScale() * potency)
            explode:Fire("Explode", 0, 0)
            activator:Kill() -- just to be sure, since the explosion doesn't always kill the player
        end

    end)

end

hook.Add("PlayerDeath", "ResetRunSpeed", function(ply, item, killer)
    timer.Remove("TimeBomb_" .. ply:SteamID())
    ply:SetColor(OriginalColor[ply])
    Timing[ply] = nil
end)