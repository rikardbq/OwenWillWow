local f = CreateFrame("Frame")

f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

f:SetScript(
  "OnEvent", function(self, event, ...)
    if (event == "COMBAT_LOG_EVENT_UNFILTERED") then
      local type,
            hideCaster,
            sourceGUID = select(2, ...)

      local playerGUID = UnitGUID("player");

      if sourceGUID == playerGUID and (type:match("SPELL_") ~= nil or type:match("SWING") ~= nil or type:match("RANGE") ~= nil) then
        local critical
        if type:match("_HEAL") ~= nil or type:match("SWING_DAMAGE") then
          critical = select(18, ...)
        elseif type:match("_DAMAGE") ~= nil then
          critical = select(21, ...)
        end
        
        if (critical) then
          PlaySoundFile(string.format("Interface\\AddOns\\OwenWillWow\\assets\\sound\\wow_%s.mp3", math.random(0, 20)), "Master");
        end
      end
    end
  end
)
