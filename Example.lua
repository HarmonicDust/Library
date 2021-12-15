--Initializer
local library = require(game.ReplicatedStorage.ModuleScript)

local window = library:Create("Moon Library") --Name of the library

local tab = window:CreateTab("First tab")

tab:CreateLabel("Made by Proxide")

local btn = tab:CreateButton("Button", function()
	print("Hello World!")
end)

local tog = tab:CreateToggle("Toggle", false, function(callback) --Make sure that "callback" is a different name for each toggle
	print(callback)
end)

local dropdown = tab:CreateDropdown("Dropdown", true, 4) --Name, Closes when clicked, ZIndex

dropdown:AddButton("Option #1", function()
	print("Option 1 clicked")
end)

dropdown:AddButton("Option #2", function()
	print("Option 2 clicked")
end)

tab:CreateSlider("Slider", 0, 100, 50, function(amount)
	print(amount)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = amount
end)

tab:CreateTextBox("Textbox", "...", true, function(text) --Textbox is the text it starts off when loaded, ... is the placeholder text, true is to clear the text when clicked.
	print(text)
end)

tab:CreateTextFunction("Gravity", "...", "50", true, function(textfunc) --gravity is the text function's name, ... is the placeholder for textbox, 50 is the textbox's text, true is if it clears when clicked.
	workspace.Gravity = textfunc
end)

--Keybinds Framework

local UIS = game:GetService("UserInputService")

isChatting = function()
	if UIS:GetFocusedTextBox() then
		return true; else return false
	end
end

UIS.InputBegan:connect(function(input,gameProcessed)
	if isChatting() == false then
		if input.KeyCode == Enum.KeyCode.G then
			tog.SetToggle(not tog.IsEnabled())
		elseif input.KeyCode == Enum.KeyCode.H then
			btn.Fire()
		elseif input.KeyCode == Enum.KeyCode.P then
			if library:isLibraryOpen() then
				library:Close()
			else
				library:Open()
			end
		end
	end
end)
