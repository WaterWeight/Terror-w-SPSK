--!strict
-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local Event = ReplicatedStorage.CutsceneRemoteEvent

local Module = require(ReplicatedStorage.Shared.FNPCModule)

local CSFolder = Workspace.CutscenesStuff

wait(2)
local Player = Players:GetPlayers()[1]

--wait(4)
print("lets go")
local Stages = {
    ["Introduction"] = 1,
    ["Chapter1"] = 2
}
local Operations = {
    "Turn CS Camera On",    --1
    "Turn CS Camera Off",   --2
    "Tween CS Camera",      --3
    "Set CS Camera",        --4
    "Set CS Camera to Part" --5
}
--operationType, part, time, easingStyle, easingDirection


--Introduction
--if game:GetService("RunService"):IsStudio() then
Player.PlayerGui.Overlay.Enabled = false
Player.PlayerGui.BlackFrame:Destroy()
Player.Character.Torso.Anchored = true
Event:FireClient(Player, Operations[1])
Event:FireClient(Player, Operations[4], CSFolder.Introduction["1"], 2.6)
CSFolder.Introduction["1"].Bell.Value:Play()
wait(2)
CSFolder.Introduction["2"].Obj.Value.Parent.M1.HandleMotor.DesiredAngle = .6
wait(.6)
CSFolder.Introduction["2"].Obj.Value.Parent.Script.Status.Value = true
Event:FireClient(Player, Operations[4], CSFolder.Introduction["2"], 2)
CSFolder.Introduction.DisposableNPCs.GoodToGo.Object.Value.CanCollide = false
CSFolder.Introduction.DisposableNPCs.GoodToGo.Value = true
wait(1)
Event:FireClient(Player, Operations[4], CSFolder.Introduction["3"], 2)
wait(5)
Event:FireClient(Player, Operations[4], CSFolder.Introduction["4"], 2)
wait(3.5)
CSFolder.Introduction["5"].Object.Value.Value = true
Event:FireClient(Player, Operations[3], CSFolder.Introduction["5"], 7, Enum.EasingStyle.Linear  , Enum.EasingDirection.In)
wait(6.9)
Event:FireClient(Player, Operations[3], CSFolder.Introduction["6"], 3, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
wait(4)
CSFolder.Introduction["5"].Object.Value.Value = false
Event:FireClient(Player, Operations[3], Player.Character.Head, 3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
CSFolder.Introduction["1"].Bell.Value:Stop()
wait(3)
Player.Character.Torso.Anchored = false
Event:FireClient(Player, Operations[4], Player.Character.Head, 0)
Event:FireClient(Player, Operations[2])
Player.PlayerGui.Overlay.Enabled = true
CSFolder.Introduction:Destroy()
Player.PlayerGui.QuestUI.MainFrame.TaskName.Text = "ODZYSKAJ KURTKĘ"
Player.PlayerGui.QuestUI.MainFrame.TaskDescription.Text = "Udaj się do szatni w piwnicy po swoją kurtke."
Player.PlayerGui.QuestUI.Activation.Value = true
--end
