--!strict

local Item = {}

function Item.Activated(data : {})
    print("Prompt1.luau activated")
    
    print(data.promptName)
end

return Item