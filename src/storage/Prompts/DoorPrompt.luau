--!strict

local Item = {}

function Item.Activated(data : {})
    print("Prompt1.luau activated")
    data.prompt.Enabled = false
    
    print(data.name)
end

return Item