local module = {}

-- Service
local TweenService = game:GetService("TweenService")


local WeldModule = require(game.ReplicatedStorage.Shared.WeldModule)
local PlayerWalkSpeed = game.StarterPlayer.CharacterWalkSpeed
local Camera = game.Workspace:WaitForChild("Camera")

-- Functions
function module.CSCameraOff(player)
    local Humanoid = player.Character.Humanoid
    Humanoid.WalkSpeed = PlayerWalkSpeed
    Camera.CameraType = Enum.CameraType.Custom
    player.Character.Character.VIewBobbing.Enabled = true
end
function module.CSCameraOn(player)
    local Humanoid = player.Character.Humanoid
    Humanoid.WalkSpeed = 0
    Camera.CameraType = Enum.CameraType.Scriptable
    player.Character.Character.VIewBobbing.Enabled = false
end

function module.CSTween(Part, Time, EasingStyle, EasingDirection)
                                 --time , easingStyle , easingDirection, repeatCount, reverses, delayTime)
    local TweenInformation = TweenInfo.new(Time, EasingStyle, EasingDirection, 0, false, 0)
    local Tween = TweenService:Create(Camera, TweenInformation, {CFrame = Part.CFrame})
    Tween:Play()
    Tween.Completed:Wait()
    print("Finished")
end

function module.CSSet(Part, Time)
    Camera.CFrame = Part.CFrame
    wait(Time)
end

function module.CSSetToObject(Part, Time)
    Camera.CameraSubject = Part
    wait(Time)
end

return module
