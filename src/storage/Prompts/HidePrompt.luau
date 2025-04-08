--!strict

local Item = {}

function Item.Activated(data : {})
    print("HidePrompt.luau activated")
    
    print(data.promptName)
end

return Item