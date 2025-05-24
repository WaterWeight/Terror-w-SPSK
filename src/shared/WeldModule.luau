local module = {}

function module.Weld(parentedTo, Part0, Part1, Name)
	local weld = Instance.new("Weld") 
	weld.Part0 = Part0
	weld.Part1 = Part1
	local CJ = CFrame.new(Part0.Position) 
	weld.C0 = Part0.CFrame:inverse() * CJ  
	weld.C1 = Part1.CFrame:inverse() * CJ  
	weld.Parent = parentedTo
	weld.Name = Name
end

return module
