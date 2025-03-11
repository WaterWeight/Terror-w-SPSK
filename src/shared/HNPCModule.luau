--!strict
--Hostile NPC Module
-- Services
local PathfindingService = game:GetService("PathfindingService")

local Module = {}

-- Functions
local function canSeeTarget(target, Character)
	local origin = Character.HumanoidRootPart.Position
	local direction = (target.HumanoidRootPart.Position - Character.HumanoidRootPart.Position).unit * 40
	local ray = Ray.new(origin, direction)
	
	local hit, pos = workspace:FindPartOnRay(ray, Character)
	
	
	if hit then
		if hit:IsDescendantOf(target) then
			return true
		end
	else
		return false
	end
end

local function findTarget(Character)
	local players = game.Players:GetPlayers()
	local maxDistance = 40
	local nearestTarget

	for index, player in pairs(players) do
		if player.Character then
			local target = player.Character
			local distance = (Character.HumanoidRootPart.Position - target.HumanoidRootPart.Position).Magnitude

			if distance < maxDistance and canSeeTarget(target) then
				nearestTarget = target
				maxDistance = distance
			end
		end
	end

	return nearestTarget
end

local function getPath(destination, Character)
	
	local pathParams = {
		["AgentHeight"] = 15,
		["AgentRadius"] = 4,
		["AgentCanJump"] = false
	}
	
	local path = PathfindingService:CreatePath(pathParams)
	
	path:ComputeAsync(Character.HumanoidRootPart.Position, destination.Position)
	
	return path
end

local function attack(target, Character, Humanoid)
	local distance = (Character.HumanoidRootPart.Position - target.HumanoidRootPart.Position).Magnitude

	if distance > 8 then
		Humanoid:MoveTo(target.HumanoidRootPart.Position)
	else
		target.Humanoid.Health = 0
	end
end

local function walkTo(destination, Character, Humanoid)

	local path = getPath(destination, Character)

	if path.Status == Enum.PathStatus.Success then
		for index, waypoint in pairs(path:GetWaypoints()) do
			local target = findTarget(Character)
			if target and target.Humanoid.Health > 0 then
				print("TARGET FOUND", target.Name)
				attack(target, Character, Humanoid)
				break
			else
				print("Moving to ", waypoint.Position)
				Humanoid:MoveTo(waypoint.Position)
				Humanoid.MoveToFinished:Wait()
			end
		end
	else
		Humanoid:MoveTo(destination.Position - (Character.HumanoidRootPart.CFrame.LookVector * 10))
	end
end

function Module.patrol(pointer, Character, Humanoid)
	local waypoints = pointer.Value:GetChildren()
	local randomNum = math.random(1,#waypoints)
	walkTo(waypoints[randomNum], Character, Humanoid)
end

return Module