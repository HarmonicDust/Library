--This library isn't a full library, doesn't have sliders, keybinds, dropdowns, etc, this is simply just for one project!

--If you want a fully functional library, use Library/Moon.lua

--Written for Mikee, by TheProxide#3240 i think

local library = {}

local assist
assist = {};

assist.dragify = function(Frame)
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

assist.default = {
	name = "Library",
	functions = function() end,
	bool = false
}

library.Init = function(name)
	name = name or assist.default.name

	local tabs = {}

	local Library = Instance.new("ScreenGui")
	local TabSelection = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")
	local UIListLayout = Instance.new("UIListLayout")

	--Properties:

	Library.Name = "Library"
	Library.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	Library.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	TabSelection.Name = "TabSelection"
	TabSelection.Parent = Library
	TabSelection.BackgroundColor3 = Color3.fromRGB(64, 71, 148)
	TabSelection.BorderSizePixel = 0
	TabSelection.Position = UDim2.new(0.0180018004, 0, 0.0346620455, 0)
	TabSelection.Size = UDim2.new(0, 190, 0, 40)

	assist.dragify(TabSelection)

	TextLabel.Parent = TabSelection
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0.0236842111, 0, 0, 0)
	TextLabel.Size = UDim2.new(0, 175, 0, 40)
	TextLabel.Font = Enum.Font.Gotham
	TextLabel.Text = name
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 14.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left

	UIListLayout.Parent = TabSelection
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	function tabs:Tab(tabname)
		tabname = tabname or assist.default.name

		local items
		items = {}

		local _Tab = Instance.new("TextButton")
		local TextLabel_2 = Instance.new("TextLabel")
		local TextLabel_3 = Instance.new("TextLabel")

		local Tab_2 = Instance.new("Frame")
		local TextLabel_4 = Instance.new("TextLabel")
		local UIListLayout_2 = Instance.new("UIListLayout")

		spawn(function()
			task.wait(.3)

			for i, v in next, TabSelection:GetChildren() do
				if v.ClassName == "TextButton" then
					v.MouseButton1Click:Connect(function()
						for _, k in next, Library:GetChildren() do
							if k.Name == v.Name or k.Name == "TabSelection" then
								k.Visible = true;
							else
								k.Visible = false;
							end;
						end;
						for _j, j in next, TabSelection:GetChildren() do
							if j.ClassName == "TextButton" then
								if j.Name ~= v.Name then
									j.BackgroundColor3 = Color3.fromRGB(55, 61, 130)
								else
									j.BackgroundColor3 = Color3.fromRGB(74, 83, 180)
								end;
							end;
						end;
					end);
				end;
			end;
		end)

		Tab_2.Name = tabname
		Tab_2.Parent = Library
		Tab_2.BackgroundColor3 = Color3.fromRGB(64, 71, 148)
		Tab_2.BorderSizePixel = 0
		Tab_2.Position = UDim2.new(0.2, 0, 0.0346620455, 0)
		Tab_2.Size = UDim2.new(0, 190, 0, 40)
		Tab_2.Visible = false

		function items:Button(info, callback)
			assert(info, "No dictionary added.")
			callback = callback or assist.default.functions

			local Button = Instance.new("TextButton")
			local TextLabel_5 = Instance.new("TextLabel")
			local UIListLayout_3 = Instance.new("UIListLayout")
			local ImageButton = Instance.new("ImageButton")
			local Info = Instance.new("TextLabel")

			Button.Name = "Button"
			Button.Parent = Tab_2
			Button.BackgroundColor3 = Color3.fromRGB(55, 61, 130)
			Button.BorderSizePixel = 0
			Button.ClipsDescendants = true
			Button.Position = UDim2.new(0, 0, 1, 0)
			Button.Size = UDim2.new(0, 190, 0, 33)
			Button.AutoButtonColor = false
			Button.Font = Enum.Font.SourceSans
			Button.Text = ""
			Button.TextColor3 = Color3.fromRGB(0, 0, 0)
			Button.TextSize = 14.000
			Button.MouseButton1Click:Connect(function()
				callback()
			end)

			TextLabel_5.Parent = Button
			TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_5.BackgroundTransparency = 1.000
			TextLabel_5.Position = UDim2.new(0.0394736826, 0, 0, 0)
			TextLabel_5.Size = UDim2.new(0, 176, 0, 33)
			TextLabel_5.Font = Enum.Font.Gotham
			TextLabel_5.Text = info.Name
			TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_5.TextSize = 14.000
			TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left

			UIListLayout_3.Parent = TextLabel_5
			UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Right
			UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center

			ImageButton.Parent = TextLabel_5
			ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageButton.BackgroundTransparency = 1.000
			ImageButton.Size = UDim2.new(0, 14, 0, 14)
			ImageButton.Image = "rbxassetid://3926305904"
			ImageButton.ImageRectOffset = Vector2.new(524, 444)
			ImageButton.ImageRectSize = Vector2.new(36, 36)

			Info.Name = "Info"
			Info.Parent = Button
			Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Info.BackgroundTransparency = 1.000
			Info.Position = UDim2.new(0, 7, 0, 33)
			Info.Size = UDim2.new(0, 176, 0, 66)
			Info.Font = Enum.Font.Gotham
			Info.Text = info.Info
			Info.TextColor3 = Color3.fromRGB(205, 205, 205)
			Info.TextSize = 14.000
			Info.TextTransparency = 1.000
			Info.TextXAlignment = Enum.TextXAlignment.Left
			Info.TextYAlignment = Enum.TextYAlignment.Top
			Info.TextWrapped = true

			task.wait()

			local clicked = false
			ImageButton.MouseButton1Click:Connect(function()
				if clicked then
					clicked = false
					Button:TweenSize(UDim2.new(0, 190,0, 33), 'Out', 'Quad', .6)
					game:GetService("TweenService"):Create(Info, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
				else
					clicked = true
					Button:TweenSize(UDim2.new(0, 190,0, Info.TextBounds.Y + 39), 'Out', 'Quad', .6)
					game:GetService("TweenService"):Create(Info, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
				end
			end)
		end

		function items:Toggle(info, callback)
			assert(info, "You need a dictionary with the settings.")
			info.Activated = info.Activated or assist.default.bool
			callback = callback or assist.default.functions

			local Toggle = Instance.new("TextButton")
			local TextLabel_6 = Instance.new("TextLabel")
			local UIListLayout_4 = Instance.new("UIListLayout")
			local ImageButton_2 = Instance.new("ImageButton")
			local Info_2 = Instance.new("TextLabel")

			Toggle.Name = "Toggle"
			Toggle.Parent = Tab_2
			Toggle.BackgroundColor3 = Color3.fromRGB(55, 61, 130)

			Toggle.BorderSizePixel = 0
			Toggle.ClipsDescendants = true
			Toggle.Position = UDim2.new(0, 0, 1, 0)
			Toggle.Size = UDim2.new(0, 190, 0, 33)
			Toggle.AutoButtonColor = false
			Toggle.Font = Enum.Font.SourceSans
			Toggle.Text = ""
			Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.TextSize = 14.000

			local State = info.Activated

			if info.Activated then
				Toggle.BackgroundColor3 = Color3.fromRGB(0, 255, 103)
			else
				Toggle.BackgroundColor3 = Color3.fromRGB(55, 61, 130)
			end

			Toggle.MouseButton1Click:Connect(function()
				State = not State
				callback(State)
				if State then
					Toggle.BackgroundColor3 = Color3.fromRGB(0, 255, 103)
				else
					Toggle.BackgroundColor3 = Color3.fromRGB(55, 61, 130)
				end
			end)

			TextLabel_6.Parent = Toggle
			TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_6.BackgroundTransparency = 1.000
			TextLabel_6.Position = UDim2.new(0.0394736826, 0, 0, 0)
			TextLabel_6.Size = UDim2.new(0, 176, 0, 33)
			TextLabel_6.Font = Enum.Font.Gotham
			TextLabel_6.Text = info.Name
			TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_6.TextSize = 14.000
			TextLabel_6.TextXAlignment = Enum.TextXAlignment.Left

			UIListLayout_4.Parent = TextLabel_6
			UIListLayout_4.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Right
			UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_4.VerticalAlignment = Enum.VerticalAlignment.Center
			UIListLayout_4.Padding = UDim.new(0, 3)

			ImageButton_2.Parent = TextLabel_6
			ImageButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageButton_2.BackgroundTransparency = 1.000
			ImageButton_2.Size = UDim2.new(0, 14, 0, 14)
			ImageButton_2.Image = "rbxassetid://3926305904"
			ImageButton_2.ImageRectOffset = Vector2.new(524, 444)
			ImageButton_2.ImageRectSize = Vector2.new(36, 36)

			Info_2.Name = "Info"
			Info_2.Parent = Toggle
			Info_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Info_2.BackgroundTransparency = 1.000
			Info_2.Position = UDim2.new(0, 7, 0, 33)
			Info_2.Size = UDim2.new(0, 176, 0, 66)
			Info_2.Font = Enum.Font.Gotham
			Info_2.Text = info.Info
			Info_2.TextColor3 = Color3.fromRGB(205, 205, 205)
			Info_2.TextSize = 14.000
			Info_2.TextTransparency = 1.000
			Info_2.TextXAlignment = Enum.TextXAlignment.Left
			Info_2.TextYAlignment = Enum.TextYAlignment.Top
			Info_2.TextWrapped = true

			task.wait()

			local clicked = false
			ImageButton_2.MouseButton1Click:Connect(function()
				if clicked then
					clicked = false
					Toggle:TweenSize(UDim2.new(0, 190,0, 33), 'Out', 'Quad', .6)
					game:GetService("TweenService"):Create(Info_2, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
				else
					clicked = true
					Toggle:TweenSize(UDim2.new(0, 190,0, Info_2.TextBounds.Y + 39), 'Out', 'Quad', .6)
					game:GetService("TweenService"):Create(Info_2, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
				end
			end)
		end

		function items:Textbox(info, callback)
			assert(info, "Dictionary is required.")
			callback = callback or assist.default.functions
			info.Placeholder = info.Placeholder or "..."
			
			local funcs

			local Textbox = Instance.new("TextButton")
			local TextLabel_7 = Instance.new("TextLabel")
			local UIListLayout_5 = Instance.new("UIListLayout")
			local ImageButton_3 = Instance.new("ImageButton")
			local Info_3 = Instance.new("TextLabel")
			local TextBox = Instance.new("TextBox")

			Textbox.Name = "Textbox"
			Textbox.Parent = Tab_2
			Textbox.BackgroundColor3 = Color3.fromRGB(55, 61, 130)
			Textbox.BorderSizePixel = 0
			Textbox.ClipsDescendants = true
			Textbox.Position = UDim2.new(0, 0, 1, 0)
			Textbox.Size = UDim2.new(0, 190, 0, 33)
			Textbox.AutoButtonColor = false
			Textbox.Font = Enum.Font.Gotham
			Textbox.Text = ""
			Textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
			Textbox.TextSize = 14.000

			TextLabel_7.Parent = Textbox
			TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_7.BackgroundTransparency = 1.000
			TextLabel_7.Position = UDim2.new(0.0394736826, 0, 0, 0)
			TextLabel_7.Size = UDim2.new(0, 176, 0, 33)
			TextLabel_7.Font = Enum.Font.Gotham
			TextLabel_7.Text = ""
			TextLabel_7.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_7.TextSize = 14.000
			TextLabel_7.TextXAlignment = Enum.TextXAlignment.Left

			UIListLayout_5.Parent = TextLabel_7
			UIListLayout_5.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout_5.HorizontalAlignment = Enum.HorizontalAlignment.Right
			UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_5.VerticalAlignment = Enum.VerticalAlignment.Center
			UIListLayout_5.Padding = UDim.new(0, 3)

			ImageButton_3.Parent = TextLabel_7
			ImageButton_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageButton_3.BackgroundTransparency = 1.000
			ImageButton_3.Size = UDim2.new(0, 14, 0, 14)
			ImageButton_3.Image = "rbxassetid://3926305904"
			ImageButton_3.ImageRectOffset = Vector2.new(764, 764)
			ImageButton_3.ImageRectSize = Vector2.new(36, 36)

			Info_3.Name = "Info"
			Info_3.Parent = Textbox
			Info_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Info_3.BackgroundTransparency = 1.000
			Info_3.Position = UDim2.new(0, 7, 0, 33)
			Info_3.Size = UDim2.new(0, 176, 0, 66)
			Info_3.Font = Enum.Font.Gotham
			Info_3.Text = info.Info
			Info_3.TextColor3 = Color3.fromRGB(205, 205, 205)
			Info_3.TextSize = 14.000
			Info_3.TextTransparency = 1.000
			Info_3.TextXAlignment = Enum.TextXAlignment.Left
			Info_3.TextYAlignment = Enum.TextYAlignment.Top
			Info_3.TextWrapped = true

			TextBox.Parent = Textbox
			TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.BackgroundTransparency = 1.000
			TextBox.Position = UDim2.new(0.0394736826, 0, 0, 0)
			TextBox.Size = UDim2.new(0, 158, 0, 33)
			TextBox.Font = Enum.Font.Gotham
			TextBox.PlaceholderColor3 = Color3.fromRGB(205, 205, 205)
			TextBox.PlaceholderText = info.Placeholder
			TextBox.Text = info.Text
			TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.TextSize = 14.000
			TextBox.TextXAlignment = Enum.TextXAlignment.Left
			TextBox.FocusLost:Connect(function()
				callback(TextBox.Text)
			end)
			
			funcs = {}
			
			funcs.getText = function()
				return TextBox.Text
			end

			task.wait()

			local clicked = false
			ImageButton_3.MouseButton1Click:Connect(function()
				if clicked then
					clicked = false
					Textbox:TweenSize(UDim2.new(0, 190,0, 33), 'Out', 'Quad', .6)
					game:GetService("TweenService"):Create(Info_3, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
				else
					clicked = true
					Textbox:TweenSize(UDim2.new(0, 190,0, Info_3.TextBounds.Y + 39), 'Out', 'Quad', .6)
					game:GetService("TweenService"):Create(Info_3, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
				end
			end)
			return funcs
		end

		function items:Label(text)
			local Label = Instance.new("TextButton")
			local TextLabel_9 = Instance.new("TextLabel")
			
			local funcs

			Label.Name = "Label"
			Label.Parent = Tab_2
			Label.BackgroundColor3 = Color3.fromRGB(55, 61, 130)
			Label.BorderSizePixel = 0
			Label.ClipsDescendants = true
			Label.Position = UDim2.new(0, 0, 1, 0)
			Label.Size = UDim2.new(0, 190, 0, 33)
			Label.AutoButtonColor = false
			Label.Font = Enum.Font.SourceSans
			Label.Text = ""
			Label.TextColor3 = Color3.fromRGB(0, 0, 0)
			Label.TextSize = 14.000

			TextLabel_9.Parent = Label
			TextLabel_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_9.BackgroundTransparency = 1.000
			TextLabel_9.Position = UDim2.new(0.0394736826, 0, 0, 0)
			TextLabel_9.Size = UDim2.new(0, 176, 0, 33)
			TextLabel_9.Font = Enum.Font.Gotham
			TextLabel_9.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_9.TextSize = 14.000
			TextLabel_9.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel_9.Text = text
			
			funcs = {}
			funcs.set = function(text)
				TextLabel_9.Text = text
			end
			return funcs
		end

		_Tab.Name = tabname
		_Tab.Parent = TabSelection
		_Tab.BackgroundColor3 = Color3.fromRGB(55, 61, 130)
		_Tab.BorderSizePixel = 0
		_Tab.Position = UDim2.new(0, 0, 1, 0)
		_Tab.Size = UDim2.new(0, 190, 0, 33)
		_Tab.AutoButtonColor = false
		_Tab.Font = Enum.Font.SourceSans
		_Tab.Text = ""
		_Tab.TextColor3 = Color3.fromRGB(0, 0, 0)
		_Tab.TextSize = 14.000

		TextLabel_2.Parent = _Tab
		TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.BackgroundTransparency = 1.000
		TextLabel_2.Position = UDim2.new(0.0394736826, 0, 0, 0)
		TextLabel_2.Size = UDim2.new(0, 172, 0, 33)
		TextLabel_2.Font = Enum.Font.Gotham
		TextLabel_2.Text = tabname
		TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.TextSize = 14.000
		TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

		TextLabel_3.Parent = _Tab
		TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_3.BackgroundTransparency = 1.000
		TextLabel_3.Position = UDim2.new(0.907894731, 0, 0, 0)
		TextLabel_3.Size = UDim2.new(0, 17, 0, 33)
		TextLabel_3.Font = Enum.Font.Gotham
		TextLabel_3.Text = ">"
		TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_3.TextSize = 14.000
		TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

		assist.dragify(Tab_2)

		TextLabel_4.Parent = Tab_2
		TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_4.BackgroundTransparency = 1.000
		TextLabel_4.Position = UDim2.new(0.0236842111, 0, 0, 0)
		TextLabel_4.Size = UDim2.new(0, 175, 0, 40)
		TextLabel_4.Font = Enum.Font.Gotham
		TextLabel_4.Text = tabname
		TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_4.TextSize = 14.000
		TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

		UIListLayout_2.Parent = Tab_2
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		return items
	end
	return tabs
end
return library
