--!strict
local DM = {}
-- Service
local Players = game:GetService("Players")
-- Local
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild('Humanoid')
local humanoidRootPart = character:WaitForChild('HumanoidRootPart')
local torso = character:WaitForChild('Torso')

-- Original C0 Reference

local rootJointOriginalC0 = humanoidRootPart.RootJoint.C0
local neckOriginalC0 = torso.Neck.C0
local rightHipOriginalC0 = torso['Right Hip'].C0
local leftHipOriginalC0 = torso['Left Hip'].C0

local playersTable = {}

-- Settings

local rangeOfMotion = 45
local rangeOfMotionTorso = 90 - rangeOfMotion
local rangeOfMotionXZ = rangeOfMotion/140
local lerpSpeed = 0.005

--Main Code

rangeOfMotion = math.rad(rangeOfMotion)
rangeOfMotionTorso = math.rad(rangeOfMotionTorso)

local function Calculate( dt, HumanoidRootPart, Humanoid, Torso )

	local DirectionOfMovement = HumanoidRootPart.CFrame:VectorToObjectSpace( HumanoidRootPart.AssemblyLinearVelocity )
	DirectionOfMovement = Vector3.new( DirectionOfMovement.X / Humanoid.WalkSpeed, 0, DirectionOfMovement.Z / Humanoid.WalkSpeed )

	local XResult = ( DirectionOfMovement.X * (rangeOfMotion - (math.abs( DirectionOfMovement.Z ) * (rangeOfMotion / 2) ) ) )
	local XResultTorso = ( DirectionOfMovement.X * (rangeOfMotionTorso - (math.abs( DirectionOfMovement.Z ) * (rangeOfMotionTorso / 2) ) ) )
	local XResultXZ = ( DirectionOfMovement.X * (rangeOfMotionXZ - (math.abs( DirectionOfMovement.Z ) * (rangeOfMotionXZ / 2) ) ) )

	if DirectionOfMovement.Z > 0.1 then

		XResult *= -1
		XResultTorso *= -1
		XResultXZ *= -1

	end

	local RightHipResult = rightHipOriginalC0 * CFrame.new(-XResultXZ, 0, -math.abs(XResultXZ) + math.abs( -XResultXZ ) ) * CFrame.Angles( 0, -XResult, 0 )
	local LeftHipResult = leftHipOriginalC0 * CFrame.new(-XResultXZ, 0, -math.abs(-XResultXZ) + math.abs( -XResultXZ ) ) * CFrame.Angles( 0, -XResult, 0 )
	local RootJointResult = rootJointOriginalC0 * CFrame.Angles( 0, 0, -XResultTorso )
	local NeckResult = neckOriginalC0 * CFrame.Angles( 0, 0, XResultTorso )

	local LerpTime = 1 - lerpSpeed ^ dt

	Torso['Right Hip'].C0 = Torso['Right Hip'].C0:Lerp(RightHipResult, LerpTime)
	Torso['Left Hip'].C0 = Torso['Left Hip'].C0:Lerp(LeftHipResult, LerpTime)
	HumanoidRootPart.RootJoint.C0 = HumanoidRootPart.RootJoint.C0:Lerp(RootJointResult, LerpTime)
	Torso.Neck.C0 = Torso.Neck.C0:Lerp(NeckResult, LerpTime)

end

function DM.stepped(dt)
    for _, Player in game.Players:GetPlayers() do

		if Player.Character == nil then continue end
		if table.find(playersTable, Player ) then continue end
		table.insert(playersTable, Player)

	end

	for i, Player in pairs(playersTable) do

		if Player == nil then

			table.remove(playersTable, i )
			continue

		end


		if game.Players:FindFirstChild(Player.Name) == nil then

			table.remove(playersTable, i )
			continue

		end


		if Player.Character == nil then

			table.remove(playersTable, i )
			continue

		end

		local humanoidRootPart = Player.Character:FindFirstChild('HumanoidRootPart')
		local humanoid = Player.Character:FindFirstChild('Humanoid')
		local torso = Player.Character:FindFirstChild('Torso')

		if humanoidRootPart == nil or humanoid == nil or torso == nil then
			continue
		end

		if not character:FindFirstChild("Right Hip") then
			return
		end

		Calculate(dt, humanoidRootPart, humanoid, torso)

	end
end

return DM