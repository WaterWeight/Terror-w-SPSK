local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ByteNet = require(ReplicatedStorage.Dependencies.ByteNet)

return ByteNet.defineNamespace("messaging", function()
	return {
		promptTriggered = ByteNet.definePacket({
            value = ByteNet.struct({
                player = ByteNet.inst,
                promptName = ByteNet.string,
                promptInstance = ByteNet.inst
            })
        }),
        onDied = ByteNet.definePacket({
            value = ByteNet.struct({
                player = ByteNet.inst,
            })
        })
	}
end)