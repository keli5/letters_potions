include("autorun/letpot_shared.lua")

hook.Add("HUDPaint", "PotInfoHud", function ()
    local trace = LocalPlayer():GetEyeTrace()
    if not trace.Hit then return end
    if not trace.Entity then return end
    if trace.Fraction > 0.006 then return end
    local ent = trace.Entity

    if not ent:GetClass():startswith("letpot_") then return end

    local pot = ent.PrintName
    local durationText = ""
    local potencyText = ""
    --
    if not ent.PotionDuration then
        durationText = "Duration: One-time"
    else
        durationText = "Duration: " .. ent.PotionDuration .. "s"
    end
    if not ent.PotionPotency then
        potencyText = "Potency: N/A"
    else
        potencyText = "Potency: " .. ent.PotionPotency .. "x"  
    end
    --
    draw.DrawText(pot, "DermaLarge", ScrW() / 2, (ScrH() / 2) + 36, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
    draw.DrawText(durationText, "DermaLarge", ScrW(z) / 2, (ScrH() / 2) + 72, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
    draw.DrawText(potencyText, "DermaLarge", ScrW(z) / 2, (ScrH() / 2) + 108, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
end)