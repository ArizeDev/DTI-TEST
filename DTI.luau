

local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local AspectRatio = Instance.new("UIAspectRatioConstraint")
local Frame_2 = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")

-- Properties

Frame.Parent = game.StarterGui.ScreenGui
Frame.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
Frame.BorderColor3 = Color3.new(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0951871648, 0, 0.315533966, 0)
Frame.Size = UDim2.new(0, 388, 0, 208)

UICorner.Parent = Frame

AspectRatio.Name = "AspectRatio"
AspectRatio.Parent = Frame
AspectRatio.AspectRatio = 1.865384578704834

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
Frame_2.BorderColor3 = Color3.new(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(-0.000173667038, 0, -0.00177368755, 0)
Frame_2.Size = UDim2.new(0, 388, 0, 34)

UICorner_2.Parent = Frame_2

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderColor3 = Color3.new(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(-0.110824741, 0, -0.235294119, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "PTI - By arize"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 14

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton.BorderColor3 = Color3.new(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.242268041, 0, 0.379807681, 0)
TextButton.Size = UDim2.new(0, 200, 0, 50)
TextButton.Font = Enum.Font.SourceSans
TextButton.TextColor3 = Color3.new(0, 0, 0)
TextButton.TextSize = 14

UICorner_3.Parent = TextButton

-- Scripts

local function RVOJXL_fake_script() -- Frame.Smooth GUI Dragging 
	local script = Instance.new('LocalScript', Frame)

	local UserInputService = game:GetService("UserInputService")
	local runService = (game:GetService("RunService"));
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	function Lerp(a, b, m)
		return a + (b - a) * m
	end;
	
	local lastMousePos
	local lastGoalPos
	local DRAG_SPEED = (8); -- // The speed of the UI darg.
	function Update(dt)
		if not (startPos) then return end;
		if not (dragging) and (lastGoalPos) then
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return 
		end;
	
		local delta = (lastMousePos - UserInputService:GetMouseLocation())
		local xGoal = (startPos.X.Offset - delta.X);
		local yGoal = (startPos.Y.Offset - delta.Y);
		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end;
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			lastMousePos = UserInputService:GetMouseLocation()
	
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
	
	runService.Heartbeat:Connect(Update)
end
coroutine.wrap(RVOJXL_fake_script)()
local function AMZSFC_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local button = script.Parent -- Assuming the script is a child of the TextButton
	
	-- Function to teleport the player
	local function teleportPlayer()
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait() -- Wait for character to load if not already
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
		-- Teleport to the specified coordinates
		humanoidRootPart.CFrame = CFrame.new(Vector3.new(-227, 15, -409))
	end
	
	-- Connect the function to the TextButton click event
	button.MouseButton1Click:Connect(teleportPlayer)
	
end
coroutine.wrap(AMZSFC_fake_script)()
