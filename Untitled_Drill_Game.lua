local vim = game:GetService("VirtualInputManager")

local gui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(0, 500, 0, 250)
bg.AnchorPoint = Vector2.new(0.5, 0.5)
bg.Position = UDim2.new(0.5, 0, 0.5, 0)
bg.Visible = false
bg.Active = true
bg.Draggable = true

local sf = Instance.new("ScrollingFrame",bg)
sf.Size = UDim2.new(1, 0, 0.85, 0)
sf.AnchorPoint = Vector2.new(0.5, 0.5)
sf.Position = UDim2.new(0.5, 0, 0.58, 0)
sf.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
sf.BackgroundTransparency = 0.9
sf.Visible = false
sf.Active = true
sf.Draggable = true

local uilist = Instance.new("UIListLayout",sf)
uilist.Padding = UDim.new(0, 10)
uilist.HorizontalAlignment = "Center"

local enable = Instance.new("TextButton", sf)
enable.AnchorPoint = Vector2.new(0.5, 0.5)
enable.Position = UDim2.new(0.5, 0, 0.5, 0)
enable.Size = UDim2.new(0.7, 0, 0.2, 0)
enable.Text = "Enable Auto E Presser"
enable.BackgroundColor3 = Color3.fromRGB(130, 219, 105)
enable.TextScaled = true
enable.Visible = false

local claim = Instance.new("TextButton", sf)
claim.AnchorPoint = Vector2.new(0.5, 0.5)
claim.Position = UDim2.new(0.5, 0, 0.5, 0)
claim.Size = UDim2.new(0.7, 0, 0.2, 0)
claim.Text = "Collect Drills and Storage"
claim.BackgroundColor3 = Color3.fromRGB(130, 219, 105)
claim.TextScaled = true
claim.Visible = false

local autoclaim = Instance.new("TextButton", sf)
autoclaim.AnchorPoint = Vector2.new(0.5, 0.5)
autoclaim.Position = UDim2.new(0.5, 0, 0.5, 0)
autoclaim.Size = UDim2.new(0.7, 0, 0.2, 0)
autoclaim.Text = "Enable Auto Collect"
autoclaim.BackgroundColor3 = Color3.fromRGB(130, 219, 105)
autoclaim.TextScaled = true
autoclaim.Visible = false

local nostun = Instance.new("TextButton", sf)
nostun.AnchorPoint = Vector2.new(0.5, 0.5)
nostun.Position = UDim2.new(0.5, 0, 0.5, 0)
nostun.Size = UDim2.new(0.7, 0, 0.2, 0)
nostun.Text = "Enable No Stun"
nostun.BackgroundColor3 = Color3.fromRGB(130, 219, 105)
nostun.TextScaled = true
nostun.Visible = false

local disableparts = Instance.new("TextButton", sf)
disableparts.AnchorPoint = Vector2.new(0.5, 0.5)
disableparts.Position = UDim2.new(0.5, 0, 0.5, 0)
disableparts.Size = UDim2.new(0.7, 0, 0.2, 0)
disableparts.Text = "Disable Parts"
disableparts.BackgroundColor3 = Color3.fromRGB(130, 219, 105)
disableparts.TextScaled = true
disableparts.Visible = false

local list = {
	bg,
	enable,
	sf,
	claim,
	nostun,
	autoclaim,
	disableparts
}

local TweenService = game:GetService("TweenService")

for _, element in pairs(list) do
	local oldsize = element.Size
	element.Visible = true
	element.Size = UDim2.new(0, 0, 0, 0)
	local tween = TweenService:Create(element, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {Size = oldsize})
	tween:Play()
end

local buttons = {
	enable,
	claim,
	nostun,
	autoclaim,
	disableparts
}

for _, x in pairs(buttons) do
	x.MouseEnter:Connect(function()
		local tween = TweenService:Create(x, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {Size = enable.Size + UDim2.new(0.02, 0, 0.02, 0)})
		tween:Play()
		wait(0.2)
		x.Size = UDim2.new(0.7, 0, 0.2, 0) + UDim2.new(0.02, 0, 0.02, 0)
	end)

	x.MouseLeave:Connect(function()
		local tween = TweenService:Create(x, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Size = UDim2.new(0.7, 0, 0.2, 0)})
		tween:Play()
		wait(0.2)
		x.Size = UDim2.new(0.7, 0, 0.2, 0)
	end)
end

local enabledg = false

enable.MouseButton1Click:Connect(function()
	if enable.Text == "Enable Auto E Presser" then
		enable.Text = "Disable Auto E Presser"
		enable.BackgroundColor3 = Color3.fromRGB(255, 102, 102)
		local tween = TweenService:Create(enable, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true), {Size = UDim2.new(0.6, 0, 0.19, 0)})
		tween:Play()
		enabledg = true
		wait(0.4)
		enable.Size = UDim2.new(0.7, 0, 0.2, 0)
	else
		enable.Text = "Enable Auto E Presser"
		enable.BackgroundColor3 = Color3.fromRGB(130, 219, 105)
		local tween = TweenService:Create(enable, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true), {Size = UDim2.new(0.6, 0, 0.19, 0)})
		tween:Play()
		enabledg = false
		wait(0.4)
		enable.Size = UDim2.new(0.7, 0, 0.2, 0)
	end
end)

local nostunen = false

local autoclaimen = false

autoclaim.MouseButton1Click:Connect(function()
	if autoclaim.Text == "Enable Auto Collect" then
		autoclaim.Text = "Disable Auto Collect"
		autoclaim.BackgroundColor3 = Color3.fromRGB(255, 102, 102)
		local tween = TweenService:Create(autoclaim, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true), {Size = UDim2.new(0.6, 0, 0.19, 0)})
		tween:Play()
		autoclaimen = true
		wait(0.4)
		enable.Size = UDim2.new(0.7, 0, 0.2, 0)
	else
		autoclaim.Text = "Enable Auto Collect"
		autoclaim.BackgroundColor3 = Color3.fromRGB(130, 219, 105)
		local tween = TweenService:Create(autoclaim, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true), {Size = UDim2.new(0.6, 0, 0.19, 0)})
		tween:Play()
		autoclaimen = false
		wait(0.4)
		autoclaim.Size = UDim2.new(0.7, 0, 0.2, 0)
	end
end)

nostun.MouseButton1Click:Connect(function()
	if nostun.Text == "Enable No Stun" then
		nostun.Text = "Disable No Stun"
		nostun.BackgroundColor3 = Color3.fromRGB(255, 102, 102)
		local tween = TweenService:Create(nostun, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true), {Size = UDim2.new(0.6, 0, 0.19, 0)})
		tween:Play()
		nostunen = true
		wait(0.4)
		nostun.Size = UDim2.new(0.7, 0, 0.2, 0)
	else
		nostun.Text = "Enable No Stun"
		nostun.BackgroundColor3 = Color3.fromRGB(130, 219, 105)
		local tween = TweenService:Create(nostun, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true), {Size = UDim2.new(0.6, 0, 0.19, 0)})
		tween:Play()
		nostunen = false
		wait(0.4)
		nostun.Size = UDim2.new(0.7, 0, 0.2, 0)
	end
end)

game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
	if nostunen then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 24
	end
end)

local partsdisabled = false

disableparts.MouseButton1Click:Connect(function()
	if disableparts.Text == "Disable Parts" then
		disableparts.Text = "Enable Parts"
		disableparts.BackgroundColor3 = Color3.fromRGB(255, 102, 102)
		local tween = TweenService:Create(disableparts, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true), {Size = UDim2.new(0.6, 0, 0.19, 0)})
		tween:Play()
		partsdisabled = true
		wait(0.4)
		disableparts.Size = UDim2.new(0.7, 0, 0.2, 0)
	else
		disableparts.Text = "Disable Parts"
		disableparts.BackgroundColor3 = Color3.fromRGB(130, 219, 105)
		local tween = TweenService:Create(disableparts, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true), {Size = UDim2.new(0.6, 0, 0.19, 0)})
		tween:Play()
		partsdisabled = false
		wait(0.4)
		disableparts.Size = UDim2.new(0.7, 0, 0.2, 0)
	end
end)

workspace.Ignore.ChildAdded:Connect(function(part)
	if partsdisabled then
		if part:IsA("BasePart") then
			for _, child in ipairs(part:GetDescendants()) do
				if child:IsA("Sound") then
					child:Destroy()
				end
			end
		end
	end
end)


workspace.ChildAdded:Connect(function(part)
	for _, children in ipairs(part:GetChildren()) do
		if children:IsA("Sound") then
			children:Destroy()
		end
	end
end)

claim.MouseButton1Click:Connect(function()
	for _, plot in ipairs(workspace.Plots:GetChildren()) do
		if plot.Owner.Value == game.Players.LocalPlayer then
			for _, part in ipairs(plot.Storage:GetChildren()) do
				game:GetService("ReplicatedStorage").Packages.Knit.Services.PlotService.RE.CollectDrill:FireServer(part)
			end
			for _, part in ipairs(plot.Drills:GetChildren()) do
				game:GetService("ReplicatedStorage").Packages.Knit.Services.PlotService.RE.CollectDrill:FireServer(part)
			end
		end
	end
	local tween = TweenService:Create(claim, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true), {Size = UDim2.new(0.6, 0, 0.19, 0)})
	tween:Play()
	wait(0.4)
	claim.Size = UDim2.new(0.7, 0, 0.2, 0)
end)

local runService = game:GetService("RunService")

coroutine.wrap(function()
	while true do
		if enabledg then
			vim:SendKeyEvent(true, Enum.KeyCode.E, false, game.Players.LocalPlayer)
			wait(0.005)
			vim:SendKeyEvent(false, Enum.KeyCode.E, false, game.Players.LocalPlayer)
		end
		if autoclaimen then
			for _, plot in ipairs(workspace.Plots:GetChildren()) do
				if plot.Owner.Value == game.Players.LocalPlayer then
					for _, part in ipairs(plot.Storage:GetChildren()) do
						game:GetService("ReplicatedStorage").Packages.Knit.Services.PlotService.RE.CollectDrill:FireServer(part)
					end
					for _, part in ipairs(plot.Drills:GetChildren()) do
						game:GetService("ReplicatedStorage").Packages.Knit.Services.PlotService.RE.CollectDrill:FireServer(part)
					end
				end
			end
		end
		wait(0.2)
	end
end)()
