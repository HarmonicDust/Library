--ugly code lmao

local moon = {}

moon.protectgui = syn and syn.protect_gui or protectgui

--init:

moon.images = {
	dropdown = {
		image = "rbxassetid://3926305904",
		imagerectoffset = Vector2.new(444, 844),
		imagerectsize = Vector2.new(36, 36)
	}
}

--library headers:

moon.colors = moon.colors or {
	toggles = {
		enabled = Color3.fromRGB(48, 183, 255),
		disabled = Color3.fromRGB(27, 27, 27),
		enabled_stroke = Color3.fromRGB(28, 121, 171),
		disabled_stroke = Color3.fromRGB(38, 38, 38)
	}
}

moon.settings = moon.settings or {
	color_picker_offset = 950
}

local InBoundArea = Instance.new("ScreenGui")

moon.protectgui(InBoundArea)

local InBoundArea1 = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

InBoundArea.Name = "InBoundArea"
InBoundArea.Parent = game:GetService("CoreGui")
InBoundArea.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
InBoundArea.IgnoreGuiInset = true

InBoundArea1.Parent = InBoundArea
InBoundArea1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InBoundArea1.BackgroundTransparency = 1.000
InBoundArea1.Position = UDim2.new(0.0882137641, 0, 0.0826822892, 0)
InBoundArea1.Size = UDim2.new(0, 1125, 1, 0)

UIListLayout.Parent = InBoundArea
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

moon.newmenu = function(menuname, config)
	menuname = menuname or "Dropdown/Menu"
	menuname = "<b>"..menuname.."</b>"
	config = config or {}
	config.closewhenclicked = config.closewhenclicked or false
	
	local menu = {}

	local Dropdown = Instance.new("ScreenGui")
	
	moon.protectgui(Dropdown)
	
	local TextButton = Instance.new("TextButton")
	local UIListLayout = Instance.new("UIListLayout")
	local TextButton_2 = Instance.new("TextButton")
	local UICorner = Instance.new("UICorner")
	local Frame = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	
	local UIListLayout_2 = Instance.new("UIListLayout")
	local UIPadding = Instance.new("UIPadding")
	local TextLabel_2 = Instance.new("TextLabel")
	local TextLabel_3 = Instance.new("TextLabel")

	Dropdown.Name = menuname
	Dropdown.Parent = game:GetService("CoreGui")
	Dropdown.IgnoreGuiInset = true
	Dropdown.Enabled = false

	TextButton.Parent = Dropdown
	TextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.BackgroundTransparency = 0.400
	TextButton.BorderSizePixel = 0
	TextButton.Size = UDim2.new(1, 0, 1, 0)
	TextButton.AutoButtonColor = false
	TextButton.Font = Enum.Font.SourceSans
	TextButton.Text = ""
	TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.TextSize = 14.000

	UIListLayout.Parent = TextButton
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	
	TextButton_2.Parent = TextButton
	TextButton_2.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	TextButton_2.Size = UDim2.new(0, 282, 0, 171)
	TextButton_2.AutoButtonColor = false
	TextButton_2.Font = Enum.Font.SourceSans
	TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextButton_2.TextSize = 14.000

	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = TextButton_2

	Frame.Parent = TextButton_2
	Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Frame.Position = UDim2.new(0, 11, 0, 32)
	Frame.Size = UDim2.new(0, 259, 0, 131)

	UICorner_2.CornerRadius = UDim.new(0, 5)
	UICorner_2.Parent = Frame

	ScrollingFrame.Parent = Frame
	ScrollingFrame.Active = true
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	ScrollingFrame.ScrollBarThickness = 3
	
	menu.add = function(name, callback)
		name = name or "Option"
		callback = callback or function() end
		
		local Option = Instance.new("TextButton")
		local UICorner_3 = Instance.new("UICorner")
		local TextLabel = Instance.new("TextLabel")
		local ImageLabel = Instance.new("ImageLabel")
		
		Option.Name = "Option"
		Option.Parent = ScrollingFrame
		Option.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
		Option.Size = UDim2.new(0, 251, 0, 29)
		Option.AutoButtonColor = false
		Option.Font = Enum.Font.SourceSans
		Option.Text = ""
		Option.TextColor3 = Color3.fromRGB(0, 0, 0)
		Option.TextSize = 14.000
		Option.MouseButton1Down:Connect(function()
			callback()
			for i, v in next, ScrollingFrame:GetChildren() do
				if v.Name == "Option" then
					v.ImageLabel.ImageTransparency = 1
				end
			end
			ImageLabel.ImageTransparency = 0
			if config.closewhenclicked then
				Dropdown.Enabled = false
			end
		end)

		UICorner_3.CornerRadius = UDim.new(0, 4)
		UICorner_3.Parent = Option

		TextLabel.Parent = Option
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Position = UDim2.new(0.027888447, 0, 0, 0)
		TextLabel.Size = UDim2.new(0, 193, 0, 30)
		TextLabel.Font = Enum.Font.SourceSans
		TextLabel.Text = name
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 14.000
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left

		ImageLabel.Parent = Option
		ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageLabel.BackgroundTransparency = 1.000
		ImageLabel.Position = UDim2.new(0.910000026, 0, 0.275999993, 0)
		ImageLabel.Size = UDim2.new(0, 14, 0, 14)
		ImageLabel.Image = "rbxassetid://3926305904"
		ImageLabel.ImageRectOffset = Vector2.new(312, 4)
		ImageLabel.ImageRectSize = Vector2.new(24, 24)
		ImageLabel.ImageTransparency = 1
	end
	
	UIListLayout_2.Parent = ScrollingFrame
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_2.Padding = UDim.new(0, 3)

	UIPadding.Parent = ScrollingFrame
	UIPadding.PaddingLeft = UDim.new(0, 3)
	UIPadding.PaddingTop = UDim.new(0, 3)

	TextLabel_2.Parent = TextButton_2
	TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.BackgroundTransparency = 1.000
	TextLabel_2.Position = UDim2.new(0, 11, 0, -1)
	TextLabel_2.Size = UDim2.new(0, 190, 0, 32)
	TextLabel_2.Font = Enum.Font.SourceSans
	TextLabel_2.Text = menuname
	TextLabel_2.RichText = true
	TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextSize = 14.000
	TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

	TextLabel_3.Parent = TextButton_2
	TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_3.BackgroundTransparency = 1.000
	TextLabel_3.Position = UDim2.new(0, 7, 0, 0)
	TextLabel_3.Size = UDim2.new(0, 262, 0, 34)
	TextLabel_3.Text = "_________________________________"
	TextLabel_3.TextColor3 = Color3.fromRGB(45, 45, 45)
	TextLabel_3.TextSize = 10.000
	TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

	TextButton.MouseButton1Down:Connect(function()
		Dropdown.Enabled = false
	end)

	local function NEZCGGA_fake_script() 
		local script = Instance.new('LocalScript', TextButton_2)

		local items = script.Parent.Frame.ScrollingFrame

		items.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			local options = {}
			for i, v in next, items:GetChildren() do
				if v.Name == "Option" then
					table.insert(options, v)
				end
			end
			if #options < 8 then
				items.Parent.Size = UDim2.new(0, 259, 0, (items.UIListLayout.AbsoluteContentSize.Y + 6))
				script.Parent.Size = UDim2.new(0, 282, 0, (items.Parent.Size.Y.Offset + 40))
			else
				items.CanvasSize = UDim2.new(0, 0, 0, (items.UIListLayout.AbsoluteContentSize.Y + 6))
				items.Parent.Size = UDim2.new(0, 259, 0, 227)
				script.Parent.Size = UDim2.new(0, 282, 0, 267)
			end
		end)
	end
	coroutine.wrap(NEZCGGA_fake_script)()
	menu.load = function()
		Dropdown.Enabled = true
	end
	return menu
end

moon.newdropdown = moon.newmenu

moon.new = function(title, config)
	title = title or "Moon Library"
	config = config or {}
	
	title = "<b>"..title.."</b>"
	config.close_tab_onclick = config.close_tab_onclick or true
	local tabs = {}

	local MoonLibraryV3 = Instance.new("ScreenGui")
	
	moon.protectgui(MoonLibraryV3)
	
	local Main = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local TabsBg = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Holder = Instance.new("Frame")

	local TabSelection = Instance.new("Frame")
	local UICorner_13 = Instance.new("UICorner")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local UIListLayout_5 = Instance.new("UIListLayout")

	local UIPadding_3 = Instance.new("UIPadding")
	local Toolbar = Instance.new("Frame")
	local UICorner_15 = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local menu = Instance.new("ImageButton")
	local Black = Instance.new("Frame")
	local UICorner_16 = Instance.new("UICorner")

	MoonLibraryV3.Name = title
	MoonLibraryV3.Parent = game:GetService("CoreGui")

	moon.getui = function()
		return MoonLibraryV3
	end

	Main.Name = "Main"
	Main.Parent = MoonLibraryV3
	Main.Active = true
	Main.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	Main.Position = UDim2.new(0.332660884, 0, 0, 50)
	Main.Size = UDim2.new(0, 422, 0, 255)

	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = Main

	TabsBg.Name = "TabsBg"
	TabsBg.Parent = Main
	TabsBg.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
	TabsBg.Position = UDim2.new(0.021327015, 0, 0.125490203, 0)
	TabsBg.Size = UDim2.new(0, 404, 0, 214)

	UICorner_2.CornerRadius = UDim.new(0, 5)
	UICorner_2.Parent = TabsBg

	Holder.Name = "Holder"
	Holder.Parent = TabsBg
	Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Holder.BackgroundTransparency = 1.000
	Holder.Size = UDim2.new(1, 0, 1, 0)

	tabs.tab = function(name)
		name = name or "Tab"
		local sections = {}

		local Tab = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local UIPadding = Instance.new("UIPadding")


		local Tab_2 = Instance.new("TextButton")
		local UICorner_14 = Instance.new("UICorner")
		local TextLabel_2 = Instance.new("TextLabel")

		Tab_2.Name = name
		Tab_2.Parent = ScrollingFrame
		Tab_2.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
		Tab_2.Position = UDim2.new(-1.95625503e-07, 0, 0, 0)
		Tab_2.Size = UDim2.new(0, 150, 0, 25)
		Tab_2.AutoButtonColor = false
		Tab_2.Font = Enum.Font.SourceSans
		Tab_2.Text = ""
		Tab_2.TextColor3 = Color3.fromRGB(0, 0, 0)
		Tab_2.TextSize = 14.000

		UICorner_14.CornerRadius = UDim.new(0, 4)
		UICorner_14.Parent = Tab_2

		TextLabel_2.Parent = Tab_2
		TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.BackgroundTransparency = 1.000
		TextLabel_2.Position = UDim2.new(0.0604734309, 0, 0, 0)
		TextLabel_2.Size = UDim2.new(0, 140, 0, 25)
		TextLabel_2.Font = Enum.Font.Gotham
		TextLabel_2.Text = name
		TextLabel_2.TextColor3 = Color3.fromRGB(185, 185, 185)
		TextLabel_2.TextSize = 11.000
		TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

		Tab.Name = name
		Tab.Parent = Holder
		Tab.Active = true
		Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab.BackgroundTransparency = 1.000
		Tab.BorderSizePixel = 0
		Tab.Position = UDim2.new(0.00495049497, 0, 0.00934579223, 0)
		Tab.Size = UDim2.new(0, 400, 0, 210)
		Tab.Visible = false
		Tab.CanvasSize = UDim2.new(0, 0, 0, 0)
		Tab.ScrollBarThickness = 4

		UIListLayout.Parent = Tab
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 4)
		UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			Tab.CanvasSize = UDim2.new(0, 0, 0, (UIListLayout.AbsoluteContentSize.Y + 4))
		end)

		UIPadding.Parent = Tab
		UIPadding.PaddingLeft = UDim.new(0, 2)
		UIPadding.PaddingTop = UDim.new(0, 2)

		sections.section = function(sname, config)
			sname = sname or "Section"
			config = config or {}
			
			config.opened = config.opened or false
			local items = {}

			local Section = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")
			local Section_Name = Instance.new("TextLabel")
			local navigate_next = Instance.new("ImageButton")
			local Inner = Instance.new("Frame")
			local UIListLayout_2 = Instance.new("UIListLayout")
			local UIPadding_2 = Instance.new("UIPadding")
			local UICorner_4 = Instance.new("UICorner")

			Section.Name = "Section"
			Section.Parent = Tab
			Section.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
			Section.ClipsDescendants = true
			
			UICorner_3.CornerRadius = UDim.new(0, 5)
			UICorner_3.Parent = Section

			TextLabel.Parent = Section
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.Position = UDim2.new(0.0178571437, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 382, 0, 28)
			TextLabel.Text = "_______________________________________________"
			TextLabel.TextColor3 = Color3.fromRGB(44, 44, 44)
			TextLabel.TextSize = 10.000

			Section_Name.Name = "Section_Name"
			Section_Name.Parent = Section
			Section_Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Section_Name.BackgroundTransparency = 1.000
			Section_Name.Position = UDim2.new(0.0586734712, 0, 0, 0)
			Section_Name.Size = UDim2.new(0, 369, 0, 20)
			Section_Name.Font = Enum.Font.Gotham
			Section_Name.Text = sname
			Section_Name.TextColor3 = Color3.fromRGB(194, 194, 194)
			Section_Name.TextSize = 10.000
			Section_Name.TextXAlignment = Enum.TextXAlignment.Left

			navigate_next.Name = "navigate_next"
			navigate_next.Parent = Section
			navigate_next.BackgroundTransparency = 1.000
			navigate_next.Position = UDim2.new(0.0149999997, 0, 0, 3)
			navigate_next.Size = UDim2.new(0, 14, 0, 14)
			navigate_next.Image = "rbxassetid://3926305904"
			navigate_next.ImageColor3 = Color3.fromRGB(91, 91, 91)
			navigate_next.ImageRectOffset = Vector2.new(444, 844)
			navigate_next.ImageRectSize = Vector2.new(36, 36)

			Inner.Name = "Inner"
			Inner.Parent = Section
			Inner.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			Inner.Position = UDim2.new(0, 7, 0, 28)
			Inner.Size = UDim2.new(0, 380, 0, 20)
			
			UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				Inner.Size = UDim2.new(0, 382, 0, UIListLayout_2.AbsoluteContentSize.Y + 4)
			end)
			
			UIListLayout_2.Parent = Inner
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_2.Padding = UDim.new(0, 2)

			UIPadding_2.Parent = Inner
			UIPadding_2.PaddingLeft = UDim.new(0, 2)
			UIPadding_2.PaddingTop = UDim.new(0, 2)

			UICorner_4.CornerRadius = UDim.new(0, 5)
			UICorner_4.Parent = Inner

			items.keybind = function(name, config, callback)
				name = name or "Keybind"
				config = config or {}
				callback = callback or function() end
				
				config.bind = config.bind or Enum.KeyCode.E
				
				local main = {
					bind = config.bind
				}
				
				local Keybind = Instance.new("Frame")
				local UICorner_5 = Instance.new("UICorner")
				local Name = Instance.new("TextLabel")
				local UIListLayout_3 = Instance.new("UIListLayout")
				local Bind = Instance.new("TextButton")
				local UICorner_6 = Instance.new("UICorner")

				Keybind.Name = "Keybind"
				Keybind.Parent = Inner
				Keybind.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
				Keybind.Position = UDim2.new(0.732804239, 0, 0.115384616, 0)
				Keybind.Size = UDim2.new(0, 376, 0, 26)

				UICorner_5.CornerRadius = UDim.new(0, 4)
				UICorner_5.Parent = Keybind

				Name.Name = "Name"
				Name.Parent = Keybind
				Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Name.BackgroundTransparency = 1.000
				Name.Position = UDim2.new(0.0271377154, 0, 0, 0)
				Name.Size = UDim2.new(0, 364, 0, 26)
				Name.Font = Enum.Font.Gotham
				Name.Text = "Keybind"
				Name.TextColor3 = Color3.fromRGB(255, 255, 255)
				Name.TextSize = 11.000
				Name.TextWrapped = true
				Name.TextXAlignment = Enum.TextXAlignment.Left

				UIListLayout_3.Parent = Name
				UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Right
				UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center

				Bind.Name = "Bind"
				Bind.Parent = Name
				Bind.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				Bind.Position = UDim2.new(0, 348, 0, 3)
				Bind.Size = UDim2.new(0, 25, 0, 20)
				Bind.AutoButtonColor = false
				Bind.Font = Enum.Font.SourceSansBold
				Bind.Text = "..."
				Bind.TextColor3 = Color3.fromRGB(255, 255, 255)
				Bind.TextSize = 13.000
				Bind:GetPropertyChangedSignal("TextBounds"):Connect(function()
					Bind.Size = UDim2.new(0, Bind.TextBounds.X + 10, 0, 20)
				end)

				UICorner_6.CornerRadius = UDim.new(0, 4)
				UICorner_6.Parent = Bind
				
				local UIS = game:GetService("UserInputService")

				local binder = {}

				local set = function(new)
					Bind.Text = new
				end

				function main:BindInput()
					set("...")

					local connect
					connect = UIS.InputBegan:Connect(function(input, processed)
						if not processed and not tostring(input.UserInputType):find("Mouse") then
							connect:Disconnect()
							main:set(input.KeyCode)
						end
					end)
				end

				function main:set(bind)
					main.bind = bind
					set(bind.Name)
				end

				table.insert(binder, Bind)
				main:set(main.bind)

				if not true then
					set(Bind.Text)
				end

				UIS.InputBegan:Connect(function(input, processed)
					if not processed and input.KeyCode == main.bind then
						callback()
					end
				end)

				Bind.InputBegan:Connect(function(input, processed)
					if not processed and input.UserInputType == Enum.UserInputType.MouseButton1 then
						main:BindInput()
					end
				end)
			end

			items.button = function(name, config, callback)
				name = name or "Button"
				config = config or {}
				callback = callback or function() end

				config.imagetransarency = config.imagetransarency or 1
				config.image = config.image or ""
				config.imagerectoffset = config.imagerectoffset or Vector2.new(0, 0)
				config.imagerectsize = config.imagerectsize or Vector2.new(0, 0)
				config.imagecolor = config.imagecolor or Color3.fromRGB(255, 255, 255)
				config.desc = config.desc or ""
				local btn = {}
				
				btn.callback = function()
					callback()
				end

				local Button = Instance.new("TextButton")
				local UICorner_7 = Instance.new("UICorner")
				local Name_2 = Instance.new("TextLabel")
				local UIListLayout_4 = Instance.new("UIListLayout")
				local ImageLabel = Instance.new("ImageLabel")

				Button.Name = "Button"
				Button.Parent = Inner
				Button.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
				Button.Size = UDim2.new(0, 376, 0, 26)
				Button.AutoButtonColor = false
				Button.Font = Enum.Font.Gotham
				Button.Text = ""
				Button.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button.TextSize = 11.000
				Button.TextWrapped = true
				Button.MouseButton1Down:connect(function()
					callback()
				end)

				UICorner_7.CornerRadius = UDim.new(0, 4)
				UICorner_7.Parent = Button

				Name_2.Name = "Name"
				Name_2.Parent = Button
				Name_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Name_2.BackgroundTransparency = 1.000
				Name_2.Position = UDim2.new(0.0271377154, 0, 0, 0)
				Name_2.Size = UDim2.new(0, 362, 0, 26)
				Name_2.Font = Enum.Font.Gotham
				Name_2.Text = name
				Name_2.TextColor3 = Color3.fromRGB(255, 255, 255)
				Name_2.TextSize = 11.000
				Name_2.TextWrapped = true
				Name_2.TextXAlignment = Enum.TextXAlignment.Left

				UIListLayout_4.Parent = Name_2
				UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Right
				UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_4.VerticalAlignment = Enum.VerticalAlignment.Center

				ImageLabel.Parent = Name_2
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1.000
				ImageLabel.Position = UDim2.new(0.952587783, 0, 0.0769230798, 0)
				ImageLabel.Size = UDim2.new(0, 14, 0, 14)
				ImageLabel.Image = config.image
				ImageLabel.ImageRectOffset = config.imagerectoffset
				ImageLabel.ImageRectSize = config.imagerectsize
				ImageLabel.ImageColor3 = config.imagecolor
				
				if config.desc == "" then
					return
				else

					local Desc = Instance.new("TextLabel")
					local UICorner2 = Instance.new("UICorner")

					Desc.Name = "Desc"
					Desc.Parent = Button
					Desc.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
					Desc.Position = UDim2.new(0.222904906, 0, 0, 0)
					Desc.Size = UDim2.new(0, 288, 0, 26)
					Desc.Visible = false
					Desc.ZIndex = 2
					Desc.Font = Enum.Font.SourceSansBold
					Desc.Text = config.desc
					Desc.TextColor3 = Color3.fromRGB(255, 255, 255)
					Desc.TextSize = 11.000
					Desc.TextWrapped = true

					UICorner2.CornerRadius = UDim.new(0, 4)
					UICorner2.Parent = Desc

					Button.MouseMoved:Connect(function(x, y)
						local offset = Vector2.new(math.abs(x - Button.AbsolutePosition.X + 18), math.abs(y - Button.AbsolutePosition.Y - 36))--UDim2.new(0, x, 0, y)
						Desc.Position = UDim2.new(0, offset.X, 0, offset.Y)
					end)

					Button.MouseLeave:Connect(function()
						Desc.Visible = false
					end)

					Button.MouseEnter:Connect(function()
						Desc.Visible = true
					end)

					Desc:GetPropertyChangedSignal("TextBounds"):Connect(function()
						Desc.Size = UDim2.new(0,(Desc.TextBounds.X + 6), 0,(Desc.TextBounds.Y + 6))
					end)
				end
				return btn
			end

			items.toggle = function(name, config, callback)
				name = name or "Toggle"
				config = config or {}
				callback = callback or function() end
				config.enabled = config.enabled or false
				config.animationspeed = config.animationspeed or .3
				
				local funcs = {}
				
				local Toggle = Instance.new("TextButton")
				local UICorner_8 = Instance.new("UICorner")
				local Name_3 = Instance.new("TextLabel")
				local Frame = Instance.new("Frame")
				local UICorner_9 = Instance.new("UICorner")
				local UIStroke = Instance.new("UIStroke")

				Toggle.Name = "Toggle"
				Toggle.Parent = Inner
				Toggle.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
				Toggle.Size = UDim2.new(0, 376, 0, 26)
				Toggle.AutoButtonColor = false
				Toggle.Font = Enum.Font.Gotham
				Toggle.Text = ""
				Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.TextSize = 11.000
				Toggle.TextWrapped = true
				
				if config.enabled then
					Frame.BackgroundColor3 = moon.colors.toggles.enabled
					UIStroke.Color = moon.colors.toggles.enabled_stroke
				else
					Frame.BackgroundColor3 = moon.colors.toggles.disabled
					UIStroke.Color = moon.colors.toggles.disabled_stroke
				end
				
				Toggle.MouseButton1Down:Connect(function()
					config.enabled = not config.enabled
					spawn(function()
						callback(config.enabled)
					end)
					--ctrl c + v lmao
					if config.enabled then
						game:GetService('TweenService'):Create(Frame, TweenInfo.new(config.animationspeed), {BackgroundColor3 = moon.colors.toggles.enabled}):Play()
						game:GetService('TweenService'):Create(UIStroke, TweenInfo.new(config.animationspeed), {Color = moon.colors.toggles.enabled_stroke}):Play()
					else
						game:GetService('TweenService'):Create(Frame, TweenInfo.new(config.animationspeed), {BackgroundColor3 = moon.colors.toggles.disabled}):Play()
						game:GetService('TweenService'):Create(UIStroke, TweenInfo.new(config.animationspeed), {Color = moon.colors.toggles.disabled_stroke}):Play()
					end
				end)
				
				funcs.set = function(new)
					config.enabled = new
					if new then
						game:GetService('TweenService'):Create(Frame, TweenInfo.new(config.animationspeed), {BackgroundColor3 = moon.colors.toggles.enabled}):Play()
						game:GetService('TweenService'):Create(UIStroke, TweenInfo.new(config.animationspeed), {Color = moon.colors.toggles.enabled_stroke}):Play()
					else
						game:GetService('TweenService'):Create(Frame, TweenInfo.new(config.animationspeed), {BackgroundColor3 = moon.colors.toggles.disabled}):Play()
						game:GetService('TweenService'):Create(UIStroke, TweenInfo.new(config.animationspeed), {Color = moon.colors.toggles.disabled_stroke}):Play()
					end
				end
				
				funcs.callback = function(en)
					callback(en)
				end
				
				funcs.getstate = function()
					return config.enabled
				end
				
				funcs.getcurrentstate = funcs.getstate
				
				UICorner_8.CornerRadius = UDim.new(0, 4)
				UICorner_8.Parent = Toggle
				
				UIStroke.Parent = Frame
				UIStroke.Thickness = 2

				Name_3.Name = "Name"
				Name_3.Parent = Toggle
				Name_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Name_3.BackgroundTransparency = 1.000
				Name_3.Position = UDim2.new(0.0271377154, 0, 0, 0)
				Name_3.Size = UDim2.new(0, 367, 0, 26)
				Name_3.Font = Enum.Font.Gotham
				Name_3.Text = name
				Name_3.TextColor3 = Color3.fromRGB(255, 255, 255)
				Name_3.TextSize = 11.000
				Name_3.TextWrapped = true
				Name_3.TextXAlignment = Enum.TextXAlignment.Left

				Frame.Parent = Toggle
				Frame.Position = UDim2.new(0.944444418, 0, 0.192307696, 0)
				Frame.Size = UDim2.new(0, 16, 0, 16)

				UICorner_9.CornerRadius = UDim.new(0, 4)
				UICorner_9.Parent = Frame
				return funcs
			end

			items.slider = function(name, config, callback)
				config = config or {}
				name = name or "Slider"
				config.min = config.min or 0
				config.max = 100
				config.default = config.default or 50
				config.loopfire = config.loopfire or false -- true causes performance issues
				config.runwhenloaded = config.runwhenloaded or false

				local Slider = Instance.new("Frame")
				local Name = Instance.new("TextLabel")
				local UICorner = Instance.new("UICorner")
				local Value = Instance.new("TextLabel")
				local Slide = Instance.new("TextButton")
				local UICorner_2 = Instance.new("UICorner")
				local Indicator = Instance.new("Frame")
				local Circle = Instance.new("Frame")
				local UICorner_3 = Instance.new("UICorner")
				local UICorner_4 = Instance.new("UICorner")

				--Properties:

				Slider.Name = "Slider"
				Slider.Parent = Inner
				Slider.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
				Slider.Position = UDim2.new(0, 0, 9.33333302, 0)
				Slider.Size = UDim2.new(0, 378, 0, 46)

				Name.Name = "Name"
				Name.Parent = Slider
				Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Name.BackgroundTransparency = 1.000
				Name.Position = UDim2.new(0.0271377154, 0, 0, 0)
				Name.Size = UDim2.new(0, 364, 0, 26)
				Name.Font = Enum.Font.Gotham
				Name.Text = name
				Name.TextColor3 = Color3.fromRGB(255, 255, 255)
				Name.TextSize = 11.000
				Name.TextWrapped = true
				Name.TextXAlignment = Enum.TextXAlignment.Left

				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Parent = Slider

				Value.Name = "Value"
				Value.Parent = Slider
				Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Value.BackgroundTransparency = 1.000
				Value.Position = UDim2.new(0.606502771, 0, 0, 0)
				Value.Size = UDim2.new(0, 143, 0, 26)
				Value.Font = Enum.Font.Gotham
				Value.Text = tostring(config.default) .. "/" .. tostring(config.max)
				Value.TextColor3 = Color3.fromRGB(255, 255, 255)
				Value.TextSize = 11.000
				Value.TextWrapped = true
				Value.TextXAlignment = Enum.TextXAlignment.Right

				Slide.Name = "Slide"
				Slide.Parent = Slider
				Slide.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
				Slide.Position = UDim2.new(0.023, 0, 0.745000005, 0)
				Slide.Size = UDim2.new(0, 360, 0, 4)
				Slide.AutoButtonColor = false
				Slide.Font = Enum.Font.SourceSans
				Slide.Text = ""
				Slide.TextColor3 = Color3.fromRGB(0, 0, 0)
				Slide.TextSize = 14.000

				UICorner_2.CornerRadius = UDim.new(1, 0)
				UICorner_2.Parent = Slide

				Indicator.Name = "Indicator"
				Indicator.Parent = Slide
				Indicator.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
				Indicator.BorderSizePixel = 0
				Indicator.Size = UDim2.new(0, 360, 1, 0)

				Circle.Name = "Circle"
				Circle.Parent = Indicator
				Circle.BackgroundColor3 = Color3.fromRGB(109, 109, 109)
				Circle.Position = UDim2.new(1, 0, -0.25, 0)
				Circle.Size = UDim2.new(0, 6, 0, 6)

				UICorner_3.CornerRadius = UDim.new(0, 4)
				UICorner_3.Parent = Circle

				UICorner_4.CornerRadius = UDim.new(1, 0)
				UICorner_4.Parent = Indicator

				local UserInputService = game:GetService("UserInputService")
				local TweenService = game:GetService("TweenService")
				local Dragging = false

				local _Slide = config.default

				Indicator.Size = UDim2.new(0, (Slide.AbsoluteSize.X*config.default/config.max), 1, 0)
				Value.Text = tostring(config.default)

				local function Update()
					if Dragging then
						local MousePos = UserInputService:GetMouseLocation()
						local MinPoint = (Slide.AbsolutePosition.X)
						local MaxPoint = (Slide.AbsolutePosition.X + Slide.AbsoluteSize.X)

						if MousePos.X < MinPoint then
							Indicator:TweenSize(UDim2.fromScale(0, 1), "Out", "Sine", 0.1, true)
						elseif MousePos.X > MaxPoint then
							Indicator:TweenSize(UDim2.fromScale(1, 1), "Out", "Sine", 0.1, true)
						else
							Indicator:TweenSize(UDim2.fromScale((MousePos.X - Slide.AbsolutePosition.X) / Slide.AbsoluteSize.X, 1), "Out", "Sine", 0.1, true)
						end

						wait(0.1)

						local Percent = (Circle.AbsolutePosition.X - Slide.AbsolutePosition.X) / (Slide.AbsoluteSize.X - Circle.Size.X.Offset) * config.max

						_Slide = Percent

						if math.floor(_Slide) < config.min then
							_Slide = config.min
						elseif math.floor(_Slide) > config.max then
							_Slide = config.max
						end

						Value.Text = tostring(math.floor(_Slide)).."/"..config.max

						if config.loopfire then
							callback(math.floor(_Slide))
						end
					end
				end
				
				Slide.MouseButton1Down:Connect(function()
					Dragging = true
					Update()
				end)

				local Mouse = game.Players.LocalPlayer:GetMouse()

				local function IsMouseInBoundOf(FrameInBound)
					local X_Pos, Y_Pos = Mouse.X - FrameInBound.AbsolutePosition.X, Mouse.Y - FrameInBound.AbsolutePosition.Y
					local X_Size, Y_Size = FrameInBound.AbsoluteSize.X, FrameInBound.AbsoluteSize.Y
					if X_Pos >= 0 and Y_Pos >= 0 and X_Pos <= X_Size and Y_Pos <= Y_Size then
						return X_Pos/X_Size, Y_Pos/Y_Size
					end
				end
				
				UserInputService.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 and not config.loopfire and IsMouseInBoundOf(Slider) then --and not config.loopfire and IsMouseInBoundOf(Slider) then task.wait(.075)
						Dragging = false
						--if not config.loopfire and IsMouseInBoundOf(Slider) then 
						callback(math.floor(_Slide))
						--end
					elseif Input.UserInputType == Enum.UserInputType.MouseButton1 and config.loopfire then
						Dragging = false
					end
				end)

				UserInputService.InputChanged:Connect(Update)
				
				local Percent = (Circle.AbsolutePosition.X - Slide.AbsolutePosition.X) / (Slide.AbsoluteSize.X - Circle.Size.X.Offset) * config.max

				_Slide = Percent

				if math.floor(_Slide) < config.min then
					_Slide = config.min
				elseif math.floor(_Slide) > config.max then
					_Slide = config.max
				end

				Value.Text = tostring(math.floor(_Slide)).."/"..config.max

				
				
				if config.runwhenloaded then
					callback(math.floor(_Slide))
				end
			end

			items.textbox = function(config, callback)
				config = config or {}

				local funcs = {}

				config.text = config.text or ""
				config.placeholder = config.placeholder or "Textbox"
				config.clearonfocus = config.clearonfocus or true
				config.getplayer = config.getplayer or false

				local Textbox = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local TextBox = Instance.new("TextBox")
				
				Textbox.Name = "Textbox"
				Textbox.Parent = Inner
				Textbox.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
				Textbox.Position = UDim2.new(0.732804239, 0, 0.115384616, 0)
				Textbox.Size = UDim2.new(0, 378, 0, 26)
				
				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Parent = Textbox

				if config.getplayer then
					local oldcallback = callback
					callback = function()
						for i, v in pairs(game.Players:GetPlayers()) do
							if (string.sub(string.lower(v.Name), 1, string.len(TextBox.Text))) == string.lower(TextBox.Text) or (string.sub(string.lower(v.DisplayName), 1, string.len(TextBox.Text))) == string.lower(TextBox.Text) then
								TextBox.Text = v.Name
								oldcallback(TextBox.Text)
							end
						end
					end
				end

				funcs.settext = function(newText)
					newText = newText or config.text
					TextBox.Text = newText
				end

				TextBox.Parent = Textbox
				TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.BackgroundTransparency = 1.000
				TextBox.Position = UDim2.new(0.0270000007, 0, 0, 0)
				TextBox.Size = UDim2.new(0, 364, 0, 26)
				TextBox.Font = Enum.Font.Gotham
				TextBox.PlaceholderColor3 = Color3.fromRGB(152, 152, 152)
				TextBox.PlaceholderText = config.placeholder
				TextBox.Text = config.text
				TextBox.ClearTextOnFocus = config.clearonfocus
				TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.TextSize = 11.000
				TextBox.TextXAlignment = Enum.TextXAlignment.Left
				TextBox.FocusLost:Connect(function()
					callback(TextBox.Text)
				end)
				return funcs
			end

			items.colorpicker = function(name, config, callback)
                name = name or "Color picker"
                config = config or {}
                callback = callback or function() end

                config.follow_on_invisible = config.follow_on_invisible or true
				local ColorPicker = Instance.new("Frame")
				local Name_4 = Instance.new("TextLabel")
				local UICorner_10 = Instance.new("UICorner")
				local Color = Instance.new("TextButton")
				local UICorner_11 = Instance.new("UICorner")

				ColorPicker.Name = "ColorPicker"
				ColorPicker.Parent = Inner
				ColorPicker.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
				ColorPicker.Position = UDim2.new(0.732804239, 0, 0.115384616, 0)
				ColorPicker.Size = UDim2.new(0, 378, 0, 26)

				Name_4.Name = "Name"
				Name_4.Parent = ColorPicker
				Name_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Name_4.BackgroundTransparency = 1.000
				Name_4.Position = UDim2.new(0.0271377154, 0, 0, 0)
				Name_4.Size = UDim2.new(0, 367, 0, 26)
				Name_4.Font = Enum.Font.Gotham
				Name_4.Text = name
				Name_4.TextColor3 = Color3.fromRGB(255, 255, 255)
				Name_4.TextSize = 11.000
				Name_4.TextWrapped = true
				Name_4.TextXAlignment = Enum.TextXAlignment.Left

				UICorner_10.CornerRadius = UDim.new(0, 4)
				UICorner_10.Parent = ColorPicker

				Color.Name = "Color"
				Color.Parent = ColorPicker
				Color.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Color.Position = UDim2.new(0.891534388, 0, 0.115384616, 0)
				Color.Size = UDim2.new(0, 40, 0, 20)
				Color.AutoButtonColor = false
				Color.Font = Enum.Font.SourceSansBold
				Color.Text = ""
				Color.TextColor3 = Color3.fromRGB(255, 255, 255)
				Color.TextSize = 13.000
				Color.TextWrapped = true

				UICorner_11.CornerRadius = UDim.new(0, 4)
				UICorner_11.Parent = Color

				--Color Picker Main

				local Top = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local Cover = Instance.new("Frame")
				local Name = Instance.new("TextLabel")
				local _ColorPicker = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local ColorPicker_Main = Instance.new("ImageLabel")
				local Marker = Instance.new("Frame")
				local UICorner_3 = Instance.new("UICorner")
				local UICorner_4 = Instance.new("UICorner")
				local Brightness = Instance.new("ImageLabel")
				local Marker_2 = Instance.new("Frame")
				local UICorner_5 = Instance.new("UICorner")
				local UICorner_6 = Instance.new("UICorner")
				local Preview = Instance.new("Frame")
				local UICorner_7 = Instance.new("UICorner")
				local Apply = Instance.new("TextButton")
				local UICorner_8 = Instance.new("UICorner")

				--Properties:

				Top.Name = name
				Top.Parent = MoonLibraryV3
				Top.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
				Top.BorderSizePixel = 0
				Top.Position = UDim2.new(0.672195911, 0, 0.224622041, 0)
				Top.Size = UDim2.new(0, 217, 0, 30)
				Top.ZIndex = 2
				Top.Visible = false
				Top.Active = true
				Top.Draggable = true

				Color.MouseButton1Down:Connect(function()
					Top.Visible = true
				end)

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = Top

				Cover.Name = "Cover"
				Cover.Parent = Top
				Cover.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
				Cover.BorderSizePixel = 0
				Cover.Position = UDim2.new(0, 0, 0.783333361, 0)
				Cover.Size = UDim2.new(1, 0, -0.516666651, 22)
				Cover.ZIndex = 2

				Name.Name = "Name"
				Name.Parent = Top
				Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Name.BackgroundTransparency = 1.000
				Name.Position = UDim2.new(0.0512821898, 0, 0, 0)
				Name.Size = UDim2.new(0, 205, 0, 30)
				Name.ZIndex = 2
				Name.Font = Enum.Font.SourceSans
				Name.Text = "<b>" .. name .. "</b>"
				Name.RichText = true
				Name.TextColor3 = Color3.fromRGB(255, 255, 255)
				Name.TextSize = 14.000
				Name.TextXAlignment = Enum.TextXAlignment.Left

				_ColorPicker.Name = "_ColorPicker"
				_ColorPicker.Parent = Top
				_ColorPicker.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
				_ColorPicker.Size = UDim2.new(0, 217, 0, 232)

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = _ColorPicker

				ColorPicker_Main.Name = "ColorPicker"
				ColorPicker_Main.Parent = _ColorPicker
				ColorPicker_Main.AnchorPoint = Vector2.new(0.5, 0)
				ColorPicker_Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorPicker_Main.BorderColor3 = Color3.fromRGB(40, 40, 40)
				ColorPicker_Main.BorderSizePixel = 0
				ColorPicker_Main.Position = UDim2.new(0.365355879, 0, 0.146547377, 0)
				ColorPicker_Main.Size = UDim2.new(0.627424419, 0, 0.587000012, 0)
				ColorPicker_Main.ZIndex = 4
				ColorPicker_Main.Image = "rbxassetid://1433361550"
				ColorPicker_Main.SliceCenter = Rect.new(10, 10, 90, 90)

				Marker.Name = "Marker"
				Marker.Parent = ColorPicker_Main
				Marker.AnchorPoint = Vector2.new(0.5, 0.5)
				Marker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Marker.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Marker.BorderSizePixel = 0
				Marker.Position = UDim2.new(0.5, 0, 0.5, 0)
				Marker.Size = UDim2.new(0, 4, 0, 4)
				Marker.ZIndex = 5

				UICorner_3.Parent = Marker

				UICorner_4.Parent = ColorPicker_Main

				Brightness.Name = "Brightness"
				Brightness.Parent = _ColorPicker
				Brightness.AnchorPoint = Vector2.new(0.5, 0)
				Brightness.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				Brightness.BorderColor3 = Color3.fromRGB(40, 40, 40)
				Brightness.BorderSizePixel = 0
				Brightness.Position = UDim2.new(0.868113995, 0, 0.146547258, 0)
				Brightness.Size = UDim2.new(0.156471312, 0, 0.587000132, 0)
				Brightness.ZIndex = 4
				Brightness.Image = "rbxassetid://359311684"
				Brightness.SliceCenter = Rect.new(10, 10, 90, 90)

				Marker_2.Name = "Marker"
				Marker_2.Parent = Brightness
				Marker_2.AnchorPoint = Vector2.new(0.5, 0.5)
				Marker_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Marker_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Marker_2.BorderSizePixel = 0
				Marker_2.Position = UDim2.new(0.500000536, 0, 0.0272794869, 0)
				Marker_2.Size = UDim2.new(1, 4, 0.0505603775, 2)
				Marker_2.ZIndex = 5

				UICorner_5.Parent = Marker_2

				UICorner_6.Parent = Brightness

				Preview.Name = "Preview"
				Preview.Parent = _ColorPicker
				Preview.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Preview.Position = UDim2.new(0.0495238192, 0, 0.75714469, 0)
				Preview.Size = UDim2.new(0, 201, 0, 18)

				UICorner_7.CornerRadius = UDim.new(0, 5)
				UICorner_7.Parent = Preview

				Apply.Name = "Apply"
				Apply.Parent = _ColorPicker
				Apply.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				Apply.Position = UDim2.new(0.656026781, 0, 0.875971317, 0)
				Apply.Size = UDim2.new(0, 69, 0, 20)
				Apply.AutoButtonColor = false
				Apply.Font = Enum.Font.SourceSansBold
				Apply.Text = "Apply"
				Apply.TextColor3 = Color3.fromRGB(255, 255, 255)
				Apply.TextSize = 14.000

				UICorner_8.CornerRadius = UDim.new(0, 5)
				UICorner_8.Parent = Apply

				local Color_Picker = {}
				
					Color_Picker.Info = {}
						Color_Picker.Info.Mouse = game.Players.LocalPlayer:GetMouse()
						Color_Picker.Info.Color = Color3.fromHSV(1, 1, 1)
						Color_Picker.Info.Data = {1, 1, 1}
						Color_Picker.Info.IsHoldingMouseButton1 = false
				
					Color_Picker.UI = {}
						Color_Picker.UI.Main = ColorPicker_Main
						Color_Picker.UI.Brightness = Brightness
				
						Color_Picker.UI.Color = Preview
				
					Color_Picker.Functions = {}
						function Color_Picker.Functions:Set(Hue, Sat, Val)
							Color_Picker.Info.Data = {Hue or Color_Picker.Info.Data[1], Sat or Color_Picker.Info.Data[2], Val or Color_Picker.Info.Data[3]}
							Color_Picker.Info.Color = Color3.fromHSV(Color_Picker.Info.Data[1], Color_Picker.Info.Data[2], Color_Picker.Info.Data[3])
							Color_Picker.UI.Color.BackgroundColor3 = Color_Picker.Info.Color
							Color_Picker.UI.Brightness.ImageColor3 = Color3.fromHSV(Color_Picker.Info.Data[1], Color_Picker.Info.Data[2], 1)
						end
				
						function Color_Picker.Functions:IsMouseInBoundOf(FrameInBound)
							local X_Pos, Y_Pos = Color_Picker.Info.Mouse.X - FrameInBound.AbsolutePosition.X, Color_Picker.Info.Mouse.Y - FrameInBound.AbsolutePosition.Y
							local X_Size, Y_Size = FrameInBound.AbsoluteSize.X, FrameInBound.AbsoluteSize.Y
							if X_Pos >= 0 and Y_Pos >= 0 and X_Pos <= X_Size and Y_Pos <= Y_Size then
								return X_Pos/X_Size, Y_Pos/Y_Size
							end
						end
				
						function Color_Picker.Functions:Update()
							if Color_Picker.Info.IsHoldingMouseButton1 then
								local X, Y = Color_Picker.Functions:IsMouseInBoundOf(Color_Picker.UI.Main)
								if X and Y then
									Color_Picker.UI.Main.Marker.Position = UDim2.new(X, 0, Y, 0)
									Color_Picker.Functions:Set(1 - X, 1 - Y)
								end
				
								local X, Y = Color_Picker.Functions:IsMouseInBoundOf(Color_Picker.UI.Brightness)
								if X and Y then
									Color_Picker.UI.Brightness.Marker.Position = UDim2.new(0.5, 0, Y, 0)
									Color_Picker.Functions:Set(nil, nil, 1 - Y)
								end
							end
						end
				
				
					Color_Picker.Info.Mouse.Move:Connect(Color_Picker.Functions.Update)
			
					Color_Picker.Info.Mouse.Button1Down:Connect(function()Color_Picker.Info.IsHoldingMouseButton1 = true end)
					Color_Picker.Info.Mouse.Button1Up:Connect(function()Color_Picker.Info.IsHoldingMouseButton1 = false end)
				
				Apply.MouseButton1Down:Connect(function()
					spawn(function()
						callback(Color_Picker.Info.Color)
					end)
					Top.Visible = false
					Color.BackgroundColor3 = Color_Picker.Info.Color
				end)

                if config.follow_on_invisible then
                    function IsColorPickerInBoundOf(FrameInBound)
                        local X_Pos, Y_Pos = Top.AbsolutePosition.X - FrameInBound.AbsolutePosition.X, Top.AbsolutePosition.Y - FrameInBound.AbsolutePosition.Y
                        local X_Size, Y_Size = FrameInBound.AbsoluteSize.X, FrameInBound.AbsoluteSize.Y
                        if X_Pos >= 0 and Y_Pos >= 0 and X_Pos <= X_Size and Y_Pos <= Y_Size then
                            return X_Pos/X_Size, Y_Pos/Y_Size
                        end
                    end
                    game:GetService("RunService").RenderStepped:Connect(function()
                        if not Top.Visible and IsColorPickerInBoundOf(InBoundArea1) then
                            print("yeah")
                            Top.Position = UDim2.new(0, (Main.Position.X.Offset + moon.settings.color_picker_offset), 0, (Main.Position.Y.Offset))
                            --Top.Position = UDim2.new(0, (Main.Position.X.Offset + 950), 0, (Main.Position.Y.Offset + 150))
                            print("mhm", (Main.Position.X.Scale + 0.313))
                        end
                    end)
                end
			end

			items.label = function(text)
				local funcs = {}
				
				local Label = Instance.new("Frame")
				local Name_5 = Instance.new("TextLabel")
				local UICorner_12 = Instance.new("UICorner")
				Label.Name = "Label"
				Label.Parent = Inner
				Label.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
				Label.Position = UDim2.new(0.732804239, 0, 0.115384616, 0)
				Label.Size = UDim2.new(0, 376, 0, 26)

				Name_5.Name = "Name"
				Name_5.Parent = Label
				Name_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Name_5.BackgroundTransparency = 1.000
				Name_5.Position = UDim2.new(0.0271377154, 0, 0, 0)
				Name_5.Size = UDim2.new(0, 364, 0, 26)
				Name_5.Font = Enum.Font.Gotham
				Name_5.TextColor3 = Color3.fromRGB(255, 255, 255)
				Name_5.TextSize = 11.000
				Name_5.TextWrapped = true
				Name_5.TextXAlignment = Enum.TextXAlignment.Left
				Name_5.Text = text
				Name_5.RichText = true
				
				funcs.set = function(newtext)
					Name_5.Text = newtext
				end

				UICorner_12.CornerRadius = UDim.new(0, 4)
				UICorner_12.Parent = Label
				return funcs
			end

			if config.opened then
				spawn(function()
					Section.Size = UDim2.new(0, 392, 0, (Inner.AbsoluteSize.Y + 32))
				end)
				navigate_next.Rotation = 90
			else
				Section.Size = UDim2.new(0, 392, 0, 28)
				navigate_next.Rotation = 0
			end
			
			navigate_next.MouseButton1Down:Connect(function()
				if config.opened == true then
					config.opened = false
					game:GetService('TweenService'):Create(navigate_next.Parent, TweenInfo.new(0.75), {Size = UDim2.new(0, 392, 0, 28)}):Play()
					game:GetService('TweenService'):Create(navigate_next, TweenInfo.new(0.75), {Rotation = 0}):Play()
				else
					config.opened = true
					game:GetService('TweenService'):Create(navigate_next.Parent, TweenInfo.new(0.75), {Size = UDim2.new(0, 392, 0, (Inner.AbsoluteSize.Y + 32))}):Play()
					game:GetService('TweenService'):Create(navigate_next, TweenInfo.new(0.75), {Rotation = 90}):Play()
				end
			end)

			return items
		end
		return sections
	end
	TabSelection.Name = "TabSelection"
	TabSelection.Parent = Main
	TabSelection.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	TabSelection.BorderSizePixel = 0
	TabSelection.ClipsDescendants = true
	TabSelection.Size = UDim2.new(0, 0, 1, 0)

	UICorner_13.CornerRadius = UDim.new(0, 5)
	UICorner_13.Parent = TabSelection

	ScrollingFrame.Parent = TabSelection
	ScrollingFrame.Active = true
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Position = UDim2.new(0.0410000011, 0, 0.0240000002, 0)
	ScrollingFrame.Size = UDim2.new(0, 156, 0, 243)
	ScrollingFrame.ZIndex = 2
	ScrollingFrame.ScrollBarThickness = 3

	UIListLayout_5.Parent = ScrollingFrame
	UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_5.Padding = UDim.new(0, 4)

	UIPadding_3.Parent = ScrollingFrame
	UIPadding_3.PaddingTop = UDim.new(0, 30)

	Toolbar.Name = "Toolbar"
	Toolbar.Parent = Main
	Toolbar.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
	Toolbar.Size = UDim2.new(1, 0, 0, 30)

	UICorner_15.CornerRadius = UDim.new(0, 5)
	UICorner_15.Parent = Toolbar

	Title.Name = "Title"
	Title.Parent = Toolbar
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0710000843, 0, 0, 0)
	Title.Size = UDim2.new(0, 392, 0, 30)
	Title.Font = Enum.Font.SourceSans
	Title.RichText = true
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000
	Title.TextXAlignment = Enum.TextXAlignment.Left

	menu.Name = "menu"
	menu.Parent = Toolbar
	menu.BackgroundTransparency = 1.000
	menu.Position = UDim2.new(0.0209999997, 0, 0.25, 0)
	menu.Size = UDim2.new(0, 16, 0, 16)
	menu.ZIndex = 2
	menu.Image = "rbxassetid://3926305904"
	menu.ImageRectOffset = Vector2.new(604, 684)
	menu.ImageRectSize = Vector2.new(36, 36)

	Black.Name = "Black"
	Black.Parent = Main
	Black.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Black.BackgroundTransparency = 0.850
	Black.Size = UDim2.new(1, 0, 1, 0)
	Black.Visible = false

	UICorner_16.CornerRadius = UDim.new(0, 5)
	UICorner_16.Parent = Black

	local function BAQKV_fake_script()
		local script = Instance.new('LocalScript', ScrollingFrame)

		local tabbtns = script.Parent
		local tabsmain = script.Parent.Parent.Parent.TabsBg.Holder

		script.Parent.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			script.Parent.CanvasSize = UDim2.new(0, 0, 0, script.Parent.UIListLayout.AbsoluteContentSize.Y)
		end)
		task.wait(.3)
		for i, v in next, tabbtns:GetChildren() do
			if v.ClassName == "TextButton" then
				v.MouseButton1Click:Connect(function()
					if config.close_tab_onclick then
						game:GetService('TweenService'):Create(tabbtns.Parent, TweenInfo.new(0.5), {Size = UDim2.new(0, 0, 1, 0)}):Play()
						script.Parent.Parent.Parent.Black.Visible = false
						script.Parent.Parent.Parent.Toolbar.Title.Visible = true
					end
					for _, k in next, tabsmain:GetChildren() do
						if k.Name == v.TextLabel.Text then
							k.Visible = true
							Title.Text = title.." - "..k.Name
						else
							k.Visible = false
						end
					end
					for _j, j in next, tabbtns:GetChildren() do
						if j.ClassName == "TextButton" then
							if j.Name ~= v.TextLabel.Text then
								j.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
								j.TextColor3 = Color3.fromRGB(255, 255, 255)
							else
								j.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
								j.TextColor3 = Color3.fromRGB(255, 255, 255)
							end
						end
					end
				end)
			end
		end
	end
	coroutine.wrap(BAQKV_fake_script)()
	local function THZU_fake_script()
		local script = Instance.new('LocalScript', menu)

		local IsOpen = false

		script.Parent.MouseButton1Down:Connect(function()
			if IsOpen == true then
				IsOpen = false
				game:GetService('TweenService'):Create(script.Parent.Parent.Parent.TabSelection, TweenInfo.new(0.5), {Size = UDim2.new(0, 0, 1, 0)}):Play()
				script.Parent.Parent.Parent.Black.Visible = false
				script.Parent.Parent.Parent.Toolbar.Title.Visible = true
			else
				IsOpen = true
				game:GetService('TweenService'):Create(script.Parent.Parent.Parent.TabSelection, TweenInfo.new(0.5), {Size = UDim2.new(0, 169, 1, 0)}):Play()
				script.Parent.Parent.Parent.Black.Visible = true
				script.Parent.Parent.Parent.Toolbar.Title.Visible = false
			end
		end)
	end
	coroutine.wrap(THZU_fake_script)()
	local function FDYOIHU_fake_script()
		local script = Instance.new('LocalScript', Main)

		script.Parent.Draggable = true
	end
	coroutine.wrap(FDYOIHU_fake_script)()
	return tabs
end
return moon
