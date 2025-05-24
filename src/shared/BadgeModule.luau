local BadgeService = game:GetService("BadgeService")

local module = {}

function  module.awardBadge(player, badgeId)
  local success, badgeInfo = pcall(BadgeService.GetBadgeInfoAsync, BadgeService, badgeId)
  if success then
    if badgeInfo.IsEnabled then
      local awarded, errorMessage = pcall(BadgeService.AwardBadge, BadgeService, player.UserId, badgeId)
      if not awarded then
        warn("Error while awarding badge:", errorMessage)
      end
    end
  else
 	  warn("Error while fetching badge info!")
  end
end
  

return module
