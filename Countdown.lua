-- Gui to Lua
-- Version: 3.2

-- Instances:

local Timer = Instance.new("ScreenGui")
local timerUI = Instance.new("Frame")
local title = Instance.new("TextLabel")
local tick = Instance.new("TextLabel")
local sep = Instance.new("Frame")

--Properties:

Timer.Name = "Timer"
Timer.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Timer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

timerUI.Name = "timerUI"
timerUI.Parent = Timer
timerUI.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
timerUI.BorderSizePixel = 0
timerUI.Position = UDim2.new(0.858267188, 0, 0.452078402, 0)
timerUI.Size = UDim2.new(0, 226, 0, 59)

title.Name = "title"
title.Parent = timerUI
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1.000
title.Position = UDim2.new(0.225663707, 0, -0.01369863, 0)
title.Size = UDim2.new(0, 124, 0, 21)
title.Font = Enum.Font.SourceSans
title.Text = "Time until rolling"
title.TextColor3 = Color3.fromRGB(255, 0, 98)
title.TextScaled = true
title.TextSize = 14.000
title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
title.TextWrapped = true

tick.Name = "tick"
tick.Parent = timerUI
tick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tick.BackgroundTransparency = 1.000
tick.Position = UDim2.new(0.327433616, 0, 0.457247645, 0)
tick.Size = UDim2.new(0, 77, 0, 26)
tick.Font = Enum.Font.Arcade
tick.Text = "Timer"
tick.TextColor3 = Color3.fromRGB(255, 0, 98)
tick.TextScaled = true
tick.TextSize = 25.000
tick.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
tick.TextWrapped = true

sep.Name = "sep"
sep.Parent = timerUI
sep.BackgroundColor3 = Color3.fromRGB(255, 0, 98)
sep.BorderSizePixel = 0
sep.Position = UDim2.new(0, 0, 0.314063132, 0)
sep.Size = UDim2.new(0, 226, 0, 1)

-- Scripts:

local function VXNSGRG_fake_script() -- Timer.colors 
	local script = Instance.new('LocalScript', Timer)

	game:GetService("RunService").Heartbeat:Connect(function()
		script.Parent.timerUI.title.TextColor3 = Color3.fromHSV(tick() * 24 % 255/255, 1, 1)
		script.Parent.timerUI.tick.TextColor3 = Color3.fromHSV(tick() * 24 % 255/255, 1, 1)
		script.Parent.timerUI.sep.BackgroundColor3 = Color3.fromHSV(tick() * 24 % 255/255, 1, 1)
		wait()
	end)
end
coroutine.wrap(VXNSGRG_fake_script)()
local function QAPLSP_fake_script() -- Timer.countdown 
	local script = Instance.new('LocalScript', Timer)

	for i = 100, 0, -1 do
		script.Parent.timerUI.tick.Text = tostring(i)
		wait(1)
	end
end
coroutine.wrap(QAPLSP_fake_script)()
local function TBJNCI_fake_script() -- Timer.drag 
	local script = Instance.new('LocalScript', Timer)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent.timerUI
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(TBJNCI_fake_script)()
