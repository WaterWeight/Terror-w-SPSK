local module = {}

-- Service
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local WeldModule = require(game.ReplicatedStorage.Shared.WeldModule)
local MovementControls = require(Players.LocalPlayer.PlayerScripts.PlayerModule):GetControls()
local Camera = game.Workspace:WaitForChild("Camera")

-- Functions
function module.CSCameraOff(player)
    MovementControls:Enable()
    player.CameraMode = Enum.CameraMode.LockFirstPerson
    Camera.CameraType = Enum.CameraType.Custom
    Camera.HeadLocked = true
    player.Character.Character.VIewBobbing.Enabled = true
end
function module.CSCameraOn(player)
    MovementControls:Disable()
    player.CameraMode = Enum.CameraMode.Classic
    Camera.CameraType = Enum.CameraType.Scriptable
    Camera.HeadLocked = false
    player.Character.Character.VIewBobbing.Enabled = false
end
function  module.WeldToSomething(player, object)
    WeldModule.Weld(player.Character.Torso, player.Character.Torso, object.Torso, "DialogueWeld")
end

function module.CSTween(Part, Time, EasingStyle, EasingDirection)
                                 --time , easingStyle , easingDirection, repeatCount, reverses, delayTime)
    local TweenInformation = TweenInfo.new(Time, EasingStyle, EasingDirection, 0, false, 0)
    local Tween = TweenService:Create(Camera, TweenInformation, {CFrame = Part.CFrame})
    Tween:Play()
    Tween.Completed:Wait()
end

function module.CSSet(Part, Time)
    if Part then
        Camera.CFrame = Part.CFrame
        wait(Time)
    end
end

function module.CSSetToObject(Part, Time)
    Camera.CameraSubject = Part
    wait(Time)
end

return module
