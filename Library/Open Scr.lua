--  Not Leak Intend Open Source UI

local TweenService = game:GetService('TweenService')
local inputService = game:GetService("UserInputService")
local userSettings = UserSettings and UserSettings() or function() end
local RunService = game:GetService('RunService')
local Mouse = game.Players.LocalPlayer:GetMouse()
local par = game.Players.LocalPlayer.PlayerGui --game.CoreGui and game.CoreGui or game.Players.LocalPlayer.PlayerGui
for i,v in pairs(par:GetChildren()) do if v.Name == "Exclusive Hub" then v:Destroy() end end

if _G.LoadBackground then task.cancel(_G.LoadBackground) end
if _G.RGPTColor then task.cancel(_G.RGPTColor) end
if _G.RGPTColor2 then task.cancel(_G.RGPTColor2) end

getgenv().Settings = {
	UiSetting = {
		Keybind = Enum.KeyCode.RightControl,
		Color = {
			MainColor = Color3.fromRGB(213, 55, 102),
			MainBackground = Color3.fromRGB(15, 15, 15),
			MinBackground = Color3.fromRGB(17, 17, 17)
		}
	}
}

local Library = {
	Font = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
	Dropdown = nil,
	ColorPicker = nil,
	Blur = loadstring(game:HttpGet('https://raw.githubusercontent.com/aresZee7/aresLibrary/main/BlurFrame'))()
}

local Window = {}
local TableUIColors = {}
local Func = { Options = Settings }	

function Library:Create(Class, Properties)
	local _Instance = (typeof(Class) == "string") and Instance.new(Class) or Class

	if Properties then
		for Property, Value in pairs(Properties) do
			_Instance[Property] = Value
		end
	end

	return _Instance
end	

function Library:ApplyTextStroke(Inst, Color, Transparency)
	local stroke = self:Create("UIStroke", {
		Color = Color or Color3.new(0, 0, 0),
		Thickness = 1,
		Transparency = Transparency or 0,
		LineJoinMode = Enum.LineJoinMode.Round,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Parent = Inst
	})
	return stroke
end

function Library:CreateLabel(Properties, IsHud)
	local _Instance = self:Create("TextLabel", {
		BackgroundTransparency = 1,
		Font = self.Font or Enum.Font.SourceSans,
		TextColor3 = self.FontColor or Color3.new(1, 1, 1),
		TextSize = 16,
		TextStrokeTransparency = 0
	})

	self:ApplyTextStroke(_Instance)

	if self.AddToRegistry then
		self:AddToRegistry(_Instance, { TextColor3 = "FontColor" }, IsHud)
	end

	return self:Create(_Instance, Properties)
end

function Library:MakeDragable(Frame, object)
	local dragToggle,dragInput,dragStart,dragPos,startPos
	local dragSpeed = .25

	local function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		TweenService:Create(
			object,
			TweenInfo.new(0,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),
			{Position = Position}
		):Play()
	end

	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			dragToggle = true
			dragStart = input.Position
			startPos = object.Position
			input.Changed:Connect(function()
				if (input.UserInputState == Enum.UserInputState.End) then
					dragToggle = false
				end
			end)
		end
	end)

	Frame.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch)then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if (input == dragInput and dragToggle) then
			updateInput(input)
		end
	end)
end

function Library:GetCensoredText(s)
	local censoredText = s:gsub("(%w)(%w*)(%w)", "%1***%3")
	return censoredText
end
local ProtectGui = protectgui or protect_gui or (syn and syn.protect_gui) or function() end
local NormalHub = Library:Create("ScreenGui", {
	Name = "Exclusive Hub",
	Parent = par,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling
});ProtectGui(NormalHub)

local getBlur = function()
	for i,v in next, game:GetService('Lighting'):GetChildren() do if v:GetAttribute('NormolHub') then return v end end
	return nil
end

local removeBlur = function()
	for i,v in next, game:GetService('Lighting'):GetChildren() do if v:GetAttribute('NormolHub') then v:Destroy() end end
end
removeBlur()

local MainDirectory = "Ares UI"
local AssetsDirectory = "Ares UI\\Assets"
local function CheckDirectory()
	if getgenv then
		if not isfolder(MainDirectory) then
			makefolder(MainDirectory)
		end
		if not isfolder(AssetsDirectory) then
			makefolder(AssetsDirectory)
		end
	end
end

local function GetMp4(name, url)
	if getgenv then
		CheckDirectory()

		local path = string.format("%s\\%s.mp4", AssetsDirectory, name)
		if not isfile(path) then
			local conten = game:HttpGet(url)
			writefile(path, content)
		end

		return getcustomasset(path), path
	end
end

local tableVideo = {
	'https://zuwz.xyz/Assets/sRcoy21.mp4',
	'https://zuwz.xyz/Assets/Lost555.mp4',
	'https://zuwz.xyz/Assets/Lost666.mp4',
	'https://zuwz.xyz/Assets/Lost888.mp4'
}

local maxTable = #tableVideo
print(maxTable, 'maxTable')
local randomLuck = math.random(1, 10000)
print(randomLuck, 'randomLuck', ': in 10000', '| Need 1 in 10000')
if randomLuck == 1 then	
	print('Wait Someday Loading')
	local gay,  file = GetMp4('loading' .. math.random(1, 1000000), tableVideo[math.random(1, #tableVideo)])
	if par:FindFirstChild('Gay') then
		par:FindFirstChild('Gay'):Destroy()
	end
	local ScreenGui = Library:Create('ScreenGui', {
		Name = "Gay",
		Parent = par,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		IgnoreGuiInset = true
	})


	local video = Library:Create('VideoFrame', {
		Parent = ScreenGui,
		Video = gay,
		Size = UDim2.new(1, 0, 1, 0)
	})

	video.Loaded:Connect(function()
		wait('Play')
		video:Play()
	end)
	video.Ended:Connect(function()
		wait('remove')
		delfile(file)
		if par:FindFirstChild('Gay') then
			par:FindFirstChild('Gay'):Destroy()
		end
	end)
end

local Component = {}
Component.AddButton = function(Container, Options)
	assert(Container, "Missing Parent.")
	assert(Options, "Missing Options.")

	local func = {}
	local Button = {
		Title = Options.Title or '',
		Callback = Options.Callback or function() end
	}

	local Buttons = Library:Create("Frame", {
		Name = "Button",
		Parent = Container,
		BackgroundColor3 = Color3.fromRGB(27, 27, 27),
		BackgroundTransparency = 0.600,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0.270586133, 0),
		Size = UDim2.new(1, 0, 0, 25),
	})

	Library:ApplyTextStroke(Buttons, Color3.fromRGB(255, 255, 255), 0.8)

	local ButtonCorner = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 2),
		Name = "ButtonCorner",
		Parent = Buttons,
	})

	local Clickable = Library:Create("TextButton", {
		Name = "Clickable",
		Parent = Buttons,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		FontFace = Library.Font,
		Text = "",
		TextColor3 = Color3.fromRGB(0, 0, 0),
		TextSize = 14.000,
	})

	local ButtonTitle = Library:Create("TextLabel", {
		Name = "ButtonTitle",
		Parent = Buttons,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(27, 27, 27),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 1, 0),
		FontFace = Library.Font,
		Text = Button.Title,
		TextColor3 = Color3.fromRGB(142, 144, 150),
		TextSize = 12.000,
	})

	table.insert(TableUIColors, {
		['Text'] = {
			ButtonTitle,
		}
	})

	Clickable.Activated:Connect(function()
		TweenService:Create(Buttons, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		}):Play()
		Button.Callback()
		task.wait(.2)
		TweenService:Create(Buttons, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			BackgroundColor3 = Color3.fromRGB(27, 27, 27)
		}):Play()
	end)

	function func:SetCallback(f)
		Button.Callback = f
	end

	function func:SetTitle(Text)
		ButtonTitle.Text = Text
	end

	function func:SetVisible(state)
		Buttons.Visible = state
	end
	return func
end

Component.AddToggle = function(Container, Options)
	assert(Container, "Missing Parent.")
	assert(Options, "Missing Options.")

	local Toggle = {
		Title = Options.Title or "Toggle",
		Value = Options.Default or false,
		Callback = Options.Callback or function() end,
		Lock = Options.Locked or false,
		Changed = function() end
	}

	local ToggleBase = Library:Create("Frame", {
		Name = "Toggle",
		Parent = Container,
		BackgroundColor3 = Color3.fromRGB(27, 27, 27),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 0, 30),
	})

	local UICorner =  Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 2),
		Parent = ToggleBase
	})

	local LockToggle = Library:Create("Frame", {
		Name = "LockToggle",
		Parent = ToggleBase,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 0.500,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Visible = false,
	})

	local UICorner_2 = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 2),
		Parent = LockToggle
	})

	local ToggleLocker = Library:Create("ImageLabel", {
		Name = "ToggleLocker",
		Parent = LockToggle,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 20, 0, 20),
		Image = "http://www.roblox.com/asset/?id=6031082533",
	})

	local Button = Library:Create("TextButton", {
		Parent = ToggleBase,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Font = Enum.Font.SourceSans,
		TextColor3 = Color3.fromRGB(0, 0, 0),
		TextSize = 14.000,
		TextTransparency = 1.000,
	})

	local ToggleBase3 = Library:Create("Frame", {
		Name = "ToggleBase",
		Parent = ToggleBase,
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(0, 15, 0, 15),
		ZIndex = 5,
	})

	local UIStroke = Library:Create("UIStroke", {
		Name = "UIStroke",
		Color = Color3.fromRGB(213, 55, 102),
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Parent = ToggleBase3
	})

	local UICorner_3 = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 2),
		Parent = ToggleBase3
	})

	local ImageLabel = Library:Create("ImageLabel", {
		Parent = ToggleBase3 ,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(213, 55, 102),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Image = "rbxassetid://6031068421",
		ImageColor3 = Color3.fromRGB(213, 55, 102),
	})

	local TitleText = Library:Create("TextLabel", {
		Name = "TitleText",
		Parent = ToggleBase,
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 0.5, 0),
		FontFace = Library.Font,
		Text = Toggle.Title,
		TextColor3 = Color3.fromRGB(142, 144, 150),
		TextSize = 12.000,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	table.insert(TableUIColors, {
		['Text'] = {
			TitleText,
		}
	})

	table.insert(TableUIColors, {
		['Toggle'] = {
			ImageLabel,
			UIStroke
		}
	})

	function Toggle:Display()
		ImageLabel.Visible = Toggle.Value
		Toggle.Callback(Toggle.Value)
	end

	function Toggle:SetValue(Bool)
		if not Toggle.Locked then
			Toggle.Value = (not not Bool)
			Toggle:Display()
		end
	end

	Button.Activated:Connect(function()
		Toggle:SetValue(not Toggle.Value)
	end)

	function Toggle:SetLocked(State)
		Toggle.Locked = State
		LockToggle.Visible = State
	end

	function Toggle:GetValue()
		return Toggle.Value
	end

	Toggle:Display();
	Toggle:SetLocked(Toggle.Locked);

	return Toggle
end

DropValue = {}
ColorValue = {}
selectedValues = {}

Component.AddDropdownList = function(ScrollingFrame, Options)
	DropValue[_G['DorpDownTitle']] = DropValue[_G['DorpDownTitle']] or Options.Default
	local Dropdown = {}

	local DropdownItem = Library:Create("Frame", {
		Name = "DropdownItem",
		Parent = ScrollingFrame,
		BackgroundColor3 = Color3.fromRGB(18, 18, 18),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(0, 100, 0, 100)
	})

	local UICorner_2 = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 3),
		Parent = DropdownItem
	})

	local Title = Library:Create("TextLabel", {
		Name = "Title",
		Parent = DropdownItem,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 8, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		FontFace = Library.Font,
		Text = Options.Value,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14.000,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd
	})

	local Frame = Library:Create("Frame", {
		Parent = DropdownItem,
		BackgroundColor3 = Color3.fromRGB(213, 55, 102),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.771426857, 0, 0.233333334, 0),
		Size = UDim2.new(0, 15, 0, 15)
	})

	local UICorner_3 = Library:Create("UICorner", {
		CornerRadius = UDim.new(1, 0),
		Parent = Frame
	})

	local ImageLabel = Library:Create("ImageLabel", {
		Parent = Frame,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Image = "rbxassetid://10709790298",
		ImageColor3 = Func.Options.UiSetting.Color.MainColor or Color3.fromRGB(213, 55, 102),
		Visible = false
	})

	local UIAspectRatioConstraint = Library:Create("UIAspectRatioConstraint",{
		Parent = ImageLabel
	})

	local Button = Library:Create("TextButton", {
		Name = "Button",
		Parent = DropdownItem,
		BackgroundTransparency = 1.00,
		Text = "",
		Size = UDim2.new(1, 0, 1, 0)
	})

	local value = Options.Value
	local isSelected = selectedValues[value]

	ImageLabel.Visible = isSelected

	if DropValue[_G['DorpDownTitle']] then
		if Options.Multi then
			if table.find(DropValue[_G['DorpDownTitle']], Options.Value) then
				ImageLabel.Visible = true
				Title.TextColor3 = Func.Options.UiSetting.Color.MainColor or Color3.fromRGB(213, 55, 102)
			end
		else
			if DropValue[_G['DorpDownTitle']] == Options.Value then
				Title.TextColor3 = Func.Options.UiSetting.Color.MainColor or Color3.fromRGB(213, 55, 102)
				ImageLabel.Visible = true
			end
		end
	end

	Button.Activated:Connect(function()
		local value = Options.Value

		if Options.Multi then
			selectedValues = typeof(DropValue[_G['DorpDownTitle']]) == 'table' and DropValue[_G['DorpDownTitle']] or {}
			local index = table.find(selectedValues, value)
			if index then
				table.remove(selectedValues, index)
			else
				table.insert(selectedValues, value)
			end
		else
			selectedValues = value
		end

		DropValue[_G['DorpDownTitle']] = selectedValues

		local selectedText
		if typeof(selectedValues) == 'string' then
			selectedText = Options.UITitle .. ': [' .. selectedValues .. ']'
		else
			selectedText = Options.UITitle .. ': [' .. table.concat(selectedValues, ', ') .. ']'
		end

		Options.DropdownTitle[1].Text = selectedText
		Options.DropdownTitle[2].Text = selectedText

		for _, v in pairs(ScrollingFrame:GetChildren()) do
			if v:IsA('Frame') then
				if Options.Multi then
					local frameValue = v:FindFirstChild("Title") and v.Title.Text
					local icon = v.Frame.ImageLabel
					if frameValue and table.find(DropValue[_G['DorpDownTitle']], frameValue) then
						v.Title.TextColor3 = Func.Options.UiSetting.Color.MainColor or Color3.fromRGB(213, 55, 102)
						icon.Visible = true
						TweenService:Create(icon, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
					else
						v.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
						icon.Visible = false
						TweenService:Create(icon, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
					end
				else
					v.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					v.Frame.ImageLabel.Visible = false
					TweenService:Create(v.Frame.ImageLabel, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
				end
			end
		end
		if Options.Multi then
			if table.find(DropValue[_G['DorpDownTitle']], Options.Value) then
				Title.TextColor3 = Func.Options.UiSetting.Color.MainColor or Color3.fromRGB(213, 55, 102)
				ImageLabel.Visible = true
				TweenService:Create(ImageLabel, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
			else
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.Visible = false
				TweenService:Create(ImageLabel, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
			end
		else
			Title.TextColor3 = Func.Options.UiSetting.Color.MainColor or Color3.fromRGB(213, 55, 102)
			ImageLabel.Visible = true
			TweenService:Create(ImageLabel, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
		end

		if Options.Callback then
			Options.Callback(selectedValues)
		end
	end)
end

Component.CreateMenu = function(Options, DropdownTitle)

	local Dropdown = Library:Create("TextButton", {
		Name = "Dropdown",
		Parent = NormalHub:FindFirstChild("Shadow"),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1, -- 0.450
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		AutoButtonColor = false,
		BorderSizePixel = 0,
		Text = '',
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Visible = true
	})

	Dropdown.Activated:Connect(function() end)

	TweenService:Create(Dropdown, TweenInfo.new( 1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		BackgroundTransparency = 0.450,
	}):Play()

	local Main = Library:Create("Frame", {
		Name = "Main",
		Parent = Dropdown,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(17, 17, 17),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		BackgroundTransparency = 1,
		Position = UDim2.new(0.502949834, 0, 2, 0),
		Size = UDim2.new(0.519174039, 0, 0.426187277, 0),
	})

	TweenService:Create( Main, TweenInfo.new( 0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.502949834, 0, 0.497442454, 0),
		BackgroundTransparency = 0
	}):Play()

	local UICorner = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 3),
		Parent = Main
	})

	local ScrollingFrame = Library:Create("ScrollingFrame", {
		Parent = Main,
		Active = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		ClipsDescendants = false,
		Position = UDim2.new(0.50000006, 0, 0.514550626, 0),
		Size = UDim2.new(0.930000067, 0, 0.875898421, 0),
		ScrollBarThickness = 1
	})

	local UIGridLayout = Library:Create("UIGridLayout", {
		Parent = ScrollingFrame,
		SortOrder = Enum.SortOrder.LayoutOrder,
		CellSize = UDim2.new(0, 105, 0, 30)
	})

	UIGridLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIGridLayout.AbsoluteContentSize.Y + 35)
	end)

	local Shadownr = Library:Create("ImageLabel", {
		Name = "Shadownr",
		Parent = Dropdown,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(213, 55, 102),
		BackgroundTransparency = 1.000,
		ClipsDescendants = true,
		Position = UDim2.new(0.489896804, 0, 0.518529713, 0),
		Size = UDim2.new(0, 428, 0, 221),
		SizeConstraint = Enum.SizeConstraint.RelativeYY,
		ZIndex = -11,
		Image = "rbxassetid://7912134082",
		ImageColor3 = Color3.fromRGB(7, 7, 7),
		ImageTransparency = 0.300,
		SliceCenter = Rect.new(95, 95, 205, 205)
	})

	local CloseDropdown = Library:Create("TextButton", {
		Name = "CloseDropdown",
		Parent = Dropdown,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.75, 0),
		Size = UDim2.new(0, 351, 0, 18),
		FontFace = Library.Font,
		Text = "Tap To Close",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextTransparency = 1,
		TextSize = 14.000
	})

	TweenService:Create( CloseDropdown, TweenInfo.new( 2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		TextTransparency = 0,
	}):Play()


	local Title_3 = Library:Create("TextLabel", {
		Name = "Title",
		Parent = Dropdown,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.25, 0),
		Size = UDim2.new(0, 351, 0, 27),
		FontFace = Library.Font,
		Text = DropdownTitle.Text,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 16.000,
	})

	TweenService:Create( Title_3, TweenInfo.new( 2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		TextTransparency = 0,
	}):Play()

	local resetDorpdown = Library:Create("ImageButton", {
		Name = "resetDorpdown",
		Parent = Dropdown,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.261061937, 0, 0.760869563, 0),
		Size = UDim2.new(0, 30, 0, 30),
		Image = "rbxassetid://11293978505",
		ImageTransparency = 1,
		Visible = false
	})

	TweenService:Create( resetDorpdown, TweenInfo.new( 2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		ImageTransparency = 0,
	}):Play()

	local RefreshItems = Library:Create("TextLabel", {
		Name = "Refresh Items",
		Parent = resetDorpdown,
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 1, 0),
		Size = UDim2.new(0, 100, 0, 30),
		FontFace = Library.Font,
		Text = "Refresh Dropdown",
		TextTransparency = 1,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 16.000
	})

	for i,v in ipairs(Options.List) do
		Component.AddDropdownList(ScrollingFrame, {
			Title = Title_3.Text,
			UITitle = Options.Title,
			Default = Options.Default,
			Multi = Options.Multi,
			Value = v,
			DropdownTitle = {DropdownTitle, Title_3},
			Callback = Options.Callback
		})
	end

	resetDorpdown.Activated:Connect(function()

	end)

	resetDorpdown.MouseEnter:Connect(function()
		TweenService:Create( RefreshItems, TweenInfo.new( 2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			TextTransparency = 0,
		}):Play()
	end)

	resetDorpdown.MouseLeave:Connect(function()
		TweenService:Create( RefreshItems, TweenInfo.new( 2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			TextTransparency = 1,
		}):Play()
	end)


	CloseDropdown.Activated:Connect(function()
		local tweens = {
			{Title_3, {TextTransparency = 1}, 1},
			{Dropdown, {BackgroundTransparency = 1}, 1},
			{CloseDropdown, {TextTransparency = 1}, 1},
			{Main, {Position = UDim2.new(0.502949834, 0, 2, 0), BackgroundTransparency = 0}, 1},
			{resetDorpdown, {Position = UDim2.new(0.502949834, 0, 2, 0), ImageTransparency = 1}, 1}
		}
		for _, tweenData in pairs(tweens) do
			TweenService:Create(tweenData[1], TweenInfo.new(tweenData[3], Enum.EasingStyle.Back, Enum.EasingDirection.Out), tweenData[2]):Play()
		end
		Shadownr:Destroy()
		task.wait(1)
		if Dropdown then Dropdown:Destroy() end
	end)
	return ScrollingFrame
end

Component.AddColorPickerMenu = function(Options, NowColor)
	if not _G['ColorTilte'] then return end
	local Default = ColorValue[_G['ColorTilte']] or Options.Default or Color3.fromRGB(255, 255, 255)
	local red = math.clamp(math.floor(Default.R * 255), 0, 255)
	local green = math.clamp(math.floor(Default.G * 255), 0, 255)
	local blue = math.clamp(math.floor(Default.B * 255), 0, 255)

	local ColorPicker = Library:Create("TextButton", {
		Name = "ColorPicker",
		Parent = NormalHub:FindFirstChild("Shadow"),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Text = "",
		AutoButtonColor = false,
		Size = UDim2.new(1, 0, 1, 0)
	})

	-- Create shadow for depth effect
	local Shadown = Library:Create("ImageLabel", {
		Name = "Shadow",
		Parent = ColorPicker,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(213, 55, 102),
		BackgroundTransparency = 1.000,
		ClipsDescendants = true,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 344, 0, 212),
		SizeConstraint = Enum.SizeConstraint.RelativeYY,
		ZIndex = -11,
		Image = "rbxassetid://7912134082",
		ImageColor3 = Color3.fromRGB(7, 7, 7),
		ImageTransparency = 0.300,
		SliceCenter = Rect.new(95, 95, 205, 205)
	})

	-- Create title and close button
	local Title = Library:Create("TextLabel", {
		Name = "Title",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Parent = ColorPicker,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.2, 0),
		Size = UDim2.new(0, 351, 0, 27),
		FontFace = Library.Font,
		Text = Options.Title or "Color Picker",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 16.000
	})

	local CloseColorPicker = Library:Create("TextButton", {
		Name = "CloseColorPicker",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Parent = ColorPicker,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.8, 0),
		Size = UDim2.new(0, 351, 0, 18),
		FontFace = Library.Font,
		Text = "Tap To Close",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14.000
	})

	TweenService:Create(ColorPicker, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		BackgroundTransparency = 0.450,
	}):Play()
	ColorPicker.Activated:Connect(function() end)

	local Main = Library:Create("Frame", {
		Name = "Main",
		Parent = ColorPicker,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(17, 17, 17),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 2, 0),
		Size = UDim2.new(0, 310, 0, 193),
		ZIndex = 2
	})

	local UICorner = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 5),
		Parent = Main
	})

	-- Animation for main panel
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 0
	}):Play()

	-- Create the Hue slider
	local Hue = Library:Create("Frame", {
		Name = "Hue",
		Parent = Main,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.25, 3, 0.125, 0),
		Size = UDim2.new(0, 130, 0, 15),
		ZIndex = 2,
	})

	local UIGradient = Library:Create("UIGradient", {
		Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), 
			ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)), 
			ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)), 
			ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)), 
			ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)), 
			ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)), 
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
		},
		Rotation = 180,
		Parent = Hue
	})

	local UICorner_Hue = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 3),
		Parent = Hue
	})

	local HueSelection = Library:Create("ImageLabel", {
		Name = "HueSelection",
		Parent = Hue,
		AnchorPoint = Vector2.new( 0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, 18, 0, 18),
		ZIndex = 3,
		Image = "http://www.roblox.com/asset/?id=4805639000",
	})

	-- Create the color saturation/value picker
	local Color = Library:Create("ImageLabel", {
		Name = "Color",
		Parent = Main,
		BackgroundColor3 = Color3.fromRGB(255, 0, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.05, 0, 0.25, 0),
		Size = UDim2.new(0, 130, 0, 130),
		ZIndex = 2,
		Image = "rbxassetid://4155801252",
	})

	local UICorner_Color = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 3),
		Parent = Color,
	})

	local ColorSelection = Library:Create("ImageLabel", {
		Name = "ColorSelection",
		Parent = Color,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(1, 0, 0, 0),
		Size = UDim2.new(0, 18, 0, 18),
		ZIndex = 3,
		Image = "http://www.roblox.com/asset/?id=4805639000",
	})

	-- Create the input panel
	local Input = Library:Create("Frame", {
		Name = "Input",
		Parent = Main,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(20, 20, 20),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.739, 0, 0.507, 0),
		Size = UDim2.new(0, 130, 0, 158),
	})

	local UICorner_Input = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 3),
		Parent = Input
	})

	local UIPadding = Library:Create("UIPadding", {
		Parent = Input,
		PaddingLeft = UDim.new(0, 5),
		PaddingRight = UDim.new(0, 5),
		PaddingTop = UDim.new(0, 10),
		PaddingBottom = UDim.new(0, 10),
	})

	-- Create RGB input fields
	-- Red input
	local RedBase = Library:Create("Frame", {
		Name = "RedBase",
		Parent = Input,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0, 0, 0.05, 0),
		Size = UDim2.new(1, 0, 0, 24),
	})

	local RedLabel = Library:Create("TextLabel", {
		Parent = RedBase,
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(0, 40, 1, 0),
		FontFace = Library.Font,
		Text = "Red",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14.000,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	local RedInput = Library:Create("TextBox", {
		Name = "RedInput",
		Parent = RedBase,
		BackgroundColor3 = Color3.fromRGB(31, 31, 31),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(1, -70, 0, 0),
		Size = UDim2.new(0, 70, 1, 0),
		FontFace = Library.Font,
		Text = tostring(red),
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 12.000,
		ClearTextOnFocus = false,
	})

	local UICorner_RedInput = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 3),
		Parent = RedInput
	})

	-- Green input
	local GreenBase = Library:Create("Frame", {
		Name = "GreenBase",
		Parent = Input,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0, 0, 0.25, 0),
		Size = UDim2.new(1, 0, 0, 24),
	})

	local GreenLabel = Library:Create("TextLabel", {
		Parent = GreenBase,
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(0, 40, 1, 0),
		FontFace = Library.Font,
		Text = "Green",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14.000,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	local GreenInput = Library:Create("TextBox", {
		Name = "GreenInput",
		Parent = GreenBase,
		BackgroundColor3 = Color3.fromRGB(31, 31, 31),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(1, -70, 0, 0),
		Size = UDim2.new(0, 70, 1, 0),
		FontFace = Library.Font,
		Text = tostring(green),
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 12.000,
		ClearTextOnFocus = false,
	})

	local UICorner_GreenInput = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 3),
		Parent = GreenInput
	})

	-- Blue input
	local BlueBase = Library:Create("Frame", {
		Name = "BlueBase",
		Parent = Input,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0, 0, 0.45, 0),
		Size = UDim2.new(1, 0, 0, 24),
	})

	local BlueLabel = Library:Create("TextLabel", {
		Parent = BlueBase,
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(0, 40, 1, 0),
		FontFace = Library.Font,
		Text = "Blue",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14.000,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	local BlueInput = Library:Create("TextBox", {
		Name = "BlueInput",
		Parent = BlueBase,
		BackgroundColor3 = Color3.fromRGB(31, 31, 31),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(1, -70, 0, 0),
		Size = UDim2.new(0, 70, 1, 0),
		FontFace = Library.Font,
		Text = tostring(blue),
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 12.000,
		ClearTextOnFocus = false,
	})

	local UICorner_BlueInput = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 3),
		Parent = BlueInput
	})

	-- Preview of the selected color
	local ColorPreview = Library:Create("Frame", {
		Name = "ColorPreview",
		Parent = Input,
		BackgroundColor3 = Default,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, -45, 0.8, 0),
		Size = UDim2.new(0, 90, 0, 30),
	})

	local UICorner_ColorPreview = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 3),
		Parent = ColorPreview
	})

	local PreviewLabel = Library:Create("TextLabel", {
		Parent = Input,
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0, 0, 0.65, 0),
		Size = UDim2.new(1, 0, 0, 20),
		FontFace = Library.Font,
		Text = "Preview",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14.000,
	})

	local ColorH, ColorS, ColorV = 0, 0, 1
	local ColorInput, HueInput = nil, nil
	local SelectedColor = Default

	local h, s, v = Color3.toHSV(Default)
	ColorH, ColorS, ColorV = h, s, v

	HueSelection.Position = UDim2.new( 1 - ColorH, 0, 0.5, 0)
	ColorSelection.Position = UDim2.new(ColorS, 0, 1 - ColorV, 0)
	Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

	local function UpdateColor()
		SelectedColor = Color3.fromHSV(ColorH, ColorS, ColorV)
		Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
		red = math.floor(SelectedColor.R * 255 + 0.5)
		green = math.floor(SelectedColor.G * 255 + 0.5)
		blue = math.floor(SelectedColor.B * 255 + 0.5)
		RedInput.Text = tostring(red)
		GreenInput.Text = tostring(green)
		BlueInput.Text = tostring(blue)
		ColorPreview.BackgroundColor3 = SelectedColor
		NowColor.BackgroundColor3 = SelectedColor
		ColorValue[_G['ColorTilte']] = SelectedColor
		if Options.Callback then
			Options.Callback(SelectedColor)
		end
	end

	local function UpdateFromRGB()
		local newColor = Color3.fromRGB(red, green, blue)
		ColorH, ColorS, ColorV = Color3.toHSV(newColor)

		HueSelection.Position = UDim2.new(0.5, 0, 1 - ColorH, 0)
		ColorSelection.Position = UDim2.new(ColorS, 0, 1 - ColorV, 0)
		UpdateColor()
	end

	Color.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			if ColorInput then
				ColorInput:Disconnect()
			end

			ColorInput = RunService.RenderStepped:Connect(function()
				local mousePosition
				if input.UserInputType == Enum.UserInputType.Touch then
					mousePosition = input.Position
				else
					mousePosition = Mouse
				end

				local colorX = math.clamp((mousePosition.X - Color.AbsolutePosition.X) / Color.AbsoluteSize.X, 0, 1)
				local colorY = math.clamp((mousePosition.Y - Color.AbsolutePosition.Y) / Color.AbsoluteSize.Y, 0, 1)

				ColorSelection.Position = UDim2.new(colorX, 0, colorY, 0)
				ColorS = colorX
				ColorV = 1 - colorY
				UpdateColor()
			end)
		end
	end)

	Color.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			if ColorInput then
				ColorInput:Disconnect()
			end
		end
	end)

	Hue.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			if HueInput then
				HueInput:Disconnect()
			end

			HueInput = RunService.RenderStepped:Connect(function()
				local mousePosition
				if input.UserInputType == Enum.UserInputType.Touch then
					mousePosition = input.Position
				else
					mousePosition = Mouse
				end
				local hueY = math.clamp((mousePosition.X - Hue.AbsolutePosition.X) / Hue.AbsoluteSize.X, 0, 1)
				HueSelection.Position = UDim2.new(hueY, 0, 0.5, 0)
				ColorH = 1 - hueY
				UpdateColor()
			end)
		end
	end)

	Hue.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			if HueInput then
				HueInput:Disconnect()
			end
		end
	end)

	RedInput.FocusLost:Connect(function(enterPressed)
		local inputValue = tonumber(RedInput.Text)
		if inputValue then
			red = math.clamp(math.floor(inputValue + 0.5), 0, 255)
			RedInput.Text = tostring(red)
			UpdateFromRGB()
		else
			RedInput.Text = tostring(red)
		end
	end)

	GreenInput.FocusLost:Connect(function(enterPressed)
		local inputValue = tonumber(GreenInput.Text)
		if inputValue then
			green = math.clamp(math.floor(inputValue + 0.5), 0, 255)
			GreenInput.Text = tostring(green)
			UpdateFromRGB()
		else
			GreenInput.Text = tostring(green)
		end
	end)

	BlueInput.FocusLost:Connect(function(enterPressed)
		local inputValue = tonumber(BlueInput.Text)
		if inputValue then
			blue = math.clamp(math.floor(inputValue + 0.5), 0, 255)
			BlueInput.Text = tostring(blue)
			UpdateFromRGB()
		else
			BlueInput.Text = tostring(blue)
		end
	end)

	-- Close button functionality
	CloseColorPicker.Activated:Connect(function()
		-- Fade out animations
		local tweens = {
			{Title, {TextTransparency = 1}, 0.5},
			{CloseColorPicker, {TextTransparency = 1}, 0.5},
			{ColorPicker, {BackgroundTransparency = 1}, 0.5},
			{Main, {Position = UDim2.new(0.5, 0, 2, 0), BackgroundTransparency = 1}, 0.5},
		}
		Shadown:Destroy()
		for _, tweenData in pairs(tweens) do
			TweenService:Create(tweenData[1], TweenInfo.new(tweenData[3], Enum.EasingStyle.Quad, Enum.EasingDirection.Out), tweenData[2]):Play()
		end

		-- Clean up after animation
		task.delay(0.6, function()
			if ColorPicker and ColorPicker.Parent then
				ColorPicker:Destroy()
			end
		end)
	end)

	-- Initial color update
	UpdateColor()

	return ColorPicker
end

Component.AddDropdown = function(Container, Options)
	local Dropdowns = {
		Title = Options.Title or 'Kuy';
		List = Options.List or {};
		Default = nil;
		Values = Options.Values;
		Value = Options.Multi and {} or '';
		Multi = Options.Multi;
		Callback = Options.Callback or function(Value) end;
	};

	if Options.Multi then
		local loadDefault = {}
		for i, v in pairs(Options.Default or {}) do
			if table.find(Dropdowns.List, v) then
				table.insert(loadDefault, v)
			end
		end
		Dropdowns.Default = loadDefault
	else
		if table.find(Dropdowns.List, Options.Default) then
			Dropdowns.Default = Options.Default or ''
		else
			Dropdowns.Default = ''
		end
	end

	local selectedValues = Dropdowns.Default
	local selectedText;
	if typeof(selectedValues) == 'string' then
		selectedText = Dropdowns.Title .. ': [' .. selectedValues .. ']'
	elseif typeof(selectedValues) == 'table' then
		selectedText = Dropdowns.Title .. ': [' .. table.concat(selectedValues, ', ') .. ']'
	end

	if Dropdowns.Callback then
		Dropdowns.Callback(selectedValues)
	end

	local Dropdown = Library:Create("Frame", {
		Name = "Dropdown",
		Parent = Container,
		BackgroundColor3 = Color3.fromRGB(56, 60, 83),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.new(1, 0, 0, 30)
	})

	local UICorner = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 2),
		Parent = Dropdown
	})

	local Clickable_Dropdown = Library:Create("Frame", {
		Name = "Clickable_Dropdown",
		Parent = Dropdown,
		BackgroundColor3 = Color3.fromRGB(27, 27, 27),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0)
	})

	local DropdownIcon = Library:Create("ImageLabel", {
		Name = "DropdownIcon",
		Parent = Clickable_Dropdown,
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(0, 15, 0, 15),
		Image = "http://www.roblox.com/asset/?id=6031094687",
		ImageColor3 = Color3.fromRGB(142, 144, 150)
	})


	local DropdownTitle = Library:Create("TextLabel", {
		Name = "DropdownTitle",
		Parent = Clickable_Dropdown,
		BackgroundColor3 = Color3.fromRGB(27, 27, 27),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		FontFace = Library.Font,
		Text = selectedText,
		TextColor3 = Color3.fromRGB(142, 144, 150),
		TextSize = 12.000,
		TextXAlignment = Enum.TextXAlignment.Left
	})

	table.insert(TableUIColors, {
		['Text'] = {
			DropdownTitle,
		}
	})

	local ImageButton = Library:Create("ImageButton",{
		Parent = Clickable_Dropdown,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Image = "rbxasset://textures/ui/GuiImagePlaceholder.png",
		ImageTransparency = 1.000
	})

	ImageButton.Activated:Connect(function()
		if not NormalHub:WaitForChild("Shadow", 9e9):FindFirstChild('Dropdown') and not NormalHub:WaitForChild("Shadow", 9e9):FindFirstChild('ColorPicker') then
			_G['DorpDownTitle'] = Dropdowns.Title
			Component.CreateMenu(Dropdowns, DropdownTitle)
		end
	end)

	function Dropdowns:Clear() return end
	function Dropdowns:Add(a) 
		Dropdowns.List = a
	end

	return Dropdowns
end

Component.AddColorPicker = function(Container, Options)
	local ColorPickers = {
		Title = Options.Title or '',
		Default = Options.Default or Color3.fromRGB(255, 0, 0),
		Callback = Options.Callback or function() end
	}

	local Colorpicker = Library:Create("Frame", {
		Name = "Colorpicker",
		Parent = Container,
		BackgroundColor3 = Color3.fromRGB(27, 31, 40),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(153, 153, 153),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 0, 30),
		ZIndex = 2

	})
	local UICorner = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 2),
		Parent = Colorpicker
	})

	local ColorpickerButton = Library:Create("TextButton", {
		Name = "ColorpickerButton",
		Parent = Colorpicker,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Font = Enum.Font.SourceSans,
		Text = "",
		TextColor3 = Color3.fromRGB(0, 0, 0),
		TextSize = 14.000
	})

	local NowColor = Library:Create("Frame", {
		Name = "NowColor",
		Parent = Colorpicker,
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundColor3 = ColorPickers.Default,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(0, 20, 0, 20)
	})

	local UICorner_2 = Library:Create("UICorner",{
		CornerRadius = UDim.new(0, 2),
		Parent = NowColor
	})

	local ColorpickerTitel = Library:Create("TextLabel", {
		Name = "ColorpickerTitel",
		Parent = Colorpicker,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		FontFace = Library.Font,
		Text = ColorPickers.Title,
		TextColor3 = Color3.fromRGB(142, 144, 150),
		TextSize = 12.000,
		TextXAlignment = Enum.TextXAlignment.Left
	})

	table.insert(TableUIColors, {
		['Text'] = {
			ColorpickerTitel,
		}
	})

	if ColorPickers.Callback then
		ColorPickers.Callback(ColorPickers.Default)
	end

	local ImageButton = Library:Create("ImageButton",{
		Parent = Colorpicker,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Image = "rbxasset://textures/ui/GuiImagePlaceholder.png",
		ImageTransparency = 1.000
	})

	Library:ApplyTextStroke(NowColor, Color3.fromRGB(255, 255, 255), 0.8)

	ImageButton.Activated:Connect(function()
		if not NormalHub:WaitForChild("Shadow", 9e9):FindFirstChild('Dropdown') and not NormalHub:WaitForChild("Shadow", 9e9):FindFirstChild('ColorPicker') then
			_G['ColorTilte'] = ColorPickers.Title or nil
			Component.AddColorPickerMenu(ColorPickers, NowColor)
		end
	end)

	return ColorPickers
end

Component.AddInput = function(Container, Options)
	local Inputs = {
		Title = Options.Title or '',
		Default = Options.Default or '',
		PlaceholderText = Options.PlaceholderText,
		MaxText = Options.Max or 133,
		Callback = Options.Callback or function() end
	}

	local Input = Library:Create("Frame", {
		Name = "Input",
		Parent = Container,
		BackgroundColor3 = Color3.fromRGB(56, 60, 83),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 0, 30)
	})

	local UICorner = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 2),
		Parent = Input,
	})

	local Main = Library:Create("Frame", {
		Name = "Main",
		Parent = Input,
		BackgroundColor3 = Color3.fromRGB(27, 27, 27),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.new(1, 0, 1, 0)
	})

	local UICorner_2 = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 2),
		Parent = Main
	})

	local InputTitle = Library:Create("TextLabel", {
		Name = "InputTitle",
		Parent = Main,
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 5, 0.5, 0), -- Added padding
		Size = UDim2.new(0.55, 0, 0.5, 0), -- Adjusted for better title space
		FontFace = Library.Font,
		Text = Inputs.Title,
		TextColor3 = Color3.fromRGB(142, 144, 150),
		TextSize = 12.000,
		TextXAlignment = Enum.TextXAlignment.Left
	})

	local InputBox = Library:Create("TextBox", {
		Name = "InputBox",
		Parent = Main,
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundColor3 = Color3.fromRGB(27, 31, 40),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Position = UDim2.new(1, -1, 0.5, 0), -- Added padding
		Size = UDim2.new(0.4, 0, 0.7, 0),
		FontFace = Library.Font,
		PlaceholderColor3 = Color3.fromRGB(178, 178, 178),
		PlaceholderText = Inputs.PlaceholderText,
		Text = Inputs.Default,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 12.000,
		TextXAlignment = Enum.TextXAlignment.Right
	})

	table.insert(TableUIColors, {
		['Text'] = {
			InputTitle,
			InputBox
		}
	})

	local UICorner_3 = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 2),
		Parent = InputBox
	})

	local UiStroke = Library:ApplyTextStroke(InputBox, Color3.fromRGB(213, 55, 102))

	local function adjustInputBoxSize()
		local baseSize = 0.7
		local textWidth = InputBox.TextBounds.X
		local minWidth = InputBox.AbsoluteSize.X * baseSize
		local maxWidth = Main.AbsoluteSize.X * 0.5

		local newWidth = math.clamp(textWidth + 2, minWidth, maxWidth)

		InputBox.Size = UDim2.new(0, newWidth, 0.7, 0)

		local titleWidth = 1 - (newWidth / Main.AbsoluteSize.X) - 0.05
		InputTitle.Size = UDim2.new(math.max(0.4, titleWidth), 0, 0.5, 0)
	end

	InputBox:GetPropertyChangedSignal("Text"):Connect(function()
		local currentText = InputBox.Text
		if #currentText > Inputs.MaxText then
			InputBox.Text = string.sub(currentText, 1, Inputs.MaxText)
		end
		adjustInputBoxSize()
	end)

	InputBox.FocusLost:Connect(function(enterPressed)
		local inputValue = tostring(InputBox.Text)
		Inputs.Callback(inputValue)
		adjustInputBoxSize()
	end)

	adjustInputBoxSize()

	table.insert(TableUIColors, {
		['Input'] = {
			UiStroke,
		}
	})

	return Inputs
end

Component.AddLabel = function(Container, Options, NeedLine)
	local Labels = {
		Title = Options.Title,
		NeedLine = NeedLine or false
	}
	local Label = Library:Create("Frame", {
		Name = "Label",
		Parent = Container,
		BackgroundColor3 = Color3.fromRGB(27, 27, 27),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 30)
	})
	local UICorner = Library:Create("UICorner",{
		CornerRadius = UDim.new(0, 2),
		Parent = Label
	})
	local LabelTitle = Library:Create("TextLabel",{
		Name = "LabelTitle",
		Parent = Label,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, (NeedLine and 25 or 0), 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		FontFace = Library.Font,
		Text = Labels.Title,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 12.000,
		TextXAlignment = Enum.TextXAlignment.Left
	})

	local Line1
	local Line2

	local function UpdateLineSize()
		if not NeedLine then return end

		local textService = game:GetService("TextService")
		local textWidth

		pcall(function()
			local textBounds = textService:GetTextSize(
				LabelTitle.Text,
				LabelTitle.TextSize,
				LabelTitle.FontFace and LabelTitle.FontFace.Font or Enum.Font.SourceSans,
				Vector2.new(math.huge, LabelTitle.TextSize)
			)
			textWidth = textBounds.X
		end)

		if not textWidth then
			pcall(function()
				textWidth = LabelTitle.TextBounds.X
			end)
		end

		if not textWidth then

			local text = LabelTitle.Text
			textWidth = 0

			for i = 1, #text do
				local char = string.sub(text, i, i)
				if char:match("[A-Z]") then
					textWidth = textWidth + (LabelTitle.TextSize * 0.6)
				elseif char:match("[a-z]") then
					textWidth = textWidth + (LabelTitle.TextSize * 0.5)
				elseif char:match("[0-9]") then
					textWidth = textWidth + (LabelTitle.TextSize * 0.5)
				elseif char:match("%s") then
					textWidth = textWidth + (LabelTitle.TextSize * 0.3)
				else
					textWidth = textWidth + (LabelTitle.TextSize * 0.4)
				end
			end
		end

		local padding = 3
		local minRightLineSize = 30

		local labelWidth = Label.AbsoluteSize.X
		local rightLineSize = math.max(minRightLineSize, labelWidth - textWidth - padding * 3 - 25)

		if Line2 then
			Line2.Size = UDim2.new(0, rightLineSize, 0, 3)
		end
	end

	if NeedLine then
		Line1 = Library:Create("Frame", {
			Name = "Line1",
			Parent = Label,
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = Color3.fromRGB(142, 144, 150),
			BackgroundTransparency = 0.2,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.new(0, 15, 0, 3)
		})

		local Line1_Corner = Library:Create("UICorner", {
			CornerRadius = UDim.new(1, 99),
			Parent = Line1
		})

		Line2 = Library:Create("Frame", {
			Name = "Line2",
			Parent = Label,
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundColor3 = Color3.fromRGB(142, 144, 150),
			BackgroundTransparency = 0.2,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.new(0, 100, 0, 3)
		})

		Label:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateLineSize)
		UpdateLineSize()

		LabelTitle:GetPropertyChangedSignal("Text"):Connect(UpdateLineSize)
		LabelTitle:GetPropertyChangedSignal("TextSize"):Connect(UpdateLineSize)
		LabelTitle:GetPropertyChangedSignal("FontFace"):Connect(UpdateLineSize)
	end

	table.insert(TableUIColors, {
		['Text'] = {
			LabelTitle,
		}
	})

	function Labels:Set(Value)
		LabelTitle.Text = Value

		UpdateLineSize()

		local textHeight = LabelTitle.TextBounds.Y
		if textHeight > 12 then
			Label.Size = UDim2.new(1, 0, 0, textHeight)
		end
	end

	function Labels:SetColor(Color)
		LabelTitle.TextColor3 = Color or Color3.fromRGB(142, 144, 150)
	end

	function Labels:SetFontSize(Size)
		LabelTitle.TextSize = Size

		UpdateLineSize()

		local textHeight = LabelTitle.TextBounds.Y
		if textHeight > 12 then
			Label.Size = UDim2.new(1, 0, 0, textHeight)
		end
	end

	return Labels
end

Component.AddKeybind = function(Container, Options)
	local KeyBinds = {
		Title = Options.Title or '',
		Default = Options.Default or Enum.KeyCode.Insert,
		Callback = Options.Callback or function() end
	}

	local KeyBind = Library:Create("Frame", {
		Name = "KeyBind",
		Parent = Container,
		BackgroundColor3 = Color3.fromRGB(27, 31, 40),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(153, 153, 153),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0.553602278, 0),
		Size = UDim2.new(1, 0, 0, 30),
		ZIndex = 2
	})

	local UICorner = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 2),
		Parent = KeyBind
	})

	local Button = Library:Create("TextButton", {
		Name = "KeybindClick",
		Parent = KeyBind,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Font = Enum.Font.SourceSans,
		Text = "",
		TextColor3 = Color3.fromRGB(0, 0, 0),
		TextSize = 14.000
	})

	local Titel = Library:Create("TextLabel", {
		Name = "Titel",
		Parent = KeyBind,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(0.808290184, 0, 1, 0),
		FontFace = Library.Font,
		Text = KeyBinds.Title,
		TextColor3 = Color3.fromRGB(142, 144, 150),
		TextSize = 12.000,
		TextXAlignment = Enum.TextXAlignment.Left
	})

	local NowKey = Library:Create("Frame", {
		Name = "NowKey",
		Parent = KeyBind,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(0, 20, 0, 20)
	})

	local UICorner_2 = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 2),
		Parent = NowKey
	})

	local TextLabel = Library:Create("TextLabel", {
		Parent = NowKey,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0.600000024, 0, 0.600000024, 0),
		FontFace = Library.Font,
		Text = KeyBinds.Default.Name,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 11.000,
	})

	table.insert(TableUIColors, {
		['Text'] = {
			TextLabel,
			Titel
		}
	})

	Library:ApplyTextStroke(NowKey, Color3.fromRGB(255, 255, 255), 0.8)
	local UpdateText = function()
		local textWidth = TextLabel.TextBounds.X
		local padding = 20
		NowKey.Size = UDim2.new(0, textWidth + padding, NowKey.Size.Y.Scale, NowKey.Size.Y.Offset)
		NowKey.Position = UDim2.new(0.98, -(textWidth + padding) / 2, NowKey.Position.Y.Scale, NowKey.Position.Y.Offset)
	end

	if not inputService.TouchEnabled then
		Button.Activated:Connect(function()
			local bindedKey = nil
			local function bindKey(input)
				if input.UserInputType == Enum.UserInputType.Keyboard then
					bindedKey = input.KeyCode
					TextLabel.Text = bindedKey.Name
					KeyBinds.Callback(bindedKey)
				end
			end

			local connection
			connection = inputService.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Keyboard then
					bindKey(input)
					UpdateText()
					connection:Disconnect()
				end
			end)

		end)
	end
	UpdateText()
end

Component.AddSlider = function(Container, Options)
	local Sliders = {
		dragging = false,
		Title = Options.Title or '',
		Min = Options.Min or 0.1,
		Max = Options.Max or 1,
		Default = math.clamp(Options.Default or 0.5, Options.Min or 0.1, Options.Max or 1),
		Floor = Options.Floor or false,
		Callback = Options.Callback or function() end
	}

	local mainColor = Color3.fromRGB(213, 55, 102)

	local Slider = Library:Create("Frame", {
		Name = "Slider",
		Parent = Container,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 30),
		BorderSizePixel = 0
	})

	Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 2),
		Parent = Slider
	})

	local ValueFrame2 = Library:Create("Frame", {
		Name = "Track",
		Parent = Slider,
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundColor3 = Color3.fromRGB(45, 45, 45),
		Position = UDim2.new(1, -5, 0.5, 0),
		Size = UDim2.new(0.3, 0, 0, 2),
		BorderSizePixel = 0
	})

	Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 5),
		Parent = ValueFrame2
	})

	local ValueFrame = Library:Create("Frame", {
		Name = "ValueIndicator",
		Parent = ValueFrame2,
		BackgroundColor3 = mainColor,
		Size = UDim2.new(0, 0, 1, 0),
		BorderSizePixel = 0
	})

	Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 5),
		Parent = ValueFrame
	})

	local SliderCircle = Library:Create("Frame", {
		Name = "Handle",
		Parent = ValueFrame,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = mainColor,
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(0, 10, 0, 10),
		BorderSizePixel = 0
	})

	Library:Create("UICorner", {
		CornerRadius = UDim.new(1, 0),
		Parent = SliderCircle
	})

	local ValueDisplay = Library:Create("TextBox", {
		Name = "ValueDisplay",
		Parent = Slider,
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.6, 10, 0.5, 0),
		Size = UDim2.new(0, 46, 0, 15),
		FontFace = Library.Font,
		Text = tostring(Sliders.Default),
		TextColor3 = Color3.fromRGB(142, 144, 150),
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Right,
		BorderSizePixel = 0
	})

	local SliderTitle = Library:Create("TextLabel", {
		Name = "Title",
		Parent = Slider,
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 0, 0),
		FontFace = Library.Font,
		Text = Sliders.Title,
		TextColor3 = Color3.fromRGB(142, 144, 150),
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
		BorderSizePixel = 0
	})

	table.insert(TableUIColors, {
		['Text'] = {
			SliderTitle,
			ValueDisplay
		}
	})

	table.insert(TableUIColors, {
		['Slider'] = {
			SliderCircle,
			ValueFrame
		}
	})

	local initialRatio = (Sliders.Default - Sliders.Min) / (Sliders.Max - Sliders.Min)
	ValueFrame:TweenSize(UDim2.new(initialRatio, 0, 1, 0), "Out", "Back", 0.2, true)
	Sliders.Callback(Sliders.Default)

	local function updateSliderValue(value)
		value = math.clamp(value, Sliders.Min, Sliders.Max)
		local ratio = (value - Sliders.Min) / (Sliders.Max - Sliders.Min)
		ValueFrame:TweenSize(UDim2.new(ratio, 0, 1, 0), "Out", "Sine", 0.2, true)

		local displayValue = value
		if Sliders.Floor then
			displayValue = tonumber(string.format("%.1f", value))
		else
			displayValue = tonumber(string.format("%.1f", value))
		end

		ValueDisplay.Text = tostring(displayValue)
		Sliders.Callback(displayValue)
		return displayValue
	end

	ValueDisplay.FocusLost:Connect(function()
		local value = tonumber(ValueDisplay.Text)
		if not value then
			value = Sliders.Default
		end
		updateSliderValue(value)
	end)

	local UserInputService = game:GetService("UserInputService")

	local function move(input)
		local trackPos = ValueFrame2.AbsolutePosition.X
		local trackSize = ValueFrame2.AbsoluteSize.X
		local relativeX = math.clamp((input.Position.X - trackPos) / trackSize, 0, 1)
		local value = (relativeX * (Sliders.Max - Sliders.Min)) + Sliders.Min
		updateSliderValue(value)
	end

	SliderCircle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			Sliders.dragging = true
		end
	end)

	SliderCircle.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			Sliders.dragging = false
		end
	end)

	ValueFrame2.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			Sliders.dragging = true
			move(input)
		end
	end)

	ValueFrame2.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			Sliders.dragging = false
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if Sliders.dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			move(input)
		end
	end)

	return Sliders
end
Component.AddImage = function(Container, Options)
	local Images = {
		API = Options.API or false,
		Discription = Options.Discription or '',
		Image = Options.Image or 0,
		Title = Options.Title or ''
	}

	local Image = Library:Create("Frame", {
		Name = "Image",
		Parent = Container,
		BackgroundColor3 = Color3.fromRGB(27, 27, 27),
		BackgroundTransparency = 0.600,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Position = UDim2.new(0, 0, 0.311646491, 0),
		Size = UDim2.new(1, 0, 0, 127)
	})

	local UICorner = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 2),
		Parent = Image
	})

	local NameIcon = Library:Create("TextLabel", {
		Name = "NameIcon",
		Parent = Image,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.899999976, 0),
		Size = UDim2.new(1, 0, 0.151999995, 0),
		FontFace = Library.Font,
		Text = Images.Discription,
		TextColor3 = Color3.fromRGB(185, 185, 185),
		TextSize = 12.000,
		TextWrapped = true
	})

	local Title = Library:Create("TextLabel", {
		Name = "Title",
		Parent = Image,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.100000001, 0),
		Size = UDim2.new(1, 0, 0.151999995, 0),
		FontFace = Library.Font,
		Text = Images.Title,
		TextColor3 = Color3.fromRGB(185, 185, 185),
		TextSize = 12.000,
		TextWrapped = true
	})

	local ImageIcon = Library:Create("ImageLabel", {
		Name = "ImageIcon",
		Parent = Image,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.493066698, 0, 0.5, 0),
		Size = UDim2.new(0, 50, 0, 50),
		Image = "rbxassetid://16917322600"
	})

	table.insert(TableUIColors, {
		['Text'] = {
			Title,
			NameIcon
		}
	})

	if Images.API then
		--[[local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		local length = 20
		local randomString = ""
		math.randomseed(os.time())
		local charTable = {}
		for c in chars:gmatch "." do
			table.insert(charTable, c)
		end
		for i = 1, length do
			randomString = randomString .. charTable[math.random(1, #charTable)]
		end
		ImageIcon.Image = GetImage("Image".. randomString, Images.Image)]]
	else
		ImageIcon.Image = "rbxassetid://".. Images.Image
	end

end

local TapS 
Window.Create = function()
	local Shadow = Library:Create("ImageLabel", {
		Name = "Shadow",
		Parent = NormalHub,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(15, 15, 15),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		ClipsDescendants = true,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 679, 0, 392),
		SizeConstraint = Enum.SizeConstraint.RelativeYY,
		ZIndex = -11,
		Image = "rbxassetid://7912134082",
		ImageColor3 = Color3.fromRGB(15, 15, 15),
		ImageTransparency = 0.300,
		SliceCenter = Rect.new(95, 95, 205, 205),
	})

	local RGBColor = Library:Create("UIGradient", {
		Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), 
			ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)), 
			ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)), 
			ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)), 
			ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)), 
			ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)), 
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
		},
		Rotation = 180,
		Parent = Shadow,
		Enabled = false
	})

	local Main = Library:Create("ImageLabel",{
		Name = "Main",
		Parent = Shadow,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(15, 15, 15),
		BackgroundTransparency = tonumber(userSettings.GameSettings.SavedQualityLevel.Value) >= 8 and 0.1 or 0,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		ClipsDescendants = true,
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0.9, 0, 0, 0)
	})

	local UICorner = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 5),
		Parent = Main,
	})

	local ResizeFrame = Library:Create("Frame", {
		Parent = Main,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.1, 0, 0.1, 0),
		Position = UDim2.new( 1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0
	})

	local getFramBlur = function()
		for i,v in next, Main:GetChildren() do if v:GetAttribute('NormolHub') then return v end end
		return nil
	end

	local BlurShadow
	local function setBackground()
		while true do
			if RGBColor.Enabled then
				removeBlur()
				Main.BackgroundTransparency = 0
				return
			end
			if tonumber(userSettings.GameSettings.SavedQualityLevel.Value) >= 8 then
				if not BlurShadow and Shadow.Visible then
					BlurShadow = Library.Blur:BlurFrame(Main)
					BlurShadow[1]:SetAttribute('NormolHub', true)
					BlurShadow[2]:SetAttribute('NormolHub', true)
				end
			else
				BlurShadow = nil
				removeBlur()
				getFramBlur():Destroy()
			end
			TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				BackgroundTransparency = tonumber(userSettings.GameSettings.SavedQualityLevel.Value) >= 8 and 0.05 or 0,
			}):Play()
			task.wait(2)
		end
	end

	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0.9, 0, 0.9, 0)
	}):Play()

	_G.LoadBackground = task.spawn(setBackground)

	local Top = Library:Create("Frame", {
		Name = "Top",
		Parent = Main,
		BackgroundColor3 = Color3.fromRGB(17, 17, 17),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 35),
	})

	Library:MakeDragable(Top, Shadow)

	local UICorner = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 5),
		Parent = Top,
	})

	local Cut = Library:Create("Frame", {
		Name = "Cut",
		Parent = Top,
		BackgroundColor3 = Color3.fromRGB(17, 17, 17),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, 10),
		Size = UDim2.new(1, 0, 0, 25),
	})

	local ProductLogo = Library:Create("ImageLabel", {
		Name = "ProductLogo",
		Parent = Top,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 30, 0.5, 0),
		Size = UDim2.new(0, 20, 0, 20),
		ZIndex = 2,
		Image = "rbxassetid://90238093188663"
	})

	local TabContainer = Library:Create("Frame", {
		Name = "TabContainer",
		Parent = Top,
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(1, -15, 0.5, 1),
		Size = UDim2.new(0.6, 0, 0, 30),
		ZIndex = 2
	})

	local UICorner_2 = Library:Create("UICorner", {
		Parent = TabContainer
	})

	local TabScroll = Library:Create("ScrollingFrame",{
		Name = "TabScroll",
		Parent = TabContainer,
		Active = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, .5, 0),
		Size = UDim2.new(1, 0, 0, 25),
		ScrollingDirection = Enum.ScrollingDirection.X,
		CanvasSize = UDim2.new(2, 0, 0, 0),
		ScrollBarThickness = 0
	})

	local UIPadding = Library:Create("UIPadding", {
		Parent = TabScroll,
		PaddingTop = UDim.new(0, 1)
	})

	local UIListLayout = Library:Create("UIListLayout", {
		Parent = TabScroll,
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 3)
	})

	UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		TabScroll.CanvasSize = UDim2.new(0, UIListLayout.AbsoluteContentSize.X + 35, 0, 0)
	end)

	local ProductName = Library:Create("TextLabel", {
		Name = "ProductName",
		Parent = Top,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 50, 0.220666334, 0),
		Size = UDim2.new(0, 200, 0, 19),
		FontFace = Library.Font,
		Text = "Exclusive Hub | Premium Script",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 12.000,
		TextXAlignment = Enum.TextXAlignment.Left
	})

	local Container = Library:Create("Frame", {
		Name = "Container",
		Parent = Main,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.5, 20),
		Size = UDim2.new(1, 0, 1, -30),
	})

	local Search = Library:Create("Frame", {
		Name = "Search",
		Parent = Container,
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundColor3 = Color3.fromRGB(20, 20, 20),
		BackgroundTransparency = 0.600,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Position = UDim2.new(0.5, 0, 0, 10),
		Size = UDim2.new(1, -40, 0, 30),
	})

	Search.Visible = true

	local UICorner = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 5),
		Parent = Search,
	})

	local Searchicon = Library:Create("ImageLabel", {
		Name = "Search icon",
		Parent = Search,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 10, 0.457665682, 0),
		Size = UDim2.new(0, 10, 0, 10),
		Image = "rbxassetid://82658488651944"
	})

	local TextBox = Library:Create("TextBox", {
		Parent = Search,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.516633153, 0, 0.499999434, 0),
		Size = UDim2.new(0.9, 0, 0, 10),
		Font = Enum.Font.SourceSans,
		PlaceholderColor3 = Color3.fromRGB(116, 116, 116),
		PlaceholderText = "Search ...",
		Text = "",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextScaled = true,
		TextSize = 14.000,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	local PageContainer = Library:Create("Frame",{
		Name = "PageContainer",
		Parent = Container,
		BackgroundColor3 = Color3.fromRGB(15, 15, 15), -- 15
		BackgroundTransparency = 0.900,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, 40),
		Size = UDim2.new(1, 0, 1, -55),
	})

	inputService.InputBegan:Connect(function(input)
		if input.KeyCode == (Func.Options.UiSetting.Keybind or Enum.KeyCode.LeftControl)  then
			local BlurFrame = getFramBlur()
			Shadow.Visible = not Shadow.Visible
			print(BlurFrame)
			if BlurFrame then
				BlurFrame.Position = Shadow.Visible and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(5, 0, 0.5, 0)
			end
		end
	end)

	if par:FindFirstChild("CloseUI") then for i,v in pairs(par:GetChildren()) do if v.Name == "CloseUI" then v:Destroy() end end end
	if inputService.TouchEnabled then
		local CloseUI = Library:Create("ScreenGui",{
			Name = "CloseUI",
			Parent = par,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		})

		local CloseUIMain = Library:Create("Frame", {
			Name = "CloseUIMain",
			Parent = CloseUI,
			BackgroundColor3 = Color3.fromRGB(15, 15, 15),
			BorderColor3 = Color3.new(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0.0319926888, 0, 0.129, 0),
			Size = UDim2.new(0, 75, 0, 0)
		});CloseUIMain:TweenSize(UDim2.new(0, 75, 0, 51),"Out","Back",3.5,false)

		local Logo = Library:Create("ImageLabel", {
			Name = "Logo",
			Parent = CloseUIMain,
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0.323333323, 0, 0.235294119, 0),
			Size = UDim2.new(0.349999994, 0, 0.5, 0),
			Image = "rbxassetid://90238093188663"
		})

		local UICorner = Library:Create("UICorner", {
			Parent = CloseUIMain,
			CornerRadius = UDim.new(0, 100)
		})

		local Use = Library:Create("TextButton",{
			Name = "Use",
			Parent = CloseUIMain,
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0, 0, 0),
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			Font = Enum.Font.SourceSans,
			Text = "",
			TextColor3 = Color3.new(0, 0, 0),
			TextSize = 14
		})

		Use.MouseButton1Click:Connect(function()
			local BlurFrame = getBlur()
			Shadow.Visible = not Shadow.Visible
			if BlurFrame then
				BlurFrame.Enabled = Shadow.Visible
			end
		end)
	end

	local isResizing = false
	local startSize, startPos, startMousePos, Containerstart

	local function Resize(input)
		local sizemove = function()
			local delta = input.Position - startMousePos
			local newSizeX = math.max(413, startSize.X.Offset + delta.X)
			local newSizeY = math.max(305, startSize.Y.Offset + delta.Y)
			Shadow.Size = UDim2.new(startSize.X.Scale, newSizeX, startSize.Y.Scale, newSizeY)
			local newPosX = startPos.X.Offset + (delta.X / 2)
			local newPosY = startPos.Y.Offset + (delta.Y / 2)
			Shadow.Position = UDim2.new(startPos.X.Scale, newPosX, startPos.Y.Scale, newPosY)

			-- if Shadow.Size.Y.Offset >= 650 then
			-- 	Search.Visible = true
			-- else
			-- 	Search.Visible = false
			-- end
		end
		if Shadow.Size.X.Offset > 412 or Shadow.Size.Y.Offset > 304 then
			sizemove()
		end
		if Shadow.Size.X.Offset < 413 or Shadow.Size.Y.Offset < 305 then
			return
		end
		sizemove()
	end

	ResizeFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			isResizing = true
			startSize = Shadow.Size
			startPos = Shadow.Position
			startMousePos = input.Position
		end
	end)

	inputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			isResizing = false
		end
	end)

	inputService.InputChanged:Connect(function(input)
		if isResizing and input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			Resize(input)
		end
	end)

	local TapCheck = false
	Func.AddTab = function(options)
		local Title = options.Title

		local Tab = Library:Create("Frame", {
			Name = "Tab",
			Parent = TabScroll,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, -6.52084964e-07, 0),
			Size = UDim2.new(0, 70, 0, 21)
		})

		local Button = Library:Create("TextButton", {
			Name = "Button",
			Parent = Tab,
			BackgroundTransparency = 1.00,
			Text = "",
			Size = UDim2.new(1, 0, 1, 0)
		})

		local UICner_3 = Library:Create("UICorner", {
			Parent = Tab
		})

		local TextLabel = Library:Create("TextLabel", {
			Parent = Tab,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			FontFace = Library.Font,
			Text = Title or "Generals",
			TextColor3 = Color3.fromRGB(142, 144, 150),
			TextSize = 12.000
		})

		table.insert(TableUIColors, {
			['Text'] = {
				TextLabel,
			}
		})

		local Page = Library:Create("Frame",{
			Name = "Page",
			Parent = PageContainer,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, 0),
			Visible = false,
			Size = UDim2.new(1, 0, 1, 0),
		})

		if not TapCheck then
			TapCheck = true
			Page.Visible = TapCheck
			TextLabel.TextColor3 = Color3.fromRGB(255,255,255)
			TapS = TextLabel
		end

		local Left = Library:Create("ScrollingFrame",{
			Name = "Left",
			Parent = Page,
			Active = true,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(0.5, -1.5, 1, 0),
			ScrollBarThickness = 0,
		})

		local UIListLayout_Left = Library:Create("UIListLayout",{
			Parent = Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 5),
		})

		local UIPadding_Left = Library:Create("UIPadding",{
			Parent = Left,
			PaddingTop = UDim.new(0, 5),
			PaddingBottom = UDim.new(0, 5),
			PaddingLeft = UDim.new(0, 5),
			PaddingRight = UDim.new(0, 5),
		})

		local Right = Library:Create("ScrollingFrame",{
			Name = "Right",
			Parent = Page,
			Active = true,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0.5, 1.5, 0, 0),
			Size = UDim2.new(0.5, -1.5, 1, 0),
			ScrollBarThickness = 0,
		})

		local UIListLayout_Right = Library:Create("UIListLayout",{
			Parent = Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 5),
		})

		local UIPadding_Right = Library:Create("UIPadding",{
			Parent = Right,
			PaddingTop = UDim.new(0, 5),
			PaddingBottom = UDim.new(0, 5),
			PaddingLeft = UDim.new(0, 5),
			PaddingRight = UDim.new(0, 5),
		})

		UIListLayout_Left:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			Left.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_Left.AbsoluteContentSize.Y + 10)
		end)

		UIListLayout_Right:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			Right.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_Right.AbsoluteContentSize.Y + 10)
		end)

		local PagePadding = Library:Create("UIPadding",{
			Parent = Page,
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 5),
			PaddingBottom = UDim.new(0, 5)
		})

		Button.Activated:Connect(function()
			for i,v in ipairs(PageContainer:GetChildren()) do if v:IsA('Frame') then v.Visible = false end end
			for i,v in ipairs(TabScroll:GetChildren()) do if v:IsA('Frame') then v.TextLabel.TextColor3 = Func.Options.UiSetting.Color.ColorText or Color3.fromRGB(142, 144, 150) end end
			TextLabel.TextColor3 = Func.Options.UiSetting.Color.TapColor or Color3.fromRGB(255,255,255)
			Page.Visible = true
			TapS = TextLabel
		end)

		local GetType = function(value)
			if value == 1 or value == "Left" then
				return Left
			elseif value == 2 or value == "Right" then
				return Right
			else
				return Left
			end
		end

		Func.setPage = {}
		Func.setPage.CreatePage = function(options)
			local Side = options.Side

			local Sections = Library:Create("Frame",{
				Name = "Sections",
				Parent = GetType(Side),
				BackgroundColor3 = Color3.fromRGB(15, 15, 15),
				BackgroundTransparency = 1.000,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, -1, 0),
				Size = UDim2.new(1.00000012, 0, 0, 100),
			})

			local UIPadding = Library:Create("UIPadding",{
				Parent = Sections,
				PaddingLeft = UDim.new(0, 5),
				PaddingRight = UDim.new(0, 5),
				PaddingTop = UDim.new(0, 5)
			})

			local UIListLayout = Library:Create("UIListLayout",{
				Parent = Sections,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 5),
			})

			UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				Sections.Size = UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + 30)
			end)

			Func.setMain = {}
			Func.setMain.CreateButton = function(options)
				return Component.AddButton(Sections, {
					Title = options.Name,
					Callback  = options.Callback 
				})
			end

			Func.setMain.CreateDropdown = function(options)
				return Component.AddDropdown(Sections, {
					Title = options.Name,
					Default = options.Value,
					List = options.List,
					Multi = options.Multi,
					Callback  = options.Callback 
				})
			end	

			Func.setMain.CreateToggle = function(options)
				return Component.AddToggle(Sections, {
					Title = options.Name,
					Default = options.Value,
					Callback  = options.Callback 
				})
			end

			Func.setMain.CreateColorPicker = function(options)
				return Component.AddColorPicker(Sections, {
					Title = options.Name,
					Default = options.Value,
					Callback  = options.Callback 
				})
			end

			Func.setMain.CreateLable = function(options)
				return Component.AddLabel(Sections, {
					Title = options.Name,
				}, options.NeedLine)
			end

			Func.setMain.CreateInput = function(options)
				return Component.AddInput(Sections, {
					Title = options.Name,
					Default = options.Value,
					PlaceholderText = options.PlaceholderText or '',
					Callback  = options.Callback
				})
			end

			Func.setMain.CreateKeybind = function(options)
				return Component.AddKeybind(Sections, {
					Title = options.Name,
					Default = options.Value,
					Callback  = options.Callback
				})
			end

			Func.setMain.CreateSlider = function(options)
				return Component.AddSlider(Sections, {
					Title = options.Name,
					Min = options.Min,
					Max = options.Max,
					Floor = options.Floor,
					Default = options.Value,
					Callback  = options.Format or options.Callback
				})
			end

			Func.setMain.CreateImage = function(options)
				return Component.AddImage(Sections, {
					Title = options.Name,
					Discription = options.Dis,

					Image = options.Image,
					API = options.API
				})
			end

			return Func.setMain
		end
		return Func.setPage 
	end

	local ShadowDef = Shadow.ImageColor3
	Func.UpdateUIColor = function()
		Func.Options.UiSetting.Color = {
			MainColor = Func.Options.UiSetting.Color.MainColor or Color3.fromRGB(213, 55, 102),
			MainBackground = Func.Options.UiSetting.Color.MainBackground or Color3.fromRGB(15, 15, 15),
			MinBackground = Func.Options.UiSetting.Color.MinBackground or Color3.fromRGB(17, 17, 17),
			ShadowColor = Func.Options.UiSetting.Color.ShadowColor or Color3.fromRGB(15, 15, 15),
			ColorText = Func.Options.UiSetting.Color.ColorText or Color3.fromRGB(142, 144, 150),
			TapColor = Func.Options.UiSetting.Color.TapColor or Color3.fromRGB(255, 255, 255)
		}

		for i,v in next, TableUIColors do
			if typeof(v) == 'table' then
				for i,v in next, v do
					local uptextcolor = Func.Options.UiSetting.Color.ColorText
					local updateColor = Func.Options.UiSetting.Color.MainColor
					if i == 'Toggle' then
						v[1].ImageColor3 = updateColor
						v[2].Color = updateColor
					elseif i == 'Input' then
						v[1].Color = updateColor
					elseif i == 'Slider' then
						v[1].BackgroundColor3 = updateColor
						v[2].BackgroundColor3 = updateColor
					elseif i == 'Text' then
						if typeof(v) == 'table' then
							for i,v in next, v do
								v.TextColor3 = uptextcolor
							end
						end
					end
				end
			end
		end

		ShadowDef = Func.Options.UiSetting.Color.ShadowColor
		Main.BackgroundColor3 = Func.Options.UiSetting.Color.MainBackground
		TabContainer.BackgroundColor3 = Func.Options.UiSetting.Color.MainBackground
		TapS = Func.Options.UiSetting.Color.TapColor
		Top.BackgroundColor3 = Func.Options.UiSetting.Color.MinBackground
		Cut.BackgroundColor3 = Func.Options.UiSetting.Color.MinBackground
	end

	local tweenService = game:GetService("TweenService")
	local function tweenColor( object, startColor, endColor, duration)
		local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
		local goal = { ImageColor3 = endColor }
		local tween = tweenService:Create(object, tweenInfo, goal)
		tween:Play()
		tween.Completed:Wait()
	end

	local ShadowTransparency = Func.Options.UiSetting.ShadowTransparency or 72

	local function adjustColorBrightness(value, intensity)
		local adjustedValue = math.clamp(255 - value * intensity, 50, 255) 
		return adjustedValue
	end

	local normalizedTransparency = adjustColorBrightness(ShadowTransparency, 1.2)
	local rainbowColors = {
		Color3.fromRGB(normalizedTransparency, 0, 0),
		Color3.fromRGB(normalizedTransparency, normalizedTransparency - 30, 0),
		Color3.fromRGB(normalizedTransparency, normalizedTransparency, 0),
		Color3.fromRGB(0, normalizedTransparency, 0),
		Color3.fromRGB(0, 0, normalizedTransparency),
		Color3.fromRGB(normalizedTransparency, 0, normalizedTransparency - 30),
		Color3.fromRGB(normalizedTransparency, 0, normalizedTransparency)
	}

	_G.RGPTColor = task.spawn(function()
		while task.wait(1) do
			pcall(function()
				local object = Shadow
				if RGBColor.Enabled then
					tweenColor(object, object.ImageColor3, Color3.fromRGB(255,255,255), 1)
					return
				end
				if Func.Options.UiSetting.ShadowRanbow then
					ShadowTransparency = Func.Options.UiSetting.ShadowTransparency or 72
					local normalizedTransparency = adjustColorBrightness(ShadowTransparency, 1.2)
					rainbowColors = {
						Color3.fromRGB(normalizedTransparency, 0, 0),
						Color3.fromRGB(normalizedTransparency, normalizedTransparency - 30, 0),
						Color3.fromRGB(normalizedTransparency, normalizedTransparency, 0),
						Color3.fromRGB(0, normalizedTransparency, 0),
						Color3.fromRGB(0, 0, normalizedTransparency),
						Color3.fromRGB(normalizedTransparency, 0, normalizedTransparency - 30),
						Color3.fromRGB(normalizedTransparency, 0, normalizedTransparency)
					}

					for i, nextColor in ipairs(rainbowColors) do
						if not Func.Options.UiSetting.ShadowRanbow then break end
						tweenColor(object, object.ImageColor3, nextColor, 1)
					end
				else
					tweenColor(object, object.ImageColor3, ShadowDef, 1)
				end
			end)
		end
	end)

	local LGPTNum = 0
	local rotationSpeed = 1
	local targetRotation = 0
	local smoothFactor = 0.01   -- How smooth the rotation is (lower value = smoother)

	_G.RGPTColor2 = task.spawn(function()
		while true do task.wait()
			local object = Shadow
			if Func.Options.UiSetting.ShadowRanbowV2 then
				if Func.Options.UiSetting.RGBDD == "Left" then
					targetRotation = LGPTNum - _G.LGPTQTime
				else
					targetRotation = LGPTNum + _G.LGPTQTime
				end
				RGBColor.Rotation = math.lerp(RGBColor.Rotation, targetRotation, smoothFactor)
				LGPTNum = targetRotation
			end
		end
	end)

	Func.ApplyTheme = function(Window, Options)
		assert(Window, "Missing Window.")
		local SettingsTap = Window.AddTab({
			Title = "Settings"
		})

		local SettingsLeft = SettingsTap.CreatePage({
			Side = "Left"
		})

		SettingsLeft.CreateLable({
			Name = "User interfaces"
		}):SetFontSize(20)

		SettingsLeft.CreateKeybind({
			Name = "Toggle UI Key",
			Value = Options.UiSetting.Keybind,
			Callback = function(v)
				Options.UiSetting.Keybind = v
			end,
		})

		SettingsLeft.CreateColorPicker({
			Name = "Tab Text Color",
			Value = Color3.fromRGB(241, 245, 255),
			Callback = function(v)
				Func.Options.UiSetting.Color.TapColor = v
				Window.UpdateUIColor()
			end,
		})

		SettingsLeft.CreateColorPicker({
			Name = "Text Color",
			Value = Color3.fromRGB(142, 144, 150),
			Callback = function(v)
				Options.UiSetting.Color.ColorText = v
				Window.UpdateUIColor()
			end,
		})

		SettingsLeft.CreateColorPicker({
			Name = "Main Color",
			Value = Color3.fromRGB(213, 55, 102),
			Callback = function(v)
				Options.UiSetting.Color.MainColor = v
				Window.UpdateUIColor()
			end,
		})

		SettingsLeft.CreateColorPicker({
			Name = "Main Background Color",
			Value = Color3.fromRGB(15, 15, 15),
			Callback = function(v)
				Options.UiSetting.Color.MainBackground = v
				Window.UpdateUIColor()
			end,
		})

		SettingsLeft.CreateColorPicker({
			Name = "Min Background Color",
			Value = Color3.fromRGB(17, 17, 17),
			Callback = function(v)
				Options.UiSetting.Color.MinBackground = v
				Window.UpdateUIColor()
			end,
		})

		SettingsLeft.CreateColorPicker({
			Name = "Drop Shadow Color",
			Value = Color3.fromRGB(15, 15, 15),
			Callback = function(v)
				Options.UiSetting.Color.ShadowColor = v
				Window.UpdateUIColor()
			end,
		})

		SettingsLeft.CreateToggle({
			Name = "Rainbow Color Change",
			Callback = function(v)
				Options.UiSetting.ShadowRanbow = v
			end,
		})

		SettingsLeft.CreateToggle({
			Name = "Rainbow Color Change V2",
			Callback = function(v)
				local object = Shadow
				RGBColor.Enabled = v
				Options.UiSetting.ShadowRanbowV2 = v
				tweenColor(object, object.ImageColor3, ShadowDef, 1)
			end,
		})

		local Dropdown = SettingsLeft.CreateDropdown({
			Name = "RGB Direction",
			List = {
				'Left',
				'Right'
			},
			Value = 'Right',
			Multi = false,
			Callback = function(v)
				Options.UiSetting.RGBDD = v
			end,
		})

		SettingsLeft.CreateSlider({
			Name = "RGB Speed",
			Max = 10,
			Min = 0,
			Value = 2,
			Floor = true,
			Callback = function(v)
				_G.LGPTQTime = v
			end,
		})

		SettingsLeft.CreateSlider({
			Name = "Shadow Transparency",
			Max = 255,
			Min = 1,
			Value = 1,
			Callback = function(v)
				Options.UiSetting.ShadowTransparency = 256 - v
				Window.UpdateUIColor()
			end,
		})

		return SettingsTap
	end

	return Func
end
return Window
