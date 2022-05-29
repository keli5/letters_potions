include("autorun/letpot_shared.lua")

hook.Add("HUDPaint", "PotInfoHud", function ()
    local trace = LocalPlayer():GetEyeTrace()
    if not trace.Hit then return end
    if not trace.Entity then return end
    local ent = trace.Entity

    if not ent:GetClass():startswith("letpot_") then return end

    local pot = ent.PrintName
    print(pot)
    if pot then
        draw.DrawText(pot, "DermaLarge", ScrW() / 2, ScrH() / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
    end
end)