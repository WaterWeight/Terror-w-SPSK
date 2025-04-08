--!strict

local Item = {}

function Item.Activated(data : {})
    print("HidePrompt.luau activated")
    
    local prompt = data.promptInstance :: ProximityPrompt

    local partToWeld = prompt.Parent

    
end

return Item