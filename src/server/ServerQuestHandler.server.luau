--!strict
-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local QuestEvent = ReplicatedStorage.NewQuest

QuestEvent.onServerEvent:Connect(function(plr, parameters)
    print("KURWA")
    print(parameters)
    if plr.PlayerGui:FindFirstChild("QuestUI") then
        plr.PlayerGui.QuestUI.MainFrame.TaskName.Text = parameters[1]
        plr.PlayerGui.QuestUI.MainFrame.TaskDescription.Text = parameters[2]
        if plr.PlayerGui.QuestUI.Activation.Value == true then
            plr.PlayerGui.QuestUI.Activation.Value = false
        else
            plr.PlayerGui.QuestUI.Activation.Value = true
        end 
    end
end)

-- Functions

