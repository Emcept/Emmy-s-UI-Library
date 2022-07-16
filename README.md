# Emmy's UI Library by Emmy#0377 <br />
## Getting Loadstring
```
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Emcept/Emmy-s-UI-Library/main/Emmy's-UI-Library.lua"))()
```

## Creating Window
```
local Window = Library:CreateWindow("Title", "DarkTheme")
```

## Updating Window
```
Window:UpdateWindow("NewTitle", "PurpleTheme")
```

## Removing Window
```
Window:Remove()
```

### Themes:

> DarkTheme  
> LightTheme  
> BlueTheme  
> PurpleTheme  
> PinkTheme  
> RedTheme  
> GreenTheme  
> OrangeTheme  
> TealTheme

## Getting Current Window's Theme
```
local CurrentTheme = Window:GetTheme()
```

## Changing Window's Theme
```
Window:SetTheme("BlueTheme")
```
You can also add your own themes by using the code below. Change the colors to whatever you like.
```
local NewTheme = {
		TabColor = Color3.fromRGB(0, 0, 0),
		ElementColor = Color3.fromRGB(70, 70, 70),
		WindowColor = Color3.fromRGB(0, 0, 0),
		TextColor = Color3.fromRGB(255, 255, 255),
		ImageColor = Color3.fromRGB(120, 120, 120)
	}
	
Window:SetTheme(NewTheme)
```



## Creating Tabs
```
local Tab = Window:AddTab("TabName")
```

## Updating Tabs
```
Tab:UpdateTab("NewTabName")
```

## Removing Tabs
```
Tab:Remove()
```




## Creating Text Labels
```
local TextLabel = Tab:AddTextLabel("LabelText")
```

## Updating Text Labels
```
TextLabel:UpdateTextLabel("NewLabelText")
```

## Removing Text Labels
```
TextLabel:Remove()
```




## Creating Text Buttons
```
local TextButton = Tab:AddTextButton("ButtonText", "Button Info", function()
print("Clicked!")
end)
```

## Updating Text Buttons
```
TextButton:UpdateTextButton("NewButtonText" "New Button Info, function()
print("Button Pressed!")
end)
```

## Removing Text Buttons
```
TextButton:Remove()
```




## Creating Text Boxes
```
local TextBox = Tab:AddTextBox("TextBoxText", "TextBox Info", "DefaultText", function(Text)
print(Text)
end)
```

## Updating Text Boxes
```
TextBox:UpdateTextBox("NewTextBoxText", "New TextBox Info", "New Default Text", function(text)
print("You typed "..text)
end)
```

## Removing Text Boxes
```
TextBox:Remove()
```




## Creating Sliders
```
local Slider = Tab:AddSlider("WalkSpeed", "Changes your WalkSpeed", 16, 200, function(speed)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
end)
```
 
## Updating Sliders
```
Slider:UpdateSlider("NewSliderText", "SliderInfo", 0, 100, function(value)
print(value)
end)
```

## Removing Sliders
```
Slider:Remove()
```




## Creating Keybinds
```
local Keybind = Tab:AddKeybind("KeybindText", "KeybindInfo", "E", function(key)
print("You clicked the bind ("..key..")")
end)
```

## Updating Keybinds
```
Keybind:UpdateKeybind("ToggleUI", "Toggles the Window UI", "G", function()
Window:ToggleUI()
end)
```

## Removing Keybinds
```
Keybind:Remove()
```




## Creating Toggles
```
local Toggle = Tab:AddToggle("ToggleText", "ToggleInfo", function(State)
if State then
print("Toggle On")
else
print("Toggle Off")
end)
```

## Updating Toggles
```
Toggle:UpdateToggle("NewToggleText", "NewToggleInfo", function(state)
print(state)
end)
```

## Removing Toggles
```
Toggle:Remove()
```




## Creating Dropdowns
```
local Dropdown = Tab:AddDropdown("Select option...", "Dropdown Info", {"Yes", "No"}, function(SelectedOption)
print(SelectedOption)
end)
```


## Getting All Dropdown's Options
```
local Options = Dropdown:GetOptions()
for i, option in pairs(Options) do
print(option)
end
```

## Adding An Option To Your Dropdown
```
Dropdown:AddOption("Maybe")
```

## Removing An Option From Your Dropdown
```
Dropdown:RemoveOption("No")
```

## Updating Dropdowns
```
Dropdown:UpdateDropdown("Choose option...", "New Dropdown Info", {"Dog", "Cat"}, function(Option)
print('You have selected "'..Option..'"')
end)
```

## Removing Dropdowns
```
Dropdown:Remove()
```



## Creating Color Pickers
```
local part = Instance.new("Part", game:GetService("Workspace"))
part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

local ColorPicker = Tab:AddColorPicker("ColorPickerText", "Color Picker Info", Color3.fromRGB(255, 255, 255), function(color)
part.Color = color
end)
```

## Updating Color Pickers
```
ColorPicker:UpdateColorPicker("NewColorPickerText", "New Color Picker Info", Color3.fromRGB(0, 0, 0), function(color)
print(color.R, color.G, color.B)
end)
```

## Removing Color Pickers
```
ColorPicker:Remove()
```

## Adding A fully customizable UI
You can also add an option to customize your UI by adding the code below to your tab.
```
local theme = window:GetTheme()

for i, v in pairs(theme) do
	Tab:AddColorPicker(i, "Changes "..i.."'s theme", v, function(color3)
		theme = Window:GetTheme()
		theme[i] = color3
		Window:SetTheme(theme)
	end)
end
```
