--!strict

local Players = game:GetService("Players")
local Player = Players:GetPlayers()[1]

local Chapter1 = game.Workspace.LoreStuff.Chapter1

local Item = {}

function Item.Activated(data : {})
    Chapter1.Suit4:Destroy()
    Chapter1.JacketPrompt.PickUpJacketPrompt.Enabled = false
    Chapter1.MainDoorPrompt.Value.Enabled = true
    Player.PlayerGui.QuestUI.MainFrame.TaskName.Text = "UCIEKNIJ Z PLACÓWKI"
    Player.PlayerGui.QuestUI.MainFrame.TaskDescription.Text = "Udaj się do wyjścia znajdującego się na parterze obok sekretariatu."
    Player.PlayerGui.QuestUI.Activation.Value = (not Player.PlayerGui.QuestUI.Activation.Value)
end

return Item