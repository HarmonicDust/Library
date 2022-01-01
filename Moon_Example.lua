--Initializer

getgenv().colors = {
    toggle_on = Color3.fromRGB(0, 255, 150), --green when toggles are enabled
    toggle_off = Color3.fromRGB(255, 75, 50) --red when toggles are disabled
}

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Proxides/Library/main/Moon.lua", true))()

task.wait() -- Prevent sliders when being loaded to error (if a player has walkspeed already before character is loaded)

--Keybinded Functions Framework

local UIS = game:GetService("UserInputService")

local window = library:Create("Moon Library") --Name of the Gui

local tab = window:CreateTab("First tab") --name of your tab

tab:CreateLabel("Made by Proxide") --textlabel (you can change the text after library has been loaded with a variable for the label and setting the text with "label.Set(<string> text)")

local btn = tab:CreateButton("Button", function() --a button
	print("Hello World!")
end)

local tog = tab:CreateToggle("Toggle", false, function(callback) --Make sure that "callback" is a different name for each toggle
	print(callback)
end)

local dropdown = tab:CreateDropdown("Dropdown", true, 4) --Name, Closes when clicked, ZIndex

dropdown:AddButton("Option #1", function() --an option
	print("Option 1 clicked")
end)

dropdown:AddButton("Option #2", function() --another option
	print("Option 2 clicked")
end)

tab:CreateSlider("Slider", 0, 100, 50, function(amount) --name, min, max, default, callback
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = amount
end)--.CallCurrentValue() --sets player's walkspeed to 50, because 50 is the default position and calls the slider's current value.

tab:CreateTextBox("Textbox", "...", true, function(text) --Textbox is the text it starts off when loaded, ... is the placeholder text, true is to clear the text when clicked.
	print(text)
end)

tab:CreateTextFunction("Textfunction", "...", "50", true, function(textfunc) --gravity is the text function's name, ... is the placeholder for textbox, 50 is the textbox's text, true is if it clears when clicked.
	workspace.Gravity = textfunc --alternatively you could just use a slider.
end)

tab:CreateKeybind("Keybind", Enum.KeyCode.E, function() --name, default keybind (required), callback
	print("Keybind Pressed.")
end)

UIS.InputBegan:connect(function(input,gameProcessed)
	if not UIS:GetFocusedTextBox() then
		if input.KeyCode == Enum.KeyCode.G then --when G is pressed, it will enable/disable the toggle
			tog.SetToggle(not tog.IsEnabled())
		elseif input.KeyCode == Enum.KeyCode.H then --simply fires the button's function when H is clicked
			btn.Fire()
		elseif input.KeyCode == Enum.KeyCode.P then --when P is clicked, it toggles the library
			if library:isLibraryOpen() then
				library:Close()
			else
				library:Open()
			end
		end
	end
end)
