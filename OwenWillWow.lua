local f = CreateFrame("Frame")

f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

f:SetScript(
  "OnEvent", function(self, event, ...)
    if (event == "COMBAT_LOG_EVENT_UNFILTERED") then
      local type,
            hideCaster,
            sourceGUID = select(2, ...)

      local playerGUID = UnitGUID("player");

      if (sourceGUID == playerGUID and string.match(type, "SPELL_") ~= nil) then
        local critical
        if string.match(type, "_DAMAGE") ~= nil then 
          critical = select(21, ...)
        elseif string.match(type, "_HEAL") ~= nil then
          critical = select(18, ...)
        end
        
        if (critical) then
          PlaySoundFile(string.format("Interface\\AddOns\\OwenWillWow\\assets\\sound\\wow_%s.mp3", math.random(0, 20)), "Master");
        end
      end
    end
  end
)
