--!strict
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Root = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
local angleX, x, y, tilt, vX, vY, sX, sY = 0, 0, 0, 0, 0, 0, 10, 10
local TouchEnabled = UserInputService.TouchEnabled
local Mouse = LocalPlayer:GetMouse()
local randomX, randomY = nil, nil
local function lerp(v1, v2, t)
	return v1 + (v2 - v1) * t
end

local View = {}

function View.bob (dt)
    local velocity = Root.Velocity.magnitude
	if velocity > 0.02 then dt *= 60 randomX = math.random(1, 2) randomY = math.random(1, 2) --x(10,15), y(5,10)
		vX = dt <= 2 and lerp(vX, math.cos(tick() * 0.5 * randomX) * (math.random(5, 20) / 200) * dt, 0.05 * dt) or 0
		vY = dt <= 2 and lerp(vY, math.cos(tick() * 0.5 * randomY) * (math.random(2, 10) / 200) * dt, 0.05 * dt) or 0

		Camera.CFrame *= CFrame.Angles(0, 0, math.rad(angleX))
			* CFrame.Angles(math.rad(math.clamp(x * dt, -0.15, 0.15)), math.rad(math.clamp(y * dt, -0.5, 0.5)), tilt)
			* CFrame.Angles(math.rad(vX), math.rad(vY), math.rad(vY * 10))

		tilt = math.clamp(lerp(tilt, -Camera.CFrame:VectorToObjectSpace((Root and Root.Velocity or 
			Vector3.new()) / math.max(LocalPlayer.Character.Humanoid.WalkSpeed, 0.01)).X * 0.05, 0.1 * dt), -0.05, 0.05)

		if not TouchEnabled and dt < 2 then
			angleX = lerp(angleX, math.clamp(UserInputService:GetMouseDelta().X / dt * 0.15, -2.5, 2.5), 0.25 * dt)
		end 

		x = lerp(x, math.sin(tick() * sX) / 5 * math.min(1, sY / 10), 0.25 * dt)
		y = velocity > 1 and lerp(y, math.cos(tick() * 0.5 * math.floor(sX)) * (sX / 200), 0.25 * dt) or lerp(y, 0, 0.05 * dt)
		sX, sY = velocity > 12 and 20 or (velocity > 0.1 and 12 or 0), velocity > 0.1 and 18 or (velocity > 0.1 and 14 or 0)
	end
end

return View