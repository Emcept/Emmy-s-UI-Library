local lib = {}
local rippleeffect = true

local lp = game.Players.LocalPlayer
local pg = lp.PlayerGui

local menudb = false

local allwindows = {}
local alltabs = {}

function dragify(Frame)
	Frame.Active = true
	Frame.Draggable = true
end

local themes = {
	DarkTheme = {
		TabColor = Color3.fromRGB(60, 60, 60),
		ElementColor = Color3.fromRGB(30, 30, 30),
		WindowColor = Color3.fromRGB(70, 70, 70),
		TextColor = Color3.fromRGB(255, 255, 255),
		ImageColor = Color3.fromRGB(203, 203, 203)
	},
	LightTheme = {
		TabColor = Color3.fromRGB(250, 250, 250),
		ElementColor = Color3.fromRGB(215, 215, 215),
		WindowColor = Color3.fromRGB(190, 190, 190),
		TextColor = Color3.fromRGB(0, 0, 0),
		ImageColor = Color3.fromRGB(72, 72, 72)
	},
	BlueTheme = {
		TabColor = Color3.fromRGB(19, 86, 125),
		ElementColor = Color3.fromRGB(0, 150, 225),
		WindowColor = Color3.fromRGB(24, 115, 167),
		TextColor = Color3.fromRGB(255, 255, 255),
		ImageColor = Color3.fromRGB(129, 207, 255)
	},
	PurpleTheme = {
		TabColor = Color3.fromRGB(90, 52, 112),
		ElementColor = Color3.fromRGB(184, 113, 225),
		WindowColor = Color3.fromRGB(131, 73, 167),
		TextColor = Color3.fromRGB(255, 255, 255),
		ImageColor = Color3.fromRGB(255, 129, 255)
	},
	PinkTheme = {
		TabColor = Color3.fromRGB(108, 51, 112),
		ElementColor = Color3.fromRGB(225, 109, 220),
		WindowColor = Color3.fromRGB(164, 71, 167),
		TextColor = Color3.fromRGB(255, 255, 255),
		ImageColor = Color3.fromRGB(255, 153, 255)
	},
	RedTheme = {
		TabColor = Color3.fromRGB(40, 40, 40),
		ElementColor = Color3.fromRGB(225, 62, 62),
		WindowColor = Color3.fromRGB(30, 30, 30),
		TextColor = Color3.fromRGB(255, 255, 255),
		ImageColor = Color3.fromRGB(255, 114, 114)
	},
	GreenTheme = {
		TabColor = Color3.fromRGB(40, 40, 40),
		ElementColor = Color3.fromRGB(54, 212, 107),
		WindowColor = Color3.fromRGB(30, 30, 30),
		TextColor = Color3.fromRGB(255, 255, 255),
		ImageColor = Color3.fromRGB(159, 255, 157)
	},
	OrangeTheme = {
		TabColor = Color3.fromRGB(40, 40, 40),
		ElementColor = Color3.fromRGB(255, 152, 49),
		WindowColor = Color3.fromRGB(30, 30, 30),
		TextColor = Color3.fromRGB(255, 255, 255),
		ImageColor = Color3.fromRGB(255, 210, 46)
	},
	TealTheme = {
		TabColor = Color3.fromRGB(0, 158, 153),
		ElementColor = Color3.fromRGB(0, 216, 162),
		WindowColor = Color3.fromRGB(35, 189, 156),
		TextColor = Color3.fromRGB(255, 255, 255),
		ImageColor = Color3.fromRGB(133, 255, 219)
	}
}




function lib:CreateWindow(windowname, theme)
	
	local windowtemplate = Instance.new("ScreenGui")

	local destroyed = false
	local first = nil
	windowname = windowname or 'Window'
	local window = {}
	table.insert(lib, windowname)
	
	if table.find(allwindows, windowname) then
		print('Please choose a different name for your window!')
		return
	end

	table.insert(allwindows, windowname)

	local function totheme(text)
		if type(text) == 'table' then
			local t = text
			if t.TabColor and t.ElementColor and t.WindowColor and t.TextColor and t.ImageColor then
				return t
			end
		else
			if type(text) == 'string' then
				if text == 'DarkTheme' or text == 'Dark' then
					return themes.DarkTheme
				elseif text == 'LightTheme' or text == 'Light' then
					return themes.LightTheme
				elseif text == 'BlueTheme' or text == 'Blue' then
					return themes.BlueTheme
				elseif text == 'PurpleTheme' or text == 'Purple' then
					return themes.PurpleTheme
				elseif text == 'PinkTheme' or text == 'Pink' then
					return themes.PinkTheme
				elseif text == 'RedTheme' or text == 'Red' then
					return themes.RedTheme
				elseif text == 'GreenTheme' or text == 'Green' then
					return themes.GreenTheme
				elseif text == 'OrangeTheme' or text == 'Orange' then
					return themes.OrangeTheme
				elseif text == 'TealTheme' or text == 'Teal' then
					return themes.TealTheme
				else
					return themes.DarkTheme
				end
			end
		end
	end


	theme = totheme(theme)

	function window:SetTheme(newTheme)

		theme = totheme(newTheme)
		
		local win = nil

		win = windowtemplate

		for i, v in pairs(win:GetDescendants()) do

			local background = nil

			if win ~= nil then
				if win:FindFirstChild'Background' and win:FindFirstChild'Background':FindFirstChild'InfoFrame' then
					background = win:FindFirstChild'Background'
				end
			end

			if win ~= nil then
				if v.Name == 'Apply' and v.Parent.Parent:FindFirstChild'Preview' or v.Name == 'Cancel' and v.Parent.Parent:FindFirstChild'Preview' then
					v.BackgroundColor3 = theme.ElementColor
				end
				if v.Name == 'Background' and v:FindFirstChild'Background' and v.Parent:FindFirstChild'Preview' then
					v.ImageColor3 = theme.WindowColor
					v:FindFirstChild'Background'.ImageColor3 = theme.WindowColor
				end
			end

			if win ~= nil then
				local b = v
				if b:IsA'TextLabel' or b:IsA'TextButton' or v:IsA'TextBox' and b.Name ~= 'ColorButton' and b.Name ~= 'CloseButton' then
					pcall(function()
						b.TextColor3 = theme.TextColor
					end)
				end
			end

			if win ~= nil then
				win.Background.BackgroundColor3 = theme.WindowColor
			end

			if background ~= nil then
				background:FindFirstChild'CloseButton'.BackgroundColor3 = theme.ImageColor
				background:FindFirstChild'InfoFrame':FindFirstChild'UINotification'.BackgroundColor3 = theme.ElementColor
				for a, b in pairs(background:GetDescendants()) do
					if table.find(alltabs, v.Name) then
						if b:IsA'Frame' then
							b.BackgroundColor3 = theme.TabColor
						end
					else
						if #alltabs > 0 then
							if b:IsA'TextLabel' or b:IsA'TextButton' or b:IsA'Frame' or b:IsA'ScrollingFrame' then
								if b.Name ~= 'sliderBtn' and b.Name ~= 'Menu' and b.Name ~= 'sliderDrag' and b.Name ~= 'InfoFrame' and b.Name ~= 'ColorButton' and b.Name ~= 'CloseButton' and not table.find(alltabs, b.Name) and b.Parent.Name ~= 'Background' and b.Name ~= 'Background' then
									b.BackgroundColor3 = theme.ElementColor
								end
							end


							if b.Name == 'sliderBtn' then
								b.BackgroundColor3 = theme.TabColor
							end
							if b.Name == 'sliderDrag' then
								b.BackgroundColor3 = theme.ImageColor
							end
							if b.Name == 'Background' and v:IsA'ImageLabel' then
								b.ImageColor3 = theme.TabColor
							end
							if b:IsA'ImageButton' then
								b.ImageColor3 = theme.ImageColor
							end
							if b:IsA'TextBox' then
								b.BackgroundColor3 = theme.WindowColor
								b.TextColor3 = theme.TextColor
								b.PlaceholderColor3 = theme.TextColor
								b.TextColor3 = theme.TextColor
							end
						end
						if b.Name == 'Menu' and b.Parent == background then
							b.BackgroundColor3 = theme.WindowColor
							for u, i in pairs(b:GetChildren()) do
								if i:IsA'TextButton' then
									i.BackgroundColor3 = theme.ElementColor
								end
							end
						end
						if table.find(alltabs, b.Name) and b.Parent.Name == 'Background' then
							if b.Name ~= 'Menu' then
								b.BackgroundColor3 = theme.TabColor
							end
						end
						if b:IsA'ScrollingFrame' then
							b.ScrollBarImageColor3 = theme.TextColor
						end
						if b.Name == 'Toggle' and b:IsA'ImageLabel' then
							b.ImageColor3 = theme.ImageColor
						end
					end
				end
			end
		end
	end


	local function enableripple(v)
		v.MouseButton1Click:Connect(function()
			local ms = game.Players.LocalPlayer:GetMouse()

			-- Instances:

			local Circle = Instance.new("ImageLabel")

			--Properties:

			Circle.Name = "Circle"
			Circle.Parent = v
			Circle.BackgroundColor3 = theme.TextColor
			Circle.ImageColor3 = theme.TextColor
			Circle.BackgroundTransparency = 1.000
			Circle.BorderSizePixel = 0
			Circle.Image = "http://www.roblox.com/asset/?id=4560909609"
			Circle.ImageTransparency = 0.600
			Circle.ImageTransparency = .7

			v.ClipsDescendants = true
			if rippleeffect == true then
				local len, size = 1.4, nil --set the duration here
				local c = Circle
				local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
				c.Position = UDim2.new(0, x, 0, y)
				if v.AbsoluteSize.X >= v.AbsoluteSize.Y then
					size = (v.AbsoluteSize.X * 1.5)
				else
					size = (v.AbsoluteSize.Y * 1.5)
				end
				c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
				for i = 1, 20 do
					c.ImageTransparency = c.ImageTransparency + 0.05
					wait(len / 12)
				end
				c:Destroy()
			end
		end)
	end


	-- Instances:

	local Background = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local UICorner_2 = Instance.new("UICorner")
	local UICorner_3 = Instance.new("UICorner")
	local CloseButton = Instance.new("TextButton")
	local UICorner_4 = Instance.new("UICorner")
	local InfoFrame = Instance.new("Frame")
	local UICorner_5 = Instance.new("UICorner")
	local UINotification = Instance.new("Frame")
	local UICorner_6 = Instance.new("UICorner")
	local Information = Instance.new("TextLabel")

	--Properties:

	windowtemplate.Name = tostring(windowname) or 'Window'
	windowtemplate.Enabled = true
	windowtemplate.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	windowtemplate.ResetOnSpawn = false

	Background.Name = "Background"
	Background.Parent = windowtemplate
	Background.BackgroundColor3 = theme.WindowColor
	Background.Position = UDim2.new(0.367858708, 0, 0.306688428, 0)
	Background.Size = UDim2.new(0, 404, 0, 269)

	UICorner.Parent = Background

	Title.Name = 'Title'
	Title.Parent = Background
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0215898268, 0, 0.0206666403, 0)
	Title.Size = UDim2.new(0, 177, 0, 20)
	Title.Font = Enum.Font.Ubuntu
	Title.Text = tostring(windowname) or 'Window'
	Title.TextColor3 = theme.TextColor
	Title.TextScaled = true
	Title.TextSize = 14.000
	Title.TextWrapped = true
	Title.TextXAlignment = Enum.TextXAlignment.Left

	UICorner_2.Parent = Title

	UICorner_3.Parent = UICorner_2

	CloseButton.Name = "CloseButton"
	CloseButton.Parent = Background
	CloseButton.BackgroundColor3 = theme.ImageColor
	CloseButton.Position = UDim2.new(0.938950539, 0, 0.0219999999, 0)
	CloseButton.Size = UDim2.new(0, 18, 0, 18)
	CloseButton.AutoButtonColor = false
	CloseButton.Font = Enum.Font.SourceSans
	CloseButton.Text = ""
	CloseButton.TextColor3 = theme.TextColor
	CloseButton.TextSize = 14.000

	UICorner_4.CornerRadius = UDim.new(0, 5)
	UICorner_4.Parent = CloseButton

	InfoFrame.Name = "InfoFrame"
	InfoFrame.Parent = Background
	InfoFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	InfoFrame.BackgroundTransparency = 1.000
	InfoFrame.Size = UDim2.new(0, 404, 0, 269)
	InfoFrame.ZIndex = 10

	UICorner_5.CornerRadius = UDim.new(0, 5)
	UICorner_5.Parent = InfoFrame

	UINotification.Name = "UINotification"
	UINotification.Parent = InfoFrame
	UINotification.AnchorPoint = Vector2.new(0.5, 1)
	UINotification.BackgroundColor3 = theme.ElementColor
	UINotification.BackgroundTransparency = 1.000
	UINotification.Position = UDim2.new(0.5, 0, 1, 0)
	UINotification.Size = UDim2.new(0, 404, 0, 35)
	UINotification.ZIndex = 10

	UICorner_6.CornerRadius = UDim.new(0, 5)
	UICorner_6.Parent = UINotification

	Information.Name = "Information"
	Information.Parent = UINotification
	Information.AnchorPoint = Vector2.new(0.5, 0.5)
	Information.BackgroundColor3 = theme.ElementColor
	Information.BackgroundTransparency = 1.000
	Information.Position = UDim2.new(0.5, 0, 0.5, 0)
	Information.Size = UDim2.new(0, 389, 0, 24)
	Information.ZIndex = 5
	Information.Font = Enum.Font.Ubuntu
	Information.Text = "Information"
	Information.TextColor3 = theme.TextColor
	Information.TextScaled = true
	Information.TextSize = 14.000
	Information.TextTransparency = 1.000
	Information.TextWrapped = true

	windowtemplate.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

	windowtemplate.Background:WaitForChild('CloseButton').MouseButton1Click:Connect(function()
		if table.find(allwindows, windowname) then
			table.remove(allwindows, table.find(allwindows, windowname))
		end
		destroyed = true
		windowtemplate:Destroy()
	end)

	dragify(windowtemplate.Background)

	function window:Remove()
		if table.find(allwindows, windowname) then
			table.remove(allwindows, table.find(allwindows, windowname))
		end
		destroyed = true
		windowtemplate:Destroy()
	end

	function window:UpdateWindow(newwindowname, newtheme)
		window:SetTheme(newtheme)
		if table.find(allwindows, windowtemplate.Name) then
			table.remove(allwindows, table.find(allwindows, windowtemplate.Name))
			table.insert(allwindows, newwindowname)
		end
		windowtemplate.Name = tostring(newwindowname)
		windowtemplate.Background.Title.Text = tostring(newwindowname)
	end

	function window:AddTab(tabname)
		if windowtemplate.Background:FindFirstChild(tabname) or tabname == 'Menu' then
			print(('Please choose a different name for your tab. (%s)'):format(tabname))
			return
		end
		local tabs = {}
		table.insert(tabs, tabname)
		tabname = tabname or 'Tab'

		table.insert(alltabs, tabname)

		-- Instances:

		local tabtemplate = Instance.new("Frame")
		local Objects = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")

		--Properties:

		tabtemplate.Name = tostring(tabname)
		tabtemplate.Active = true
		tabtemplate.BackgroundColor3 = theme.TabColor
		tabtemplate.BorderColor3 = Color3.fromRGB(255, 255, 255)
		tabtemplate.BorderSizePixel = 0
		tabtemplate.ClipsDescendants = true
		tabtemplate.Position = UDim2.new(0.294554442, 0, 0.113603443, 0)
		tabtemplate.Selectable = true
		tabtemplate.Size = UDim2.new(0, 279, 0, 232)

		Objects.Name = "Objects"
		Objects.Parent = tabtemplate
		Objects.Active = true
		Objects.BackgroundColor3 = Color3.fromRGB(theme.TabColor)
		Objects.BackgroundTransparency = 1.000
		Objects.BorderColor3 = Color3.fromRGB(255, 255, 255)
		Objects.BorderSizePixel = 0
		Objects.Position = UDim2.new(0, 0, 0.0250000786, 0)
		Objects.Size = UDim2.new(0, 279, 0, 225)
		Objects.CanvasSize = UDim2.new(0, 0, 0, 0)
		Objects.ScrollBarThickness = 3

		UIListLayout.Parent = Objects
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 5)

		tabtemplate.Parent = windowtemplate.Background


		local menutemplate
		if not windowtemplate.Background:FindFirstChild'Menu' then

			-- Instances:

			menutemplate = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")

			--Properties:

			menutemplate.Name = "Menu"
			menutemplate.Active = true
			menutemplate.BackgroundColor3 = theme.WindowColor
			menutemplate.BorderColor3 = Color3.fromRGB(255, 255, 255)
			menutemplate.BorderSizePixel = 0
			menutemplate.Position = UDim2.new(0, 0, 0.150778159, 0)
			menutemplate.Size = UDim2.new(0, 119, 0, 221)
			menutemplate.CanvasSize = UDim2.new(0, 0, 0, 0)
			menutemplate.ScrollBarThickness = 3
			menutemplate.ScrollBarImageColor3 = theme.TextColor

			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Parent = menutemplate

			menutemplate.Parent = windowtemplate.Background
		else
			menutemplate = windowtemplate.Background.Menu
		end
		
		local function UpdateSize3()
			local cS = menutemplate.UIListLayout.AbsoluteContentSize
			game.TweenService:Create(menutemplate, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CanvasSize = UDim2.new(0,cS.X,0,cS.Y)
			}):Play()
		end

		local function menuenableripple(v)
			v.MouseButton1Click:Connect(function()
				if v.Parent == menutemplate and menudb == false then
					local ms = game.Players.LocalPlayer:GetMouse()

					-- Instances:

					local Circle = Instance.new("ImageLabel")

					--Properties:

					Circle.Name = "Circle"
					Circle.Parent = v
					Circle.BackgroundColor3 = theme.TextColor
					Circle.ImageColor3 = theme.TextColor
					Circle.BackgroundTransparency = 1.000
					Circle.BorderSizePixel = 0
					Circle.Image = "http://www.roblox.com/asset/?id=4560909609"
					Circle.ImageTransparency = 0.600
					Circle.ImageTransparency = .7

					v.ClipsDescendants = true
					if rippleeffect == true then
						local len, size = 1.4, nil --set the duration here
						local c = Circle
						local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
						c.Position = UDim2.new(0, x, 0, y)
						if v.AbsoluteSize.X >= v.AbsoluteSize.Y then
							size = (v.AbsoluteSize.X * 1.5)
						else
							size = (v.AbsoluteSize.Y * 1.5)
						end
						c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
						for i = 1, 20 do
							c.ImageTransparency = c.ImageTransparency + 0.05
							wait(len / 12)
						end
						c:Destroy()
					end
				end
			end)
		end


		local function UpdateSize()
			pcall(function()
			if destroyed == false then
				local cS = tabtemplate.Objects.UIListLayout.AbsoluteContentSize
				game.TweenService:Create(tabtemplate.Objects, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					CanvasSize = UDim2.new(0,cS.X,0,cS.Y)
				}):Play()
				end
				end)
		end

		tabtemplate.Objects.ChildAdded:Connect(UpdateSize)
		tabtemplate.Objects.ChildRemoved:Connect(UpdateSize)


		-- Instances:

		local tabmenutemplate = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")

		--Properties:

		tabmenutemplate.Name = tostring(tabname)
		tabmenutemplate.Active = false
		tabmenutemplate.BackgroundColor3 = theme.ElementColor
		tabmenutemplate.BackgroundTransparency = 1.000
		tabmenutemplate.Selectable = false
		tabmenutemplate.Size = UDim2.new(0, 100, 0, 25)
		tabmenutemplate.AutoButtonColor = false
		tabmenutemplate.Font = Enum.Font.Ubuntu
		tabmenutemplate.Text = tostring(tabname)
		tabmenutemplate.TextColor3 = theme.TextColor
		tabmenutemplate.TextSize = 20.000
		tabmenutemplate.TextWrapped = true

		UICorner.CornerRadius = UDim.new(0, 6)
		UICorner.Parent = tabmenutemplate

		tabmenutemplate.Parent = menutemplate
		
		UpdateSize3()

		if first == nil then
			first = tabname
			tabmenutemplate.BackgroundTransparency = 0
		end

		for i, v in pairs(windowtemplate.Background:GetChildren()) do
			if v.Name == 'UICorner' or v.Name == 'CloseButton' or v.Name == 'InfoFrame' or v.Name == 'Title' or v.Name == 'Circle' or v.Name == 'Menu' or v.Name == 'DragScript' then else
				if v.Name ~= first then
					v.Visible = false
				end
			end
		end
		
		local changing = nil


		tabmenutemplate.MouseButton1Click:Connect(function()
			changing = tabmenutemplate.Name
			if menudb == false then
				menudb = true
				local p = tabmenutemplate
				local menu = menutemplate
				for _, v in pairs(menu:GetChildren()) do
					if v:IsA'TextButton' then
						if v.BackgroundTransparency == 0 and v ~= p then
							menu.Parent[v.Name].Visible = false
							local newthread = coroutine.wrap(function()
								game.TweenService:Create(v, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
									BackgroundTransparency = 1
								}):Play()
							end)
							newthread()
						elseif v == p then
							menu.Parent[v.Name].Visible = true
							local newthread = coroutine.wrap(function()
								game.TweenService:Create(tabmenutemplate, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
									BackgroundTransparency = 0
								}):Play()
							end)
							newthread()
						end
					end
				end
				wait(.35)
				menudb = false
				changing = nil
			end
		end)



		menuenableripple(tabmenutemplate)

		function tabs:UpdateTab(text)
			if table.find(alltabs, tabname) then
				table.remove(alltabs, table.find(alltabs, tabname))
				table.insert(alltabs, text)
			end
			if first == tabtemplate.Name then
				first = tostring(text)
			end
			tabtemplate.Name = tostring(text)
			tabmenutemplate.Name = tostring(text)
			tabmenutemplate.Text = tostring(text)
		end
		
		function tabs:Remove()
			if table.find(alltabs, tabname) then
				table.remove(alltabs, table.find(alltabs, tabname))
			end
			if first == tabtemplate.Name and #alltabs > 0 then
				first = alltabs[1]
			end
			tabmenutemplate:Destroy()
			tabtemplate:Destroy()
			UpdateSize3()
		end

		function tabs:AddTextLabel(text)
			local textlabel = {}
			table.insert(textlabel, text)
			-- Instances:

			local textlabeltemplate = Instance.new("TextLabel")
			local UICorner = Instance.new("UICorner")

			--Properties:

			textlabeltemplate.Name = tostring(text)
			textlabeltemplate.BackgroundColor3 = theme.ElementColor
			textlabeltemplate.Position = UDim2.new(0.149748906, 0, 0.11745514, 0)
			textlabeltemplate.Size = UDim2.new(0, 264, 0, 30)
			textlabeltemplate.Font = Enum.Font.Ubuntu
			textlabeltemplate.Text = tostring(text)
			textlabeltemplate.TextColor3 = theme.TextColor
			textlabeltemplate.TextSize = 20.000
			textlabeltemplate.TextWrapped = true

			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = textlabeltemplate

			textlabeltemplate.Parent = tabtemplate.Objects
			UpdateSize()

			function textlabel:Remove()
				if table.find(alltabs, tabname) then
					table.remove(alltabs, table.find(alltabs, tabname))
				end
				textlabeltemplate:Destroy()
				UpdateSize()
			end
			function textlabel:UpdateTextLabel(texxt, infoo)
				textlabeltemplate.Name = tostring(texxt)
				textlabeltemplate.Text = tostring(texxt)
			end
			return textlabel
		end



		function tabs:AddDropdown(text, info, optns, funcc)
			local inf = info or 'Information'
			text = text or 'Dropdown'
			local dropdown = {}
			table.insert(dropdown, text)
			local size
			local size2
			local options = optns	
			local function setsize()
				if #options >= 2 then
					size = 135
					size2 = 100
				end
				if #options == 1 then
					size = 100
					size2 = 65
				end
				if #options == 0 then
					size = 65
					size2 = 30
				end
			end
			setsize()
			local func = funcc

			-- Instances:

			local dropdowntemplate = Instance.new("Frame")
			local Dropdown = Instance.new("TextLabel")
			local UICorner = Instance.new("UICorner")
			local Options = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local ViewInfo = Instance.new("ImageButton")
			local ImageButton = Instance.new("ImageButton")

			--Properties:

			dropdowntemplate.Name = tostring(text)
			dropdowntemplate.BackgroundColor3 = theme.TextColor
			dropdowntemplate.BackgroundTransparency = 1.000
			dropdowntemplate.Position = UDim2.new(0.137855574, 0, 0.437194139, 0)
			dropdowntemplate.Size = UDim2.new(0, 264, 0, 30)

			Dropdown.Name = "Dropdown"
			Dropdown.Parent = dropdowntemplate
			Dropdown.BackgroundColor3 = theme.ElementColor
			Dropdown.Position = UDim2.new(-7.12126493e-05, 0, -0.00608734041, 0)
			Dropdown.Size = UDim2.new(0, 264, 0, 30)
			Dropdown.Font = Enum.Font.Ubuntu
			Dropdown.Text = tostring(text)
			Dropdown.TextColor3 = theme.TextColor
			Dropdown.TextSize = 20.000
			Dropdown.TextWrapped = true

			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = Dropdown

			Options.Name = "Options"
			Options.Parent = Dropdown
			Options.Active = true
			Options.BackgroundColor3 = theme.TextColor
			Options.BackgroundTransparency = 1.000
			Options.BorderSizePixel = 0
			Options.Position = UDim2.new(0, 0, 1.15999997, 0)
			Options.Size = UDim2.new(0, 264, 0, 0)
			Options.CanvasSize = UDim2.new(0, 0, 0, 0)
			Options.ScrollBarThickness = 3
			Options.ScrollBarImageColor3 = theme.TextColor
			Options.ScrollingDirection = 'Y'

			UIListLayout.Parent = Options
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)

			ViewInfo.Name = "ViewInfo"
			ViewInfo.Parent = Dropdown
			ViewInfo.AnchorPoint = Vector2.new(1, 0.5)
			ViewInfo.BackgroundColor3 = theme.TextColor
			ViewInfo.BackgroundTransparency = 1.000
			ViewInfo.Position = UDim2.new(1, 0, 0.5, 0)
			ViewInfo.Size = UDim2.new(0, 28, 0, 28)
			ViewInfo.Image = "http://www.roblox.com/asset/?id=10215364479"
			ViewInfo.ImageColor3 = theme.ImageColor

			ImageButton.Parent = Dropdown
			ImageButton.AnchorPoint = Vector2.new(1, 0.5)
			ImageButton.BackgroundColor3 = theme.ImageColor
			ImageButton.BackgroundTransparency = 1.000
			ImageButton.Position = UDim2.new(0.909090936, 0, 0.5, 0)
			ImageButton.Size = UDim2.new(0, 28, 0, 28)
			ImageButton.Image = "http://www.roblox.com/asset/?id=10244276681"
			ImageButton.ImageColor3 = theme.ImageColor

			dropdowntemplate.Parent = tabtemplate.Objects


			-- Instances:

			local textlabeltemplate = Instance.new("TextLabel")
			local UICorner = Instance.new("UICorner")

			--Properties:

			textlabeltemplate.Name = tostring(text)
			textlabeltemplate.BackgroundColor3 = theme.ElementColor
			textlabeltemplate.Position = UDim2.new(0.149748906, 0, 0.11745514, 0)
			textlabeltemplate.Size = UDim2.new(0, 264, 0, 30)
			textlabeltemplate.Font = Enum.Font.Ubuntu
			textlabeltemplate.Text = tostring(text)
			textlabeltemplate.TextColor3 = theme.TextColor
			textlabeltemplate.TextSize = 20.000
			textlabeltemplate.TextWrapped = true

			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = textlabeltemplate

			textlabeltemplate.Parent = dropdowntemplate.Dropdown.Options
			for i = 1, #options do
				-- Instances:

				local btntemplate = Instance.new("TextButton")
				local UICorner = Instance.new("UICorner")

				--Properties:

				btntemplate.Name = tostring(options[i])
				btntemplate.Text = tostring(options[i])
				btntemplate.Active = false
				btntemplate.BackgroundColor3 = theme.ElementColor
				btntemplate.Position = UDim2.new(0.137130082, 0, 0.26590538, 0)
				btntemplate.Selectable = false
				btntemplate.Size = UDim2.new(0, 264, 0, 30)
				btntemplate.AutoButtonColor = false
				btntemplate.Font = Enum.Font.Ubuntu
				btntemplate.TextColor3 = theme.TextColor
				btntemplate.TextSize = 20.000
				btntemplate.TextWrapped = true

				UICorner.CornerRadius = UDim.new(0, 6)
				UICorner.Parent = btntemplate

				btntemplate.Parent = dropdowntemplate.Dropdown.Options
			end
			local function UpdateSize2()
				pcall(function()
					if destroyed == false then
						local cS = dropdowntemplate:FindFirstChild('Dropdown').Options.UIListLayout.AbsoluteContentSize
						game.TweenService:Create(dropdowntemplate:FindFirstChild('Dropdown').Options, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							CanvasSize = UDim2.new(0,cS.X,0,cS.Y)
						}):Play()
					end
				end)
			end
			dropdowntemplate.Dropdown.Options.ChildAdded:Connect(UpdateSize2)
			dropdowntemplate.Dropdown.Options.ChildRemoved:Connect(UpdateSize2)
			dropdowntemplate.Dropdown.Options.ChildAdded:Connect(UpdateSize)
			dropdowntemplate.Dropdown.Options.ChildRemoved:Connect(UpdateSize)
			local closed = true
			local db = false
			for i, v in pairs(dropdowntemplate.Dropdown.Options:GetChildren()) do
				if v:IsA'TextButton' then
					v.MouseButton1Click:Connect(function()
						dropdowntemplate.Dropdown.Text = v.Text
						func(v.Name)
						closed = true
						game.TweenService:Create(dropdowntemplate.Dropdown.Options, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							Size = UDim2.new(0, 264, 0, 0)
						}):Play()
						game.TweenService:Create(dropdowntemplate, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							Size = UDim2.new(0, 264, 0, 30)
						}):Play()
						game.TweenService:Create(dropdowntemplate.Dropdown.ImageButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							Rotation = 0
						}):Play()
						wait(.15)
						UpdateSize2()
						UpdateSize()
					end)
				end
			end
			dropdowntemplate.Dropdown.ImageButton.MouseButton1Click:Connect(function()
				if db == false then
					db = true
					closed = not closed
					if closed == false then
						game.TweenService:Create(dropdowntemplate.Dropdown.Options, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							Size = UDim2.new(0, 264, 0, size2)
						}):Play()
						game.TweenService:Create(dropdowntemplate.Dropdown.ImageButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							Rotation = 180
						}):Play()
						UpdateSize2()
						UpdateSize()
						local cS = tabtemplate.Objects.UIListLayout.AbsoluteContentSize
						game.TweenService:Create(dropdowntemplate, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							Size = UDim2.new(0, 264, 0, size)
						}):Play()
						wait(.15)
						UpdateSize2()
						UpdateSize()
					else
						game.TweenService:Create(dropdowntemplate.Dropdown.Options, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							Size = UDim2.new(0, 264, 0, 0)
						}):Play()
						game.TweenService:Create(dropdowntemplate, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							Size = UDim2.new(0, 264, 0, 30)
						}):Play()
						game.TweenService:Create(dropdowntemplate.Dropdown.ImageButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							Rotation = 0
						}):Play()
						wait(.15)
						UpdateSize2()
						UpdateSize()
					end
					db = false
				end
			end)

			local button = dropdowntemplate.Dropdown.ViewInfo
			button.MouseButton1Click:Connect(function()
				if destroyed == false then
					local background = windowtemplate:WaitForChild'Background'
					local infoframe = background:WaitForChild'InfoFrame'
					local notif = infoframe:WaitForChild'UINotification'
					local information = notif:WaitForChild'Information'
					information.Text = tostring(inf)
					game.TweenService:Create(infoframe, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 0.7
					}):Play()

					game.TweenService:Create(notif, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 0
					}):Play()

					game.TweenService:Create(information, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextTransparency = 0
					}):Play()

					wait(3.35)

					game.TweenService:Create(infoframe, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()

					game.TweenService:Create(notif, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()

					game.TweenService:Create(information, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextTransparency = 1
					}):Play()
				end
			end)

			function dropdown:AddOption(optionname)
				table.insert(options, optionname)
				-- Instances:

				local btntemplate = Instance.new("TextButton")
				local UICorner = Instance.new("UICorner")

				--Properties:

				btntemplate.Name = tostring(optionname)
				btntemplate.Text = tostring(optionname)
				btntemplate.Active = false
				btntemplate.BackgroundColor3 = theme.ElementColor
				btntemplate.Position = UDim2.new(0.137130082, 0, 0.26590538, 0)
				btntemplate.Selectable = false
				btntemplate.Size = UDim2.new(0, 264, 0, 30)
				btntemplate.AutoButtonColor = false
				btntemplate.Font = Enum.Font.Ubuntu
				btntemplate.TextColor3 = theme.TextColor
				btntemplate.TextSize = 20.000
				btntemplate.TextWrapped = true

				UICorner.CornerRadius = UDim.new(0, 6)
				UICorner.Parent = btntemplate

				btntemplate.Parent = dropdowntemplate.Dropdown.Options

				btntemplate.MouseButton1Click:Connect(function()
					dropdowntemplate.Dropdown.Text = btntemplate.Text
					func(btntemplate.Name)
					closed = true
					game.TweenService:Create(dropdowntemplate.Dropdown.Options, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						Size = UDim2.new(0, 264, 0, 0)
					}):Play()
					game.TweenService:Create(dropdowntemplate, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						Size = UDim2.new(0, 264, 0, 30)
					}):Play()
					game.TweenService:Create(dropdowntemplate.Dropdown.ImageButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						Rotation = 0
					}):Play()
					wait(.15)
					UpdateSize2()
					UpdateSize()
				end)
				setsize()
				UpdateSize2()
			end

			function dropdown:RemoveOption(optionname)
				if table.find(options, optionname) then
					local o = table.find(options, optionname)
					table.remove(options, o)
					dropdowntemplate.Dropdown.Options:FindFirstChild(optionname):Destroy()
					setsize()
					UpdateSize2()
				end
			end

			function dropdown:Remove()
				text = nil
				options = nil
				func = nil
				dropdowntemplate:Destroy()
				UpdateSize()
			end

			function dropdown:UpdateDropdown(texxt, infoo, optionz, funv)
				inf = infoo or 'Information'
				dropdowntemplate.Dropdown.Text = tostring(texxt)
				dropdowntemplate.Name = tostring(texxt)
				text = texxt
				options = optionz
				func = funv
				closed = true
				setsize()
				game.TweenService:Create(dropdowntemplate.Dropdown.Options, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					Size = UDim2.new(0, 264, 0, 0)
				}):Play()
				game.TweenService:Create(dropdowntemplate, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					Size = UDim2.new(0, 264, 0, 30)
				}):Play()
				game.TweenService:Create(dropdowntemplate.Dropdown.ImageButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					Rotation = 0
				}):Play()
				wait(.15)
				UpdateSize2()
				UpdateSize()
				for i, v in pairs(dropdowntemplate.Dropdown.Options:GetChildren()) do
					if v.Name ~= 'UIListLayout' then
						v:Destroy()
					end
				end
				-- Instances:

				local textlabeltemplate = Instance.new("TextLabel")
				local UICorner = Instance.new("UICorner")

				--Properties:

				textlabeltemplate.Name = text
				textlabeltemplate.BackgroundColor3 = theme.ElementColor
				textlabeltemplate.Position = UDim2.new(0.149748906, 0, 0.11745514, 0)
				textlabeltemplate.Size = UDim2.new(0, 264, 0, 30)
				textlabeltemplate.Font = Enum.Font.Ubuntu
				textlabeltemplate.Text = "Text"
				textlabeltemplate.TextColor3 = theme.TextColor
				textlabeltemplate.TextSize = 20.000
				textlabeltemplate.TextWrapped = true

				UICorner.CornerRadius = UDim.new(0, 6)
				UICorner.Parent = textlabeltemplate

				textlabeltemplate.Parent = dropdowntemplate.Dropdown.Options

				for i = 1, #options do
					-- Instances:

					local btntemplate = Instance.new("TextButton")
					local UICorner = Instance.new("UICorner")

					--Properties:

					btntemplate.Name = tostring(options[i])
					btntemplate.Text = tostring(options[i])
					btntemplate.Active = false
					btntemplate.BackgroundColor3 = theme.ElementColor
					btntemplate.Position = UDim2.new(0.137130082, 0, 0.26590538, 0)
					btntemplate.Selectable = false
					btntemplate.Size = UDim2.new(0, 264, 0, 30)
					btntemplate.AutoButtonColor = false
					btntemplate.Font = Enum.Font.Ubuntu
					btntemplate.TextColor3 = theme.TextColor
					btntemplate.TextSize = 20.000
					btntemplate.TextWrapped = true

					UICorner.CornerRadius = UDim.new(0, 6)
					UICorner.Parent = btntemplate

					btntemplate.Parent = dropdowntemplate.Dropdown.Options
				end
				for i, v in pairs(dropdowntemplate.Dropdown.Options:GetChildren()) do
					if v:IsA'TextButton' then
						v.MouseButton1Click:Connect(function()
							dropdowntemplate.Dropdown.Text = v.Text
							func(v.Name)
							closed = true
							game.TweenService:Create(dropdowntemplate.Dropdown.Options, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
								Size = UDim2.new(0, 264, 0, 0)
							}):Play()

							game.TweenService:Create(dropdowntemplate, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
								Size = UDim2.new(0, 264, 0, 30)
							}):Play()

							game.TweenService:Create(dropdowntemplate.Dropdown.ImageButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
								Rotation = 0
							}):Play()
							wait(.15)
							UpdateSize2()
							UpdateSize()
						end)
					end
				end
			end
			return dropdown
		end

		function tabs:AddTextButton(text, info, funct)
			local func = funct
			local inf = info or 'Information'
			local textbutton = {}
			table.insert(textbutton, text)


			-- Instances:

			local textbuttontemplate = Instance.new("TextButton")
			local UICorner = Instance.new("UICorner")
			local ViewInfo = Instance.new("ImageButton")

			--Properties:

			textbuttontemplate.Name = tostring(text)
			textbuttontemplate.Active = false
			textbuttontemplate.BackgroundColor3 = theme.ElementColor
			textbuttontemplate.Position = UDim2.new(0.137130082, 0, 0.26590538, 0)
			textbuttontemplate.Selectable = false
			textbuttontemplate.Size = UDim2.new(0, 264, 0, 30)
			textbuttontemplate.AutoButtonColor = false
			textbuttontemplate.Font = Enum.Font.Ubuntu
			textbuttontemplate.Text = tostring(text)
			textbuttontemplate.TextColor3 = theme.TextColor
			textbuttontemplate.TextSize = 20.000
			textbuttontemplate.TextWrapped = true

			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = textbuttontemplate

			ViewInfo.Name = "ViewInfo"
			ViewInfo.Parent = textbuttontemplate
			ViewInfo.AnchorPoint = Vector2.new(1, 0.5)
			ViewInfo.BackgroundColor3 = theme.TextColor
			ViewInfo.BackgroundTransparency = 1.000
			ViewInfo.Position = UDim2.new(1, 0, 0.5, 0)
			ViewInfo.Size = UDim2.new(0, 28, 0, 28)
			ViewInfo.Image = "http://www.roblox.com/asset/?id=10215364479"
			ViewInfo.ImageColor3 = theme.ImageColor

			textbuttontemplate.Parent = tabtemplate.Objects


			UpdateSize()
			textbuttontemplate.MouseButton1Click:Connect(function()
				func()
			end)
			enableripple(textbuttontemplate)

			local button = textbuttontemplate.ViewInfo
			button.MouseButton1Click:Connect(function()
				if destroyed == false then
					local background = windowtemplate:WaitForChild'Background'
					local infoframe = background:WaitForChild'InfoFrame'
					local notif = infoframe:WaitForChild'UINotification'
					local information = notif:WaitForChild'Information'
					information.Text = tostring(inf)
					game.TweenService:Create(infoframe, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 0.7
					}):Play()

					game.TweenService:Create(notif, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 0
					}):Play()

					game.TweenService:Create(information, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextTransparency = 0
					}):Play()

					wait(3.35)

					game.TweenService:Create(infoframe, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()

					game.TweenService:Create(notif, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()

					game.TweenService:Create(information, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextTransparency = 1
					}):Play()
				end
			end)

			function textbutton:Remove()
				func = nil
				textbuttontemplate:Destroy()
				UpdateSize()
			end

			function textbutton:UpdateTextButton(texxt, infoo, funcc)
				inf = infoo or 'Information'
				textbuttontemplate.Text = tostring(texxt)
				textbuttontemplate.Name = tostring(texxt)
				func = funcc
			end
			return textbutton
		end


		function tabs:AddSlider(texxt, info, minvalue, maxvalue, callback)
			local slider = {}
			table.insert(slider, texxt)

			local inf = info or 'Information'

			-- Instances:

			local slidertemplate = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local sliderBtn = Instance.new("TextButton")
			local sliderDrag = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local UICorner_3 = Instance.new("UICorner")
			local val = Instance.new("TextLabel")
			local SliderText = Instance.new("TextLabel")
			local UICorner_4 = Instance.new("UICorner")
			local ViewInfo = Instance.new("ImageButton")

			--Properties:

			slidertemplate.Name = tostring(texxt)
			slidertemplate.BackgroundColor3 = theme.ElementColor
			slidertemplate.Position = UDim2.new(0.149760097, 0, 0.56606853, 0)
			slidertemplate.Size = UDim2.new(0, 264, 0, 30)

			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = slidertemplate

			sliderBtn.Name = "sliderBtn"
			sliderBtn.Parent = slidertemplate
			sliderBtn.AnchorPoint = Vector2.new(1, 0.5)
			sliderBtn.BackgroundColor3 = theme.TabColor
			sliderBtn.BorderSizePixel = 0
			sliderBtn.Position = UDim2.new(0.92279774, 0, 0.466666669, 0)
			sliderBtn.Size = UDim2.new(0, 95, 0, 7)
			sliderBtn.AutoButtonColor = false
			sliderBtn.Font = Enum.Font.SourceSans
			sliderBtn.Text = ""
			sliderBtn.TextColor3 = theme.ElementColor
			sliderBtn.TextSize = 14.000

			sliderDrag.Name = "sliderDrag"
			sliderDrag.Parent = sliderBtn
			sliderDrag.BackgroundColor3 = theme.ImageColor
			sliderDrag.BorderColor3 = Color3.fromRGB(74, 99, 135)
			sliderDrag.BorderSizePixel = 0
			sliderDrag.Size = UDim2.new(0, 30, 0, 7)

			UICorner_2.Parent = sliderDrag

			UICorner_3.Parent = sliderBtn

			val.Name = "val"
			val.Parent = slidertemplate
			val.BackgroundColor3 = theme.TextColor
			val.BackgroundTransparency = 1.000
			val.BorderSizePixel = 0
			val.Position = UDim2.new(0.428224057, 0, 0.233333349, 0)
			val.Size = UDim2.new(0, 30, 0, 16)
			val.Font = Enum.Font.GothamMedium
			val.Text = "92"
			val.TextColor3 = theme.TextColor
			val.TextScaled = true
			val.TextSize = 14.000
			val.TextTransparency = 1.000
			val.TextWrapped = true
			val.TextXAlignment = Enum.TextXAlignment.Right

			SliderText.Name = 'SliderText'
			SliderText.Parent = slidertemplate
			SliderText.BackgroundColor3 = theme.TabColor
			SliderText.BackgroundTransparency = 1.000
			SliderText.Position = UDim2.new(0.0418604054, 0, 0.100000001, 0)
			SliderText.Size = UDim2.new(0, 102, 0, 23)
			SliderText.Font = Enum.Font.GothamMedium
			SliderText.Text = tostring(texxt)
			SliderText.TextColor3 = theme.TextColor
			SliderText.TextScaled = true
			SliderText.TextSize = 14.000
			SliderText.TextWrapped = true

			UICorner_4.Parent = SliderText

			ViewInfo.Name = "ViewInfo"
			ViewInfo.Parent = slidertemplate
			ViewInfo.AnchorPoint = Vector2.new(1, 0.5)
			ViewInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ViewInfo.BackgroundTransparency = 1.000
			ViewInfo.Position = UDim2.new(1, 0, 0.5, 0)
			ViewInfo.Size = UDim2.new(0, 28, 0, 28)
			ViewInfo.Image = "http://www.roblox.com/asset/?id=10215364479"
			ViewInfo.ImageColor3 = theme.ImageColor

			slidertemplate.Parent = tabtemplate.Objects

			UpdateSize()

			local size = 95
			local focusing = false
			local Utility = {}

			local tween = game:GetService("TweenService")
			local tweeninfo = TweenInfo.new

			function Utility:TweenObject(obj, properties, duration, ...)
				tween:Create(obj, tweeninfo(duration, ...), properties):Play()
			end

			local mouse = game:GetService("Players").LocalPlayer:GetMouse();

			local ms = game.Players.LocalPlayer:GetMouse()
			local uis = game:GetService("UserInputService")
			local hovering = false

			local sliderBtn = slidertemplate:WaitForChild('sliderBtn')
			local val = slidertemplate:WaitForChild('val')
			local sliderDrag = sliderBtn:WaitForChild('sliderDrag')

			local releaseconnection
			local moveconnection

			local Value
			sliderBtn.MouseButton1Down:Connect(function()
				if not focusing then
					pcall(function()
						game.TweenService:Create(val, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							TextTransparency = 0
						}):Play()
						Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / size) * sliderDrag.AbsoluteSize.X) + tonumber(minvalue)) or 0
						pcall(function()
							callback(Value)
						end)
						pcall(function()
							sliderDrag:TweenSize(UDim2.new(0, math.clamp(mouse.X - sliderDrag.AbsolutePosition.X, 0, size), 0, 7), "InOut", "Linear", 0.05, true)
						end)
						moveconnection = mouse.Move:Connect(function()
							val.Text = Value
							Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / size) * sliderDrag.AbsoluteSize.X) + tonumber(minvalue))
							pcall(function()
								callback(Value)
							end)
							pcall(function()
								sliderDrag:TweenSize(UDim2.new(0, math.clamp(mouse.X - sliderDrag.AbsolutePosition.X, 0, size), 0, 7), "InOut", "Linear", 0.05, true)
							end)
						end)
						releaseconnection = uis.InputEnded:Connect(function(Mouse)
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch then
								Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / size) * sliderDrag.AbsoluteSize.X) + tonumber(minvalue))
								pcall(function()
									callback(Value)
								end)
								val.Text = Value
								game.TweenService:Create(val, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
									TextTransparency = 1
								}):Play()
								pcall(function()
									sliderDrag:TweenSize(UDim2.new(0, math.clamp(mouse.X - sliderDrag.AbsolutePosition.X, 0, size), 0, 7), "InOut", "Linear", 0.05, true)
								end)
								moveconnection:Disconnect()
								releaseconnection:Disconnect()
							end
						end)
					end)

				end
			end)

			local button = slidertemplate.ViewInfo
			button.MouseButton1Click:Connect(function()
				if destroyed == false then
					local background = windowtemplate:WaitForChild'Background'
					local infoframe = background:WaitForChild'InfoFrame'
					local notif = infoframe:WaitForChild'UINotification'
					local information = notif:WaitForChild'Information'
					information.Text = tostring(inf)
					game.TweenService:Create(infoframe, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 0.7
					}):Play()

					game.TweenService:Create(notif, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 0
					}):Play()

					game.TweenService:Create(information, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextTransparency = 0
					}):Play()

					wait(3.35)

					game.TweenService:Create(infoframe, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()

					game.TweenService:Create(notif, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()

					game.TweenService:Create(information, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextTransparency = 1
					}):Play()
				end
			end)

			function slider:Remove()
				callback = nil
				slidertemplate:Destroy()
				UpdateSize()
			end
			function slider:UpdateSlider(text, infoo, min, max, callbackk)
				inf = infoo or 'Information'
				minvalue = min
				maxvalue = max
				callback = callbackk
				slidertemplate.Name = tostring(text)
				slidertemplate:WaitForChild('SliderText').Text = tostring(text)
			end
			return slider
		end

		function tabs:AddTextBox(text, info, defaulttext, func)
			local inf = info or 'Information'
			local funv = func
			local textbox = {}
			table.insert(textbox, text)
			-- Instances:

			local textboxtemplate = Instance.new("Frame")
			local ViewInfo = Instance.new("ImageButton")
			local UICorner = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")
			local UICorner_2 = Instance.new("UICorner")
			local TextBox = Instance.new("TextBox")
			local UICorner_3 = Instance.new("UICorner")
			local UICorner_4 = Instance.new("UICorner")

			--Properties:

			textboxtemplate.Name = tostring(text)
			textboxtemplate.BackgroundColor3 = theme.ElementColor
			textboxtemplate.Size = UDim2.new(0, 264, 0, 30)

			ViewInfo.Name = "ViewInfo"
			ViewInfo.Parent = textboxtemplate
			ViewInfo.AnchorPoint = Vector2.new(1, 0.5)
			ViewInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ViewInfo.BackgroundTransparency = 1.000
			ViewInfo.Position = UDim2.new(1, 0, 0.5, 0)
			ViewInfo.Size = UDim2.new(0, 28, 0, 28)
			ViewInfo.Image = "http://www.roblox.com/asset/?id=10215364479"
			ViewInfo.ImageColor3 = theme.ImageColor

			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = textboxtemplate

			TextLabel.Parent = textboxtemplate
			TextLabel.BackgroundColor3 = theme.ElementColor
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.Position = UDim2.new(0.0265151523, 0, 0.13333334, 0)
			TextLabel.Size = UDim2.new(0, 121, 0, 22)
			TextLabel.Font = Enum.Font.Ubuntu
			TextLabel.Text = tostring(text)
			TextLabel.TextColor3 = theme.TextColor
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true

			UICorner_2.CornerRadius = UDim.new(0, 6)
			UICorner_2.Parent = TextLabel

			TextBox.Parent = textboxtemplate
			TextBox.BackgroundColor3 = theme.WindowColor
			TextBox.Position = UDim2.new(0.515212119, 0, 0.13333334, 0)
			TextBox.Selectable = false
			TextBox.Size = UDim2.new(0, 99, 0, 22)
			TextBox.ClearTextOnFocus = false
			TextBox.Font = Enum.Font.Ubuntu
			TextBox.PlaceholderColor3 = Color3.fromRGB(theme.TextColor.R-20, theme.TextColor.G-20, theme.TextColor.B-20)
			TextBox.PlaceholderText = tostring(defaulttext)
			TextBox.Text = ""
			TextBox.TextColor3 = theme.TextColor
			TextBox.TextScaled = true
			TextBox.TextSize = 14.000
			TextBox.TextWrapped = true

			UICorner_3.CornerRadius = UDim.new(0, 6)
			UICorner_3.Parent = TextBox

			UICorner_4.CornerRadius = UDim.new(0, 6)
			UICorner_4.Parent = TextBox

			textboxtemplate.Position = UDim2.new(0.149748906, 0, 0.11745514, 0)

			textboxtemplate.Parent = tabtemplate.Objects

			UpdateSize()

			textboxtemplate.TextBox.FocusLost:Connect(function()
				funv(textboxtemplate.TextBox.Text)
			end)

			local button = textboxtemplate.ViewInfo
			button.MouseButton1Click:Connect(function()
				if destroyed == false then
					local background = windowtemplate:WaitForChild'Background'
					local infoframe = background:WaitForChild'InfoFrame'
					local notif = infoframe:WaitForChild'UINotification'
					local information = notif:WaitForChild'Information'
					information.Text = tostring(inf)
					game.TweenService:Create(infoframe, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 0.7
					}):Play()

					game.TweenService:Create(notif, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 0
					}):Play()

					game.TweenService:Create(information, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextTransparency = 0
					}):Play()

					wait(3.35)

					game.TweenService:Create(infoframe, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()

					game.TweenService:Create(notif, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()

					game.TweenService:Create(information, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextTransparency = 1
					}):Play()
				end
			end)

			function textbox:UpdateTextBox(texxt, infoo, defaulttextt, funcc)
				funv = funcc
				textboxtemplate.Name = tostring(texxt)
				textboxtemplate.TextLabel.Text = tostring(texxt)
				textboxtemplate.TextBox.Text = ''
				textboxtemplate.TextBox.PlaceholderText = tostring(defaulttextt)
				inf = infoo or 'Information'
			end
			function textbox:Remove()
				funv = function() end
				textboxtemplate:Destroy()
				UpdateSize()
			end
			return textbox
		end

		function tabs:AddToggle(text, info, func)
			local toggle = {}
			table.insert(toggle, text)

			local inf = info or 'Information'
			-- Instances:

			local toggletemplate = Instance.new("Frame")
			local ViewInfo = Instance.new("ImageButton")
			local UICorner = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")
			local UICorner_2 = Instance.new("UICorner")
			local Toggle = Instance.new("ImageLabel")
			local Square = Instance.new("ImageButton")

			--Properties:

			toggletemplate.Name = tostring(text)
			toggletemplate.BackgroundColor3 = theme.ElementColor
			toggletemplate.Position = UDim2.new(0.149748906, 0, 0.11745514, 0)
			toggletemplate.Size = UDim2.new(0, 264, 0, 30)

			ViewInfo.Name = "ViewInfo"
			ViewInfo.Parent = toggletemplate
			ViewInfo.AnchorPoint = Vector2.new(1, 0.5)
			ViewInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ViewInfo.BackgroundTransparency = 1.000
			ViewInfo.Position = UDim2.new(1, 0, 0.5, 0)
			ViewInfo.Size = UDim2.new(0, 28, 0, 28)
			ViewInfo.Image = "http://www.roblox.com/asset/?id=10215364479"
			ViewInfo.ImageColor3 = theme.ImageColor

			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = toggletemplate

			TextLabel.Parent = toggletemplate
			TextLabel.BackgroundColor3 = theme.ElementColor
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.Position = UDim2.new(0.0265151523, 0, 0.13333334, 0)
			TextLabel.Size = UDim2.new(0, 121, 0, 22)
			TextLabel.Font = Enum.Font.Ubuntu
			TextLabel.Text = tostring(text)
			TextLabel.TextColor3 = theme.TextColor
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true

			UICorner_2.CornerRadius = UDim.new(0, 6)
			UICorner_2.Parent = TextLabel

			Toggle.Name = "Toggle"
			Toggle.Parent = toggletemplate
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.BackgroundTransparency = 1.000
			Toggle.Position = UDim2.new(0.8075068, 0, -0.0151515156, 0)
			Toggle.Size = UDim2.new(0, 30, 0, 30)
			Toggle.Image = "http://www.roblox.com/asset/?id=10221080526"
			Toggle.ImageColor3 = theme.ImageColor

			Square.Name = "Square"
			Square.Parent = toggletemplate
			Square.Active = false
			Square.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Square.BackgroundTransparency = 1.000
			Square.Position = UDim2.new(0.8075068, 0, -0.0151515156, 0)
			Square.Selectable = false
			Square.Size = UDim2.new(0, 30, 0, 30)
			Square.AutoButtonColor = false
			Square.Image = "http://www.roblox.com/asset/?id=10221047499"
			Square.ImageColor3 = theme.ImageColor

			toggletemplate.Parent = tabtemplate.Objects

			UpdateSize()
			local funv = func
			local square = toggletemplate:WaitForChild('Square')
			local toggled = true
			local tdb = false
			square.MouseButton1Click:Connect(function()
				if tdb == false then
					tdb = true
					toggled = not toggled
					funv(toggled)
					if toggled == false then
						game.TweenService:Create(square, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							ImageTransparency = 1
						}):Play()
						wait(.35)
						tdb = false
					else
						game.TweenService:Create(square, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							ImageTransparency = 0
						}):Play()
						wait(.35)
						tdb = false
					end
				end
			end)

			local button = toggletemplate.ViewInfo
			button.MouseButton1Click:Connect(function()
				if destroyed == false then
					local background = windowtemplate:WaitForChild'Background'
					local infoframe = background:WaitForChild'InfoFrame'
					local notif = infoframe:WaitForChild'UINotification'
					local information = notif:WaitForChild'Information'
					information.Text = tostring(inf)
					game.TweenService:Create(infoframe, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 0.7
					}):Play()

					game.TweenService:Create(notif, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 0
					}):Play()

					game.TweenService:Create(information, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextTransparency = 0
					}):Play()

					wait(3.35)

					game.TweenService:Create(infoframe, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()

					game.TweenService:Create(notif, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()

					game.TweenService:Create(information, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextTransparency = 1
					}):Play()
				end
			end)

			function toggle:UpdateToggle(textt, infoo, funcc)
				inf = infoo or 'Information'
				funv = funcc
				toggletemplate.Name = tostring(textt)
				toggletemplate:WaitForChild('TextLabel').Text = tostring(textt)
			end
			function toggle:Remove()
				funv = function() end
				toggletemplate:Destroy()
				UpdateSize()
			end
			return toggle
		end

		function tabs:AddKeybind(text, info, startKey, func)
			local keybind = {}
			table.insert(keybind, text)
			local funv = func
			local inf = info or 'Information'
			local key

			if #startKey < 2 then
				key = startKey:upper()
			else
				key = startKey
			end


			-- Instances:

			local keybindtemplate = Instance.new("Frame")
			local ViewInfo = Instance.new("ImageButton")
			local UICorner = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")
			local UICorner_2 = Instance.new("UICorner")
			local Keybind = Instance.new("TextButton")
			local UICorner_3 = Instance.new("UICorner")

			--Properties:

			keybindtemplate.Name = tostring(text)
			keybindtemplate.BackgroundColor3 = theme.ElementColor
			keybindtemplate.Position = UDim2.new(0.149748906, 0, 0.11745514, 0)
			keybindtemplate.Size = UDim2.new(0, 264, 0, 30)

			ViewInfo.Name = "ViewInfo"
			ViewInfo.Parent = keybindtemplate
			ViewInfo.AnchorPoint = Vector2.new(1, 0.5)
			ViewInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ViewInfo.BackgroundTransparency = 1.000
			ViewInfo.Position = UDim2.new(1, 0, 0.5, 0)
			ViewInfo.Size = UDim2.new(0, 28, 0, 28)
			ViewInfo.Image = "http://www.roblox.com/asset/?id=10215364479"
			ViewInfo.ImageColor3 = theme.ImageColor

			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = keybindtemplate

			TextLabel.Parent = keybindtemplate
			TextLabel.BackgroundColor3 = theme.ElementColor
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.Position = UDim2.new(0.0265151523, 0, 0.13333334, 0)
			TextLabel.Size = UDim2.new(0, 154, 0, 22)
			TextLabel.Font = Enum.Font.Ubuntu
			TextLabel.Text = tostring(text)
			TextLabel.TextColor3 = theme.TextColor
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true

			UICorner_2.CornerRadius = UDim.new(0, 6)
			UICorner_2.Parent = TextLabel

			Keybind.Name = 'Keybind'
			Keybind.Parent = keybindtemplate
			Keybind.Active = false
			Keybind.BackgroundColor3 = theme.ElementColor
			Keybind.BackgroundTransparency = 1.000
			Keybind.Position = UDim2.new(0.704545498, 0, 0.13333334, 0)
			Keybind.Selectable = false
			Keybind.Size = UDim2.new(0, 59, 0, 22)
			Keybind.Font = Enum.Font.Ubuntu
			Keybind.Text = tostring(key)
			Keybind.TextColor3 = theme.TextColor
			Keybind.TextScaled = true
			Keybind.TextSize = 14.000
			Keybind.TextWrapped = true

			UICorner_3.CornerRadius = UDim.new(0, 6)
			UICorner_3.Parent = Keybind

			keybindtemplate.Parent = tabtemplate.Objects


			UpdateSize()
			local uis = game:GetService('UserInputService')

			local choosing = false

			keybindtemplate.Keybind.MouseButton1Click:Connect(function()
				keybindtemplate.Keybind.Text = '. . .'
				local oldkey = key
				key = ''
				choosing = true
				local input = uis.InputBegan:Wait()
				if input.KeyCode.Name ~= 'Unknown' and input.UserInputType == Enum.UserInputType.Keyboard then
					if #input.KeyCode.Name < 2 then
						keybindtemplate.Keybind.Text = input.KeyCode.Name:upper()
						key = input.KeyCode.Name:upper()
					else
						keybindtemplate.Keybind.Text = input.KeyCode.Name
						key = input.KeyCode.Name
					end
				else
					if #key < 2 then
						key = oldkey:upper()
						keybindtemplate.Keybind.Text = key:upper()
					else
						key = oldkey
						keybindtemplate.Keybind.Text = key
					end
				end
				wait()
				choosing = false
			end)

			uis.InputBegan:Connect(function(input, gameProcessed)
				if not gameProcessed and choosing == false then
					if input.KeyCode.Name:upper() == key:upper() then
						funv(key)
					end
				end
			end)

			local button = keybindtemplate.ViewInfo
			button.MouseButton1Click:Connect(function()
				if destroyed == false then
					local background = windowtemplate:WaitForChild'Background'
					local infoframe = background:WaitForChild'InfoFrame'
					local notif = infoframe:WaitForChild'UINotification'
					local information = notif:WaitForChild'Information'
					information.Text = tostring(inf)
					game.TweenService:Create(infoframe, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 0.7
					}):Play()

					game.TweenService:Create(notif, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 0
					}):Play()

					game.TweenService:Create(information, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextTransparency = 0
					}):Play()

					wait(3.35)

					game.TweenService:Create(infoframe, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()

					game.TweenService:Create(notif, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()

					game.TweenService:Create(information, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextTransparency = 1
					}):Play()
				end
			end)

			function keybind:UpdateKeybind(textt, infoo, startKeyy, funcc)
				inf = infoo or 'Information'
				if #startKeyy < 2 then
					key = startKeyy:upper()
				else
					key = startKeyy
				end
				keybindtemplate.Keybind.Text = key
				funv = funcc
			end

			function keybind:Remove()
				keybindtemplate:Destroy()
				key = ''
				funv = function() end
				UpdateSize()
			end
			return keybind
		end

		function tabs:AddColorPicker(text, info, defaultcolor, func)

			if text == 'Background' then
				print('Please choose another name for your color picker, "'..text..'".')
			end

			local colorpicker = {}
			table.insert(colorpicker, text)
			local funv = func
			local inf = info or 'Information'

			-- Instances:

			local sgui = Instance.new'ScreenGui'
			local colorpickertemplate = Instance.new("Frame")
			local Background = Instance.new("ImageLabel")
			local Background_2 = Instance.new("ImageLabel")
			local Preview = Instance.new("ImageLabel")
			local RGB = Instance.new("ImageLabel")
			local Marker = Instance.new("Frame")
			local Value = Instance.new("ImageLabel")
			local Marker_2 = Instance.new("Frame")
			local Apply = Instance.new("TextButton")
			local UICorner = Instance.new("UICorner")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local Cancel = Instance.new("TextButton")
			local UICorner_2 = Instance.new("UICorner")
			local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")

			--Properties:

			sgui.Name = tostring(text)
			sgui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

			colorpickertemplate.Name = 'ColorPicker'
			colorpickertemplate.Parent = sgui
			colorpickertemplate.AnchorPoint = Vector2.new(0.5, 0.5)
			colorpickertemplate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			colorpickertemplate.BackgroundTransparency = 1.000
			colorpickertemplate.Position = UDim2.new(0.5, 0, 0.5, 0)
			colorpickertemplate.Size = UDim2.new(0.25, 0, 0.25, 0)
			colorpickertemplate.SizeConstraint = Enum.SizeConstraint.RelativeXX
			colorpickertemplate.Visible = false

			Background.Name = "Background"
			Background.Parent = colorpickertemplate
			Background.AnchorPoint = Vector2.new(0.5, 0.5)
			Background.BackgroundColor3 = theme.TabColor
			Background.BackgroundTransparency = 1.000
			Background.BorderColor3 = Color3.fromRGB(208, 205, 205)
			Background.Position = UDim2.new(0.421225369, 0, 0.322027773, 0)
			Background.Size = UDim2.new(0.854121089, 0, 0.649890661, 0)
			Background.ZIndex = 4
			Background.Image = "rbxassetid://399416860"
			Background.ImageColor3 = theme.WindowColor
			Background.ScaleType = Enum.ScaleType.Slice
			Background.SliceCenter = Rect.new(10, 10, 90, 90)

			Background_2.Name = "Background"
			Background_2.Parent = Background
			Background_2.AnchorPoint = Vector2.new(0.5, 0.5)
			Background_2.BackgroundColor3 = theme.TabColor
			Background_2.BackgroundTransparency = 1.000
			Background_2.Position = UDim2.new(0.5, 0, 0.5, 0)
			Background_2.Size = UDim2.new(1, 4, 1, 4)
			Background_2.ZIndex = 3
			Background_2.Image = "rbxassetid://399416860"
			Background_2.ImageColor3 = theme.WindowColor
			Background_2.ScaleType = Enum.ScaleType.Slice
			Background_2.SliceCenter = Rect.new(10, 10, 90, 90)

			Preview.Name = "Preview"
			Preview.Parent = colorpickertemplate
			Preview.AnchorPoint = Vector2.new(0.5, 0)
			Preview.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Preview.BorderColor3 = Color3.fromRGB(40, 40, 40)
			Preview.BorderSizePixel = 0
			Preview.Position = UDim2.new(0.341702729, 0, 0.505378783, 0)
			Preview.Size = UDim2.new(0.470022023, 0, 0.0795769468, 0)
			Preview.ZIndex = 4
			Preview.SliceCenter = Rect.new(10, 10, 90, 90)

			RGB.Name = "RGB"
			RGB.Parent = colorpickertemplate
			RGB.AnchorPoint = Vector2.new(0.5, 0)
			RGB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			RGB.BorderColor3 = Color3.fromRGB(40, 40, 40)
			RGB.BorderSizePixel = 0
			RGB.Position = UDim2.new(0.338730782, 0, 0.0533187278, 0)
			RGB.Size = UDim2.new(0.470021904, 0, 0.400000006, 0)
			RGB.ZIndex = 4
			RGB.Image = "rbxassetid://1433361550"
			RGB.SliceCenter = Rect.new(10, 10, 90, 90)

			Marker.Name = "Marker"
			Marker.Parent = RGB
			Marker.AnchorPoint = Vector2.new(0.5, 0.5)
			Marker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Marker.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Marker.BorderSizePixel = 2
			Marker.Position = UDim2.new(0.0350000001, 0, 0.0370000005, 0)
			Marker.Size = UDim2.new(0, 5, 0, 5)
			Marker.ZIndex = 5

			Value.Name = "Value"
			Value.Parent = colorpickertemplate
			Value.AnchorPoint = Vector2.new(0.5, 0)
			Value.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Value.BorderColor3 = Color3.fromRGB(40, 40, 40)
			Value.BorderSizePixel = 0
			Value.Position = UDim2.new(0.715791404, 0, 0.0533187464, 0)
			Value.Size = UDim2.new(0.0700000003, 0, 0.400000006, 0)
			Value.ZIndex = 4
			Value.Image = "rbxassetid://359311684"
			Value.SliceCenter = Rect.new(10, 10, 90, 90)

			Marker_2.Name = "Marker"
			Marker_2.Parent = Value
			Marker_2.AnchorPoint = Vector2.new(0.5, 0.5)
			Marker_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Marker_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Marker_2.BorderSizePixel = 2
			Marker_2.Position = UDim2.new(0.5, 0, 0, 0)
			Marker_2.Size = UDim2.new(1, 4, 0, 4)
			Marker_2.ZIndex = 5

			Apply.Name = "Apply"
			Apply.Parent = colorpickertemplate:FindFirstChild('Background')
			Apply.BackgroundColor3 = theme.ElementColor
			Apply.Position = UDim2.new(0.71, 0, 0.723, 0)
			Apply.Size = UDim2.new(0.272978514, 0, 0.0978444442, 0)
			Apply.ZIndex = 5
			Apply.Font = Enum.Font.Ubuntu
			Apply.Text = "Apply"
			Apply.TextColor3 = Color3.fromRGB(255, 255, 255)
			Apply.TextSize = 20.000
			Apply.TextScaled = true
			Apply.TextWrapped = true
			Apply.AutoButtonColor = false
			
			enableripple(Apply)

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = Apply

			UIAspectRatioConstraint.Parent = Apply
			UIAspectRatioConstraint.AspectRatio = 3.667

			Cancel.Name = "Cancel"
			Cancel.Parent = colorpickertemplate:FindFirstChild('Background')
			Cancel.BackgroundColor3 = theme.ElementColor
			Cancel.Position = UDim2.new(0.707, 0, 0.834, 0)
			Cancel.Size = UDim2.new(0.272978514, 0, 0.0978444442, 0)
			Cancel.ZIndex = 5
			Cancel.Font = Enum.Font.Ubuntu
			Cancel.Text = "Cancel"
			Cancel.TextColor3 = Color3.fromRGB(255, 255, 255)
			Cancel.TextSize = 20.000
			Cancel.TextScaled = true
			Cancel.TextWrapped = true
			Cancel.AutoButtonColor = false
			
			enableripple(Cancel)
			
			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = Cancel

			UIAspectRatioConstraint_2.Parent = Cancel
			UIAspectRatioConstraint_2.AspectRatio = 3.667

			sgui.Parent = windowtemplate



			-- Instances:

			local colorpickerbuttontemplate = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")
			local ColorButton = Instance.new("TextButton")
			local UICorner_2 = Instance.new("UICorner")
			local ViewInfo = Instance.new("ImageButton")

			--Properties:

			colorpickerbuttontemplate.Name = tostring(text)
			colorpickerbuttontemplate.BackgroundColor3 = theme.ElementColor
			colorpickerbuttontemplate.Position = UDim2.new(0.149748906, 0, 0.314845026, 0)
			colorpickerbuttontemplate.Size = UDim2.new(0, 264, 0, 30)

			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = colorpickerbuttontemplate

			TextLabel.Parent = colorpickerbuttontemplate
			TextLabel.BackgroundColor3 = theme.ElementColor
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.Position = UDim2.new(0.0530303046, 0, 0.13333334, 0)
			TextLabel.Size = UDim2.new(0, 165, 0, 22)
			TextLabel.Font = Enum.Font.Ubuntu
			TextLabel.Text = tostring(text)
			TextLabel.TextColor3 = theme.TextColor
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true

			ColorButton.Name = "ColorButton"
			ColorButton.Parent = colorpickerbuttontemplate
			ColorButton.Active = false
			ColorButton.BackgroundColor3 = defaultcolor
			ColorButton.Position = UDim2.new(0.723484814, 0, 0.233333334, 0)
			ColorButton.Selectable = false
			ColorButton.Size = UDim2.new(0, 52, 0, 16)
			ColorButton.AutoButtonColor = false
			ColorButton.Text = ""

			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = ColorButton

			ViewInfo.Name = "ViewInfo"
			ViewInfo.Parent = colorpickerbuttontemplate
			ViewInfo.AnchorPoint = Vector2.new(1, 0.5)
			ViewInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ViewInfo.BackgroundTransparency = 1.000
			ViewInfo.Position = UDim2.new(1, 0, 0.5, 0)
			ViewInfo.Size = UDim2.new(0, 28, 0, 28)
			ViewInfo.Image = "http://www.roblox.com/asset/?id=10215364479"
			ViewInfo.ImageColor3 = theme.ImageColor

			colorpickerbuttontemplate.Parent = tabtemplate.Objects


			enableripple(colorpickerbuttontemplate.ColorButton)
			UpdateSize()
			local player = game.Players.LocalPlayer
			local mouse = player:GetMouse()
			local rgb = colorpickertemplate:WaitForChild("RGB")
			local value = colorpickertemplate:WaitForChild("Value")
			local preview = colorpickertemplate:WaitForChild("Preview")
			local selectedColor = Color3.fromHSV(1,1,1)
			local colorData = {1,1,1}
			local mouse1down = false
			local function setColor(hue,sat,val)
				colorData = {hue or colorData[1],sat or colorData[2],val or colorData[3]}
				selectedColor = Color3.fromHSV(colorData[1],colorData[2],colorData[3])
				preview.BackgroundColor3 = selectedColor
				value.ImageColor3 = Color3.fromHSV(colorData[1],colorData[2],1)
			end
			local function inBounds(frame)
				local x,y = mouse.X - frame.AbsolutePosition.X,mouse.Y - frame.AbsolutePosition.Y
				local maxX,maxY = frame.AbsoluteSize.X,frame.AbsoluteSize.Y
				if x >= 0 and y >= 0 and x <= maxX and y <= maxY then
					return x/maxX,y/maxY
				end
			end
			local function updateRGB()
				if mouse1down then
					local x,y = inBounds(rgb)
					if x and y then
						rgb:WaitForChild("Marker").Position = UDim2.new(x,0,y,0)
						setColor(1 - x,1 - y)
					end
					local x,y = inBounds(value)
					if x and y then
						value:WaitForChild("Marker").Position = UDim2.new(0.5,0,y,0)
						setColor(nil,nil,1 - y)
					end
				end
			end
			mouse.Move:connect(updateRGB)
			mouse.Button1Down:connect(function()mouse1down = true end)
			mouse.Button1Up:connect(function()mouse1down = false end)
			colorpickerbuttontemplate.ColorButton.MouseButton1Click:Connect(function()
				colorpickertemplate.Visible = true
			end)			
			colorpickertemplate:WaitForChild('Background'):WaitForChild('Apply').MouseButton1Click:Connect(function()
				funv(colorpickertemplate:WaitForChild('Preview').BackgroundColor3)
				colorpickerbuttontemplate.ColorButton.BackgroundColor3 = colorpickertemplate:WaitForChild('Preview').BackgroundColor3
				colorpickertemplate.Visible = false
			end)			
			colorpickertemplate:WaitForChild('Background'):WaitForChild('Cancel').MouseButton1Click:Connect(function()
				colorpickertemplate.Visible = false
			end)

			local button = colorpickerbuttontemplate.ViewInfo
			button.MouseButton1Click:Connect(function()
				if destroyed == false then
					local background = windowtemplate:WaitForChild'Background'
					local infoframe = background:WaitForChild'InfoFrame'
					local notif = infoframe:WaitForChild'UINotification'
					local information = notif:WaitForChild'Information'
					information.Text = tostring(inf)
					game.TweenService:Create(infoframe, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 0.7
					}):Play()

					game.TweenService:Create(notif, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 0
					}):Play()

					game.TweenService:Create(information, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextTransparency = 0
					}):Play()

					wait(3.35)

					game.TweenService:Create(infoframe, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()

					game.TweenService:Create(notif, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()

					game.TweenService:Create(information, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextTransparency = 1
					}):Play()
				end
			end)

			function colorpicker:UpdateColorPicker(texxt, infoo, defaultcolor, func)
				inf = infoo or 'Information'
				colorpickertemplate.Name = tostring(texxt)
				colorpickerbuttontemplate.Name = tostring(texxt)
				colorpickerbuttontemplate.TextLabel.Text = tostring(texxt)
				funv = func
				colorpickerbuttontemplate.ColorButton.BackgroundColor3 = defaultcolor
			end

			function colorpicker:Remove()
				funv = function() end
				colorpickertemplate:Destroy()
				colorpickerbuttontemplate:Destroy()
				UpdateSize()
			end

			return colorpicker
		end

		return tabs
	end
	return window
end

return lib
