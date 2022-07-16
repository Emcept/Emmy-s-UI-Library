# Emmy's UI Library by Emmy#0377



## Getting Loadstring
`local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Emcept/Emmy-s-UI-Library/main/Emmy's-UI-Library.lua"))()`




## Creating Window
`local Window = Library:CreateWindow("Title", "DarkTheme")`

## Updating Window
`Window:UpdateWindow("NewTitle", "PurpleTheme")`

## Removing Window
`Window:Remove()`

### Themes:

> DarkTheme
>
> LightTheme
> 
> BlueTheme
> 
> PurpleTheme
> 
> PinkTheme
> 
> RedTheme
> 
> GreenTheme
> 
> OrangeTheme
> 
> TealTheme

## Getting Current Window's Theme
`local CurrentTheme = Window:GetTheme()`

## Changing Window's Theme
`Window:SetTheme("BlueTheme")`




## Creating Tabs
`local Tab = Window:AddTab("TabName")`

## Updating Tabs
`Tab:UpdateTab("NewTabName")`

## Removing Tabs
`Tab:Remove()`




## Creating Text Labels
`local TextLabel = Tab:AddTextLabel("LabelText")`

## Updating Text Labels
`TextLabel:UpdateTextLabel("NewLabelText")`

## Removing Text Labels
`TextLabel:Remove()`




## Creating Text Buttons
`local TextButton = Tab:AddTextButton("ButtonText", "Button Info", function()
print("Clicked!")
end)`

## Updating Text Buttons
`TextButton:UpdateTextButton("NewButtonText" "New Button Info, function()
print("Button Pressed!")
end)`

## Removing Text Buttons
`TextButton:Remove()`




## Creating Text Boxes
`local TextBox = Tab:AddTextBox("TextBoxText", "TextBox Info", "DefaultText", function(Text)
print(Text)
end)`

## Updating Text Boxes
`TextBox:UpdateTextBox("NewTextBoxText", "New TextBox Info", "New Default Text", function(text)
print("You typed "..text)`
end)

## Removing Text Boxes
`TextBox:Remove()`




## Creating Sliders
`local Slider = Tab:AddSlider("WalkSpeed", "Changes your WalkSpeed", 16, 200, function(speed)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
 end)`
 
## Updating Sliders
`Slider:UpdateSlider("NewSliderText", "SliderInfo", 0, 100, function(value)
print(value)
end)`

## Removing Sliders
`Slider:Remove()`




## Creating Keybinds
`local Keybind = Tab:AddKeybind("KeybindText", "KeybindInfo", "E", function(key)
print("You clicked the bind ("..key..")")
end)`

## Updating Keybinds
`Keybind:UpdateKeybind("ToggleUI", "Toggles the Window UI", "G", function()
Window:ToggleUI()
end)`

## Removing Keybinds
`Keybind:Remove()`




## Creating Toggles
`local Toggle = Tab:AddToggle("ToggleText", "ToggleInfo", function(State)
if State then
print("Toggle On")
else
print("Toggle Off")
end)`

## Updating Toggles
`Toggle:UpdateToggle("NewToggleText", "NewToggleInfo", function(state)
print(state)
end)`

## Removing Toggles
`Toggle:Remove()`

## Creating Dropdowns
