local module = {}

function module.Weld(p, x, y, name)
	local weld = Instance.new("Weld") 
	weld.Part0 = x
	weld.Part1 = y
	local CJ = CFrame.new(x.Position) 
	weld.C0 = x.CFrame:inverse() * CJ  
	weld.C1 = y.CFrame:inverse() * CJ  
	weld.Parent = p
	weld.Name = name
end

return module
