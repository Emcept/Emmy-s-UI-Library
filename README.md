# Emmy's UI Library by Emmy#0377



## Getting Loadstring
`local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Emcept/Emmy-s-UI-Library/main/Emmy's-UI-Library.lua"))()`


## Creating Window
`local Window = Library:CreateWindow("Title", "DarkTheme")`

## Updating Window
`Window:UpdateWindow("NewTitle", "PurpleTheme")`

## Removing Window
`Window:Remove()`

##### Themes:

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
`TextButton:UpdateTextButton("NewButtonText", function()
print("Button Pressed!")
end)`

## Removing Text Buttons
`TextButton:Remove()`
