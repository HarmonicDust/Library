local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HarmonicDust/Library/main/Sky.lua", true))()

local main = library.Init("Library") -- library name

local tab = main:Tab("Tab") -- tab name

tab:Textbox({
    Text = "Textbox",
    Info = "Type something in",
    Placeholder = "..."
    }, function(text)
    print(text)
end)

tab:Button({
    Name = "Button",
    Info = "Press the button"
    }, function()
    print("Hello world!")
end)

tab:Toggle({
    Name = "Toggle",
    Info = "Click to de/activate",
    Activated = false
    }, function(State)
    print(State)
end)
