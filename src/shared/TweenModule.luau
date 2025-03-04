local module = {}

module.Slide = function (Slider, OldGUI, NewGUI)
	if Slider and OldGUI and NewGUI then
		local TweenService = game:GetService("TweenService")
		local TweenInf = TweenInfo.new(.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

		local StartTween = TweenService:Create(Slider, TweenInf, {Position = UDim2.new(0,0,0,0)})
		local MidTween = TweenService:Create(Slider, TweenInf, {Position = UDim2.new(0,0,3,0)})

		StartTween:Play()
		StartTween.Completed:Wait()
		OldGUI.Visible = false
		NewGUI.Visible = true
		MidTween:Play()
		MidTween.Completed:Wait()
		Slider.Position = UDim2.new(0,0,-3,0)
	else
		warn("Wrong argument: ", typeof(Slider), " ", typeof(OldGUI), " ", typeof(NewGUI))
	end
end

module.HoverEvent = function()
	
end

return module
