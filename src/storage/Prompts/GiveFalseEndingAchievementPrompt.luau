--!strict

local Item = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local BadgeModule = require(ReplicatedStorage.Shared.BadgeModule)

function Item.Activated()
    BadgeModule.awardBadge(Players:GetPlayers()[1], 3616510361572396)
    wait(5)
    Players:GetPlayers()[1]:Kick("Udało ci się ucieć z placówki. Nie każdemu przypadł ten zaszczyt.")
end

return Item