# Emmy's UI Library by Emmy#0377



## Getting loadstring
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



## Creating Tab
`local Tab = Window:AddTab("TabName")`

## Updating Tab
`Tab:UpdateTab("NewTabName")`

## Removing Tab
`Tab:Remove()`


## Creating Label
`local Label = Tab:AddTextLabel("LabelText")`

## Updating Label
`Label:UpdateTextLabel("NewLabelText")`
