local moon = loadstring(game:HttpGet("https://raw.githubusercontent.com/Proxides/Library/main/MoonV3.lua", true))()

moon.colors = { --customization; as of now toggles are the only item supported by this feature
	toggles = {
		enabled = Color3.fromRGB(47, 255, 130),
		disabled = Color3.fromRGB(255, 60, 63),
		enabled_stroke = Color3.fromRGB(34, 144, 52),
		disabled_stroke = Color3.fromRGB(141, 37, 38)
	}
}

local main = moon.new("Moon Library V3") --name of the ui

print("Path: "..moon.getui():GetFullName()) --really a misc feature, doesn't have much use

local dropdown = moon.newmenu or moon.newdropdown --either one works, you don't need a variable for this function

local menu = dropdown("Introducing new Menus/Dropdowns", {closewhenclicked = false}) --creates new menu

--adding options to the menu
menu.add("Option 1", function()
	print("You've clicked on the 1st option.")
end)

menu.add("Option 2", function()
	print("You've clicked on the 2nd option.")
end)

--creating tabs
local tab1 = main.tab("Tab")

local section1 = tab1.section("Section 1", {opened = true})
local section2 = tab1.section("Section 2", {opened = true})

section1.label("Made by Proxide & Vynixu; Made for Mikee :)") --:)
--[[
	to change the text:
	local label = section1.label("blah blah blah")
	label.set("new text")
]]

section1.keybind("Keybind", {bind = Enum.KeyCode.E}, function() --creates a keybind, default bind when loaded is E
	print("Vynixu stole your slice of bread :(")
end)

section2.button("Dropdown loader", {
	image = moon.images.dropdown.image, --gets dropdown image from moon.images
	imagecolor = Color3.fromRGB(145, 145, 145), --color
	imagerectsize = moon.images.dropdown.imagerectsize, --this is for the dropdown's image rect size
	imagerectoffset = moon.images.dropdown.imagerectoffset}, function()
		menu.load() --loads the menu upon a click (p.s. to exit a menu, click away from it; on the background)
end)

--[[
	you can also use
	local btn = section.button("a", {}, function()
		print("hello world")
	end)
	
	btn.callback() --prints "hello world"
]]

local toggle = section2.toggle("Toggle", {enabled = true, animationspeed = .35}, function(state) --enabled on loaded, toggle transition animation speed
	print(state)
end)

--[[
	toggle functions: 
	toggle.set(false): sets toggle's color to disabled
	toggle.callback(false): prints false, *as it is what the toggle does when disabled*
	print(toggle.getcurrentstate()): simply prints if the toggle is enabled
]]