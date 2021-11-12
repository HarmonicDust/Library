local library = {};

local ts = game:GetService("TweenService")

local function dragify(Frame)
	local dragToggle = nil
	local dragSpeed = .25
	local dragInput = nil
	local dragStart = nil
	local dragPos = nil
	local startPos = nil

	local function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(.25), {Position = Position}):Play()
	end

	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if (input.UserInputState == Enum.UserInputState.End) then
					dragToggle = false
				end
			end)
		end
	end)

	Frame.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if (input == dragInput and dragToggle) then
			updateInput(input)
		end
	end)
end

function library:Create(name)
	name = name or ""

	local Library_ = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Shadow = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")
	local UICorner_2 = Instance.new("UICorner")
	local TopBar = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local TextButton = Instance.new("TextButton")
	local UICorner_4 = Instance.new("UICorner")
	local ImageLabel = Instance.new("ImageLabel")
	local Tabs = Instance.new("TextButton")
	local UICorner_5 = Instance.new("UICorner")
	local ImageLabel_2 = Instance.new("ImageLabel")
	local TabOpened = Instance.new("TextLabel")
	local TabSelection = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")
	local TabSelectionScroll = Instance.new("ScrollingFrame")
	--tab
	local UIListLayout = Instance.new("UIListLayout")
	local UIPadding = Instance.new("UIPadding")
	local UICorner_7 = Instance.new("UICorner")
	local Tabs_2 = Instance.new("Frame")
	local UICorner_8 = Instance.new("UICorner")
	--tab frames
	--button
	--toggle
	local Black = Instance.new("Frame")
	local UICorner_13 = Instance.new("UICorner")

	--Properties:

	Library_.Name = "Library_"
	Library_.Parent = game.Players.LocalPlayer.PlayerGui
	Library_.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = Library_
	Main.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	Main.Position = UDim2.new(0.290598303, 0, 0.17331022, 0)
	Main.Size = UDim2.new(0, 490, 0, 376)
	dragify(Main)
	UICorner.CornerRadius = UDim.new(0, 6)
	UICorner.Parent = Main

	Shadow.Name = "Shadow"
	Shadow.Parent = Main
	Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Shadow.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Shadow.BorderSizePixel = 0
	Shadow.Size = UDim2.new(0, 490, 0, 60)

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
	UIGradient.Rotation = 90
	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient.Parent = Shadow

	UICorner_2.CornerRadius = UDim.new(0, 6)
	UICorner_2.Parent = Shadow

	TopBar.Name = "TopBar"
	TopBar.Parent = Shadow
	TopBar.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	TopBar.Size = UDim2.new(0, 490, 0, 35)

	UICorner_3.CornerRadius = UDim.new(0, 6)
	UICorner_3.Parent = TopBar

	Title.Name = "Title"
	Title.Parent = TopBar
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0816326514, 0, 0, 0)
	Title.Size = UDim2.new(0, 322, 0, 35)
	Title.Font = Enum.Font.SourceSansBold
	Title.Text = name
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000
	Title.TextXAlignment = Enum.TextXAlignment.Left

	TextButton.Parent = TopBar
	TextButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	TextButton.Position = UDim2.new(0.938775539, 0, 0.200000003, 0)
	TextButton.Size = UDim2.new(0, 22, 0, 22)
	TextButton.Font = Enum.Font.SourceSans
	TextButton.Text = ""
	TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.TextSize = 14.000
	TextButton.MouseButton1Click:Connect(function()
		Library_:Destroy()
	end)

	UICorner_4.CornerRadius = UDim.new(1, 0)
	UICorner_4.Parent = TextButton

	ImageLabel.Parent = TextButton
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.Position = UDim2.new(0.155000001, 0, 0.125, 0)
	ImageLabel.Size = UDim2.new(0, 16, 0, 16)
	ImageLabel.Image = "rbxassetid://3926305904"
	ImageLabel.ImageColor3 = Color3.fromRGB(255, 0, 100)
	ImageLabel.ImageRectOffset = Vector2.new(284, 4)
	ImageLabel.ImageRectSize = Vector2.new(24, 24)

	Tabs.Name = "Tabs"
	Tabs.Parent = TopBar
	Tabs.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Tabs.Position = UDim2.new(0.0109999999, 0, 0.200000003, 0)
	Tabs.Size = UDim2.new(0, 22, 0, 22)
	Tabs.Font = Enum.Font.SourceSans
	Tabs.Text = ""
	Tabs.TextColor3 = Color3.fromRGB(0, 0, 0)
	Tabs.TextSize = 14.000

	UICorner_5.CornerRadius = UDim.new(1, 0)
	UICorner_5.Parent = Tabs

	ImageLabel_2.Parent = Tabs
	ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel_2.BackgroundTransparency = 1.000
	ImageLabel_2.Position = UDim2.new(0.122000001, 0, 0.125, 0)
	ImageLabel_2.Size = UDim2.new(0, 16, 0, 16)
	ImageLabel_2.Image = "rbxassetid://3926305904"
	ImageLabel_2.ImageColor3 = Color3.fromRGB(255, 0, 100)
	ImageLabel_2.ImageRectOffset = Vector2.new(84, 644)
	ImageLabel_2.ImageRectSize = Vector2.new(36, 36)

	TabOpened.Name = "TabOpened"
	TabOpened.Parent = TopBar
	TabOpened.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabOpened.BackgroundTransparency = 1.000
	TabOpened.Position = UDim2.new(0.738775492, 0, 0, 0)
	TabOpened.Size = UDim2.new(0, 83, 0, 35)
	TabOpened.Font = Enum.Font.Gotham
	TabOpened.Text = ""
	TabOpened.TextColor3 = Color3.fromRGB(155, 155, 155)
	TabOpened.TextSize = 11.000
	TabOpened.TextXAlignment = Enum.TextXAlignment.Right

	TabSelection.Name = "TabSelection"
	TabSelection.Parent = Main
	TabSelection.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	TabSelection.BorderSizePixel = 0
	TabSelection.ClipsDescendants = true
	TabSelection.Position = UDim2.new(0, 0, 0.0930851027, 0)
	TabSelection.Size = UDim2.new(0, 0, 0, 341)
	TabSelection.ZIndex = 2

	TextLabel.Parent = TabSelection
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0.0645920411, 0, 0, 0)
	TextLabel.Size = UDim2.new(0, 116, 0, 25)
	TextLabel.Font = Enum.Font.Gotham
	TextLabel.Text = "Tab Selection"
	TextLabel.TextColor3 = Color3.fromRGB(255, 0, 100)
	TextLabel.TextSize = 10.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left

	TabSelectionScroll.Name = "TabSelectionScroll"
	TabSelectionScroll.Parent = TabSelection
	TabSelectionScroll.Active = true
	TabSelectionScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabSelectionScroll.BackgroundTransparency = 1.000
	TabSelectionScroll.BorderSizePixel = 0
	TabSelectionScroll.Position = UDim2.new(0, 0, 0.0733137801, 0)
	TabSelectionScroll.Size = UDim2.new(0, 123, 0, 316)
	TabSelectionScroll.ZIndex = 2
	TabSelectionScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
	TabSelectionScroll.ScrollBarThickness = 3

	UIListLayout.Parent = TabSelectionScroll
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 3)
	
	UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		local AbsoluteSize = UIListLayout.AbsoluteContentSize;
		TabSelection.CanvasSize = UDim2.new(0, 0, 0, AbsoluteSize.Y + 5);
	end)

	UIPadding.Parent = TabSelectionScroll
	UIPadding.PaddingLeft = UDim.new(0, 5)

	UICorner_7.CornerRadius = UDim.new(0, 6)
	UICorner_7.Parent = TabSelection

	Tabs_2.Name = "Tabs"
	Tabs_2.Parent = Main
	Tabs_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Tabs_2.BackgroundTransparency = 1.000
	Tabs_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Tabs_2.Position = UDim2.new(0.0326530598, 0, 0.122340426, 0)
	Tabs_2.Size = UDim2.new(0, 458, 0, 314)

	UICorner_8.CornerRadius = UDim.new(0, 6)
	UICorner_8.Parent = Tabs_2
	
	local e = false

	Tabs.MouseButton1Click:Connect(function()
		if e == true then
			e = false
			Black.Visible = false
			ts:Create(TabSelection, TweenInfo.new(0.5), {Size = UDim2.new(0, 0,0, 341)}):Play()
		else
			e = true
			Black.Visible = true
			ts:Create(TabSelection, TweenInfo.new(0.5), {Size = UDim2.new(0, 125,0, 341)}):Play()
		end
	end)
	
	local _tabs = {};
	
	spawn(function()
		wait(.7)
		for i, v in next, TabSelectionScroll:GetChildren() do
			if v.ClassName == "TextButton" then
				v.MouseButton1Click:Connect(function()
					for _, k in next, Tabs_2:GetChildren() do
						if k.ClassName == "Frame" then
							if k.Name == v.Name then
								k.Visible = true;
								TabOpened.Text = k.Name
							else
								k.Visible = false;
							end;
						end
					end;
					for _j, j in next, TabSelectionScroll:GetChildren() do
						if j.ClassName == "TextButton" then
							if j.Name ~= v.Name then
								j.TabName.TextColor3 = Color3.fromRGB(175, 175, 175);
							else
								j.TabName.TextColor3 = Color3.fromRGB(255, 255, 255);
							end;
						end;
					end;
				end);
			end;
		end;
	end)
	
	function _tabs:CreateUpdateLog(tname)
		tname = tname or ""
		local updatelog = {}
		
		local UpdateLog = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Tab = Instance.new("TextButton")
		local UICorner_6 = Instance.new("UICorner")
		local TabName = Instance.new("TextLabel")
		local Main = Instance.new("ScrollingFrame")
		local UIGridLayout = Instance.new("UIGridLayout")
		local UIPadding = Instance.new("UIPadding")
		local WelcomeBg = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local WelcomeMessage = Instance.new("TextLabel")
		local UIGradient = Instance.new("UIGradient")
		local UIStroke_2 = Instance.new("UIStroke")

		--Properties:

		UpdateLog.Name = tname
		UpdateLog.Parent = Tabs_2
		UpdateLog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		UpdateLog.BackgroundTransparency = 0.900
		UpdateLog.Size = UDim2.new(0, 458, 0, 314)
		UpdateLog.Visible = false

		UICorner.CornerRadius = UDim.new(0, 6)
		UICorner.Parent = UpdateLog
		
		Tab.Name = tname
		Tab.Parent = TabSelectionScroll
		Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab.BackgroundTransparency = 0.975
		Tab.Position = UDim2.new(0.0599999987, 0, 0.0733137801, 0)
		Tab.Size = UDim2.new(0, 110, 0, 20)
		Tab.Font = Enum.Font.SourceSans
		Tab.Text = ""
		Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
		Tab.TextSize = 14.000

		UICorner_6.CornerRadius = UDim.new(0, 4)
		UICorner_6.Parent = Tab

		TabName.Name = "TabName"
		TabName.Parent = Tab
		TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabName.BackgroundTransparency = 1.000
		TabName.Position = UDim2.new(0.0399999432, 0, 0, 0)
		TabName.Size = UDim2.new(0, 105, 0, 20)
		TabName.Font = Enum.Font.SourceSans
		TabName.Text = tname
		TabName.TextColor3 = Color3.fromRGB(175, 175, 175)
		TabName.TextSize = 13.000
		TabName.TextXAlignment = Enum.TextXAlignment.Left

		Main.Name = "Main"
		Main.Parent = UpdateLog
		Main.Active = true
		Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Main.BackgroundTransparency = 1.000
		Main.BorderColor3 = Color3.fromRGB(27, 42, 53)
		Main.BorderSizePixel = 0
		Main.Position = UDim2.new(0.0198121723, 0, 0.200636938, 0)
		Main.Size = UDim2.new(0, 439, 0, 242)
		Main.ScrollBarThickness = 3

		function updatelog:Update(uname, date, desc)
			uname = uname or ""
			date = date or ""
			desc = desc or ""
			
			local Update = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local Name = Instance.new("TextLabel")
			local Date = Instance.new("TextLabel")
			local Description = Instance.new("TextLabel")
			local UIGridLayout = Instance.new("UIGridLayout")
			local UIPadding = Instance.new("UIPadding")
			local UIStroke = Instance.new("UIStroke")
			
			Update.Name = "Update"
			Update.Parent = Main
			Update.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
			Update.Position = UDim2.new(0.0113895219, 0, 0.0206611566, 0)
			Update.Size = UDim2.new(0, 145, 0, 100)

			UICorner_2.CornerRadius = UDim.new(0, 6)
			UICorner_2.Parent = Update
			
			UIStroke.Name = "UIStroke"
			UIStroke.Parent = Update
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
			UIStroke.Color = Color3.fromRGB(55, 55, 55)
			UIStroke.LineJoinMode = Enum.LineJoinMode.Round
			UIStroke.Thickness = 1
			UIStroke.Transparency = 0
			UIStroke.Enabled = true

			Name.Name = "Name"
			Name.Parent = Update
			Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Name.BackgroundTransparency = 1.000
			Name.Position = UDim2.new(0.0714102536, 0, 0, 0)
			Name.Size = UDim2.new(0, 83, 0, 28)
			Name.Font = Enum.Font.Gotham
			Name.Text = uname
			Name.TextColor3 = Color3.fromRGB(255, 255, 255)
			Name.TextSize = 12.000
			Name.TextWrapped = true
			Name.TextXAlignment = Enum.TextXAlignment.Left

			Date.Name = "Date"
			Date.Parent = Update
			Date.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Date.BackgroundTransparency = 1.000
			Date.Position = UDim2.new(0.41673401, 0, 0, 0)
			Date.Size = UDim2.new(0, 72, 0, 28)
			Date.Font = Enum.Font.Gotham
			Date.Text = date
			Date.TextColor3 = Color3.fromRGB(255, 255, 255)
			Date.TextSize = 12.000
			Date.TextXAlignment = Enum.TextXAlignment.Right

			Description.Name = "Description"
			Description.Parent = Update
			Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Description.BackgroundTransparency = 1.000
			Description.Position = UDim2.new(0.0714102536, 0, 0.280000001, 0)
			Description.Size = UDim2.new(0, 120, 0, 63)
			Description.Font = Enum.Font.Gotham
			Description.Text = desc
			Description.TextColor3 = Color3.fromRGB(200, 200, 200)
			Description.TextSize = 12.000
			Description.TextWrapped = true
			Description.TextXAlignment = Enum.TextXAlignment.Left
			Description.TextYAlignment = Enum.TextYAlignment.Top
		end
		
		UIGridLayout.Parent = Main
		UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIGridLayout.CellSize = UDim2.new(0, 139, 0, 100)
		UIGridLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			local AbsoluteSize = UIGridLayout.AbsoluteContentSize;
			Main.CanvasSize = UDim2.new(0, 0, 0, AbsoluteSize.Y + 8);
		end)

		UIPadding.Parent = Main
		UIPadding.PaddingBottom = UDim.new(0, 5)
		UIPadding.PaddingLeft = UDim.new(0, 5)
		UIPadding.PaddingRight = UDim.new(0, 5)
		UIPadding.PaddingTop = UDim.new(0, 5)

		WelcomeBg.Name = "WelcomeBg"
		WelcomeBg.Parent = UpdateLog
		WelcomeBg.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
		WelcomeBg.Position = UDim2.new(0.0240174681, 0, 0.0445859879, 0)
		WelcomeBg.Size = UDim2.new(0, 412, 0, 30)
		
		UIStroke_2.Name = "UIStroke"
		UIStroke_2.Parent = WelcomeBg
		UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UIStroke_2.Color = Color3.fromRGB(55, 55, 55)
		UIStroke_2.LineJoinMode = Enum.LineJoinMode.Round
		UIStroke_2.Thickness = 1
		UIStroke_2.Transparency = 0
		UIStroke_2.Enabled = true

		UICorner_3.CornerRadius = UDim.new(0, 6)
		UICorner_3.Parent = WelcomeBg

		WelcomeMessage.Name = "WelcomeMessage"
		WelcomeMessage.Parent = WelcomeBg
		WelcomeMessage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		WelcomeMessage.BackgroundTransparency = 1.000
		WelcomeMessage.Position = UDim2.new(0.016990291, 0, 0, 0)
		WelcomeMessage.Size = UDim2.new(0, 405, 0, 30)
		WelcomeMessage.Font = Enum.Font.Gotham
		WelcomeMessage.Text = "Welcome to "..name.."!"
		WelcomeMessage.TextColor3 = Color3.fromRGB(255, 255, 255)
		WelcomeMessage.TextSize = 13.000
		WelcomeMessage.TextXAlignment = Enum.TextXAlignment.Left

		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 30, 65)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(146, 0, 40))}
		UIGradient.Rotation = 45
		UIGradient.Parent = WelcomeMessage
		return updatelog
	end
	function _tabs:CreateTab(tabname)
		tabname = tabname or ""

		local items = {}

		local Tab = Instance.new("TextButton")
		local UICorner_6 = Instance.new("UICorner")
		local TabName = Instance.new("TextLabel")
		local Tab_2 = Instance.new("Frame")
		local UICorner_9 = Instance.new("UICorner")
		local TabScroll = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local UIPadding_2 = Instance.new("UIPadding")

		Tab.Name = tabname
		Tab.Parent = TabSelectionScroll
		Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab.BackgroundTransparency = 0.975
		Tab.Position = UDim2.new(0.0599999987, 0, 0.0733137801, 0)
		Tab.Size = UDim2.new(0, 110, 0, 20)
		Tab.Font = Enum.Font.SourceSans
		Tab.Text = ""
		Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
		Tab.TextSize = 14.000

		UICorner_6.CornerRadius = UDim.new(0, 4)
		UICorner_6.Parent = Tab

		TabName.Name = "TabName"
		TabName.Parent = Tab
		TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabName.BackgroundTransparency = 1.000
		TabName.Position = UDim2.new(0.0399999432, 0, 0, 0)
		TabName.Size = UDim2.new(0, 105, 0, 20)
		TabName.Font = Enum.Font.SourceSans
		TabName.Text = tabname
		TabName.TextColor3 = Color3.fromRGB(175, 175, 175)
		TabName.TextSize = 13.000
		TabName.TextXAlignment = Enum.TextXAlignment.Left

		Tab_2.Name = tabname
		Tab_2.Parent = Tabs_2
		Tab_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Tab_2.BackgroundTransparency = 0.900
		Tab_2.Size = UDim2.new(0, 458, 0, 314)
		Tab_2.Visible = false

		UICorner_9.CornerRadius = UDim.new(0, 6)
		UICorner_9.Parent = Tab_2

		TabScroll.Name = "TabScroll"
		TabScroll.Parent = Tab_2
		TabScroll.Active = true
		TabScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabScroll.BackgroundTransparency = 1.000
		TabScroll.BorderSizePixel = 0
		TabScroll.Size = UDim2.new(0, 458, 0, 314)
		TabScroll.ScrollBarThickness = 3
		TabScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 100)
		TabScroll.CanvasSize = UDim2.new(0, 0, 0, 0)

		UIListLayout_2.Parent = TabScroll
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 5)

		UIPadding_2.Parent = TabScroll
		UIPadding_2.PaddingBottom = UDim.new(0, 5)
		UIPadding_2.PaddingLeft = UDim.new(0, 5)
		UIPadding_2.PaddingRight = UDim.new(0, 5)
		UIPadding_2.PaddingTop = UDim.new(0, 5)

		Black.Name = "Black"
		Black.Parent = Main
		Black.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Black.BackgroundTransparency = 0.600
		Black.BorderSizePixel = 0
		Black.Position = UDim2.new(0, 0, 0.0930851027, 0)
		Black.Size = UDim2.new(0, 490, 0, 341)
		Black.Visible = false

		UICorner_13.CornerRadius = UDim.new(0, 6)
		UICorner_13.Parent = Black

		-- Scripts:
		
		UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			local AbsoluteSize = UIListLayout_2.AbsoluteContentSize;
			TabScroll.CanvasSize = UDim2.new(0, 0, 0, AbsoluteSize.Y + 10);
		end)

		function items:Button(name, callback)
			name = name or ""
			callback = callback or function() end

			local Button = Instance.new("TextButton")
			local UICorner_10 = Instance.new("UICorner")

			Button.Name = "Button"
			Button.Parent = TabScroll
			Button.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			Button.Size = UDim2.new(0, 446, 0, 28)
			Button.AutoButtonColor = false
			Button.Font = Enum.Font.SourceSans
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextSize = 14.000
			Button.Text = name
			Button.MouseButton1Click:Connect(function()
				callback()
			end)
			UICorner_10.CornerRadius = UDim.new(0, 6)
			UICorner_10.Parent = Button
		end

		function items:Toggle(name, default, callback)
			name = name or ""
			default = default or false
			callback = callback or function() end

			local Toggle = Instance.new("TextButton")
			local UICorner_11 = Instance.new("UICorner")
			local ToggleName = Instance.new("TextLabel")
			local Toggle_2 = Instance.new("Frame")
			local UICorner_12 = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")
			local Checked = Instance.new("ImageLabel")

			local state = default

			Toggle.Name = "Toggle"
			Toggle.Parent = TabScroll
			Toggle.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			Toggle.Size = UDim2.new(0, 446, 0, 28)
			Toggle.AutoButtonColor = false
			Toggle.Font = Enum.Font.SourceSans
			Toggle.Text = ""
			Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.TextSize = 14.000
			Toggle.MouseButton1Click:Connect(function()
				state = not state
				callback(state)
				if state == true then
					Checked.Visible = true
				else
					Checked.Visible = false
				end
			end)

			UICorner_11.CornerRadius = UDim.new(0, 6)
			UICorner_11.Parent = Toggle

			ToggleName.Name = "ToggleName"
			ToggleName.Parent = Toggle
			ToggleName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleName.BackgroundTransparency = 1.000
			ToggleName.BorderColor3 = Color3.fromRGB(27, 42, 53)
			ToggleName.Position = UDim2.new(0.0277803019, 0, 0, 0)
			ToggleName.Size = UDim2.new(0, 396, 0, 28)
			ToggleName.Font = Enum.Font.SourceSans
			ToggleName.Text = name
			ToggleName.TextColor3 = Color3.fromRGB(255, 255, 255)
			ToggleName.TextSize = 14.000
			ToggleName.TextXAlignment = Enum.TextXAlignment.Left

			Toggle_2.Name = "Toggle"
			Toggle_2.Parent = Toggle
			Toggle_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			Toggle_2.Position = UDim2.new(0.950672626, 0, 0.142857149, 0)
			Toggle_2.Size = UDim2.new(0, 19, 0, 19)

			UICorner_12.CornerRadius = UDim.new(0, 6)
			UICorner_12.Parent = Toggle_2

			UIStroke.Name = "UIStroke"
			UIStroke.Parent = Toggle_2
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
			UIStroke.Color = Color3.fromRGB(55, 55, 55)
			UIStroke.LineJoinMode = Enum.LineJoinMode.Round
			UIStroke.Thickness = 1
			UIStroke.Transparency = 0
			UIStroke.Enabled = true

			Checked.Name = "Checked"
			Checked.Parent = Toggle_2
			Checked.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Checked.BackgroundTransparency = 1.000
			Checked.Position = UDim2.new(0.0949999988, 0, 0.0599999987, 0)
			Checked.Size = UDim2.new(0, 16, 0, 16)
			Checked.Image = "rbxassetid://3926305904"
			Checked.ImageColor3 = Color3.fromRGB(255, 0, 100)
			Checked.ImageRectOffset = Vector2.new(312, 4)
			Checked.ImageRectSize = Vector2.new(24, 24)
			Checked.Visible = default
		end
		return items
	end
	return _tabs
end
return library
