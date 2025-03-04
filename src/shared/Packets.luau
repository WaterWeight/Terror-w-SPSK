local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ByteNet = require(ReplicatedStorage.Dependencies.ByteNet)

return ByteNet.defineNamespace("messaging", function()
	return {
		sprinting = ByteNet.definePacket({
            value = ByteNet.struct({
                player = ByteNet.inst,
                status = ByteNet.bool
            })
        })
	}
end)