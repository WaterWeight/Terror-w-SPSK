--!strict
--Friendly NPC Module
-- Services
local PathfindingService = game:GetService("PathfindingService")

local Module = {}

-- Functions
function Module.getPath(destination, Character)
	local pathParams = {
		["AgentHeight"] = 2,
		["AgentRadius"] = 1,
		["AgentCanJump"] = true
	}
	local path = PathfindingService:CreatePath()
	print("Creating path to designated target.")

	path:ComputeAsync(Character.HumanoidRootPart.Position, destination.Position)
	print("Returning path to designated target.")
	return path
end

function Module.walkTo(destination, Humanoid, Character)
	local path = Module.getPath(destination, Character)

	print("On my way to designated target: "..destination.Name)
	for index, waypoint in path:GetWaypoints() do
		Humanoid:MoveTo(waypoint.Position)
		Humanoid.MoveToFinished:Wait()
	end
	print("Designated target: "..destination.Name.." has been reached")
end

function Module.patrol(Pointer, Character, Humanoid)
	local waypoints = Pointer.Value:GetChildren()
	local randomNum = math.random(1,#waypoints)
	Module.walkTo(waypoints[randomNum], Humanoid, Character)
	print("Target: "..waypoints[randomNum].Name)
end

return Module