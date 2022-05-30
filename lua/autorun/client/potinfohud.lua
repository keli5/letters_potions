include("autorun/letpot_shared.lua")

hook.Add("HUDPaint", "PotInfoHud", function ()
    local trace = LocalPlayer():GetEyeTrace()
    if not trace.Hit then return end
    if not trace.Entity then return end
    if trace.Fraction > 0.006 then return end
    local ent = trace.Entity

    if not ent:GetClass():startswith("letpot_pot_") then return end

    local pot = ent.PrintName
    local durationText = ""
    local potencyText = ""

    ------
    if ent:GetPotionDuration() == -1 then
        durationText = "Duration: One-time"
    else
        durationText = "Duration: " .. ent:GetPotionDuration() .. "s"
    end
    if ent:GetPotionPotency() == -1 then
        potencyText = "Potency: N/A"
    else
        potencyText = "Potency: " .. ent:GetPotionPotency() .. "x"  
    end
    ------
    surface.SetFont("DermaLarge")
    tW1, _ = surface.GetTextSize(pot)
    tW2, _= surface.GetTextSize(durationText)
    tW3, _ = surface.GetTextSize(potencyText)
    tW = math.max(tW1, tW2, tW3)

    cam.Start3D()
    cam.IgnoreZ(true)
    local potpos = ent:WorldSpaceCenter():ToScreen()
    cam.End3D()
    local curpos = {x=ScrW()/2, y=ScrH()/2}

    draw.RoundedBox(6, potpos.x - tW/1.5, potpos.y - 150, tW*1.35, 130, Color(0, 0, 0, 200))
    draw.DrawText(potencyText, "DermaLarge", potpos.x, potpos.y - 66, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
    draw.DrawText(durationText, "DermaLarge", potpos.x, potpos.y - 102, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
    draw.DrawText(pot, "DermaLarge", potpos.x, potpos.y - 138, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
end)