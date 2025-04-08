--!strict

local Item = {}

function Item.Activated(data : {})
    print("HidePrompt.luau activated")
    
    print(data.name)
end

return Item