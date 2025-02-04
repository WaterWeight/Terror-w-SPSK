--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Player = game.Players.LocalPlayer
local character = Player.Character
local Camera = workspace.CurrentCamera
local equip = false
local currentTool = "Placeholder"
local showGear = true
local holsterEnabled = true
local BodyTP = 0 -- transparency of body when in 1st person
local GunTP = 0 -- transparency of accessories that are FirstVisible
local CamDist = 1 -- how close camera zoom has to be for transparency modifier to happen
local ArmsDebug = ReplicatedStorage.Assets.Debug.ArmsDebug -- whether to view real arms while equipping a gun
local GunDebug = ReplicatedStorage.Assets.Debug.GunDebug -- whether to view gun server model while equipping a gun

-- if child part found in model with this name, custom transparency modifier to accessory will be applied
local FirstVisibleKeywords = {
	"firstVisible",
	"FirstVisible",
	"firstvisible",
}

local R15MiscBody = { -- R15
	"RightUpperLeg",
	"RightLowerLeg",
	"LeftLowerLeg",
	"LeftUpperLeg",
	"RightFoot",
	"LeftFoot",

	"UpperTorso",
	"LowerTorso",
}

local R15Arms = { -- R15
	"RightLowerArm",
	"LeftLowerArm",
	"RightUpperArm",
	"LeftUpperArm",
	"RightHand",
	"LeftHand",
}

local R6MiscBody = { -- R6
	"Right Leg",
	"Left Leg",
	"Torso",
}

local R6Arms = { -- R6
	"Right Arm",
	"Left Arm",
}

local FaceAccessories = {
	"HeadWeld",
	"Helmet",
	"Face",
	"Capacete",
	"Top",
	"Earpro",
	"Beard",
	"Model",
	"Hair",
	"Human",
	"Scarf",
	"Facemask",
	"Glasses",
	"Arm2",
	"LeftArm",
	"RightArm",
	"Headset",
}


local function TableToDict(tbl)
	local tbl2 = table.clone(tbl)
	for i, v in pairs(tbl2) do
		tbl[v] = true
		tbl[i] = nil
	end
end

TableToDict(FirstVisibleKeywords)
TableToDict(R15MiscBody)
TableToDict(R15Arms)
TableToDict(R6MiscBody)
TableToDict(R6Arms)
TableToDict(FaceAccessories)

local function IsACSTool(tool)
	if tool:IsA("Tool") then
		local mod = tool:FindFirstChild("ACS_Modulo")
		if mod then
			local setup = mod:FindFirstChild("ACS_Setup")
			return setup and (require(setup).Type == "Gun")
		end
	end
	return false
end

local function IsTransparentAble(v)
	return v:IsA("BasePart") or v:IsA("Texture") or v:IsA("Decal")
end

character.ChildAdded:Connect(function(tool)
	if IsACSTool(tool) and character.Humanoid.Health > 0 then
		equip = true
	end
end)

character.ChildRemoved:Connect(function(tool)
	if IsACSTool(tool) and character.Humanoid.Health > 0 then
		equip = false
	end
end)

local function ApplyTransparency(model: Instance, transparency: number)
	for _, v in pairs(model:GetDescendants()) do
		if IsTransparentAble(v) then
			v.LocalTransparencyModifier = transparency
		end
	end
end

game:GetService("RunService"):BindToRenderStep("ACS_FPAccessories", Enum.RenderPriority.Character.Value + 1, function()
	local dist = (Camera.Focus.Position - Camera.CFrame.Position).Magnitude
	if dist < CamDist then
		for i, part in pairs(character:GetChildren()) do
			if part:IsA("BasePart") then
				if R15MiscBody[part.Name] or R6MiscBody[part.Name] or (not equip or ArmsDebug.Value) and R15Arms[part.Name] or (not equip or ArmsDebug.Value) and R6Arms[part.Name] then
					part.LocalTransparencyModifier = BodyTP
				else
					part.LocalTransparencyModifier = 1
				end
			elseif part:IsA("Model") then
				if FaceAccessories[part.Name] then
					ApplyTransparency(part, 1)
				else
					if equip then
						currentTool = character:FindFirstChildOfClass("Tool").Name
						if part.Name == "S" .. currentTool then
							local firstvisible = (GunDebug.Value or part:FindFirstChild("firstVisible"))
							ApplyTransparency(part, firstvisible and GunTP or 1)
							
						elseif showGear then
							ApplyTransparency(part, 0)
						end	
					else
						if showGear then
							ApplyTransparency(part, 0)
						end
						if holsterEnabled then
							if part.Name == "Holst" .. currentTool then
								ApplyTransparency(part, 0)
							end
						else
							if part.Name == "Holst" .. currentTool then
								ApplyTransparency(part, 1)
							end
						end
					end
				end
			end
		end

	else
		ApplyTransparency(character, 0)
	end
end)