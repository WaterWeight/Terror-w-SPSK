--!strict
-- Service
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Event = ReplicatedStorage:WaitForChild("FOVFix")

local Camera = Workspace:WaitForChild("Camera")

Event.OnClientEvent:Connect(function(FOV)
    Camera.FieldOfView = FOV
    script:Destroy()
end)