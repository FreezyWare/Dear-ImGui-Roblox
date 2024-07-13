local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")
local viewport = workspace.CurrentCamera.ViewportSize

local function GenerateRandomString(length)
	local chars = {}
	for i = 1, length do
		local char = string.char(math.random(65, 90))
		if math.random() > 0.5 then
			char = string.char(math.random(97, 122))
		end
		table.insert(chars, char)
	end
	return table.concat(chars)
end

local Library = {}

function Library.Create(title, size, flags)
	local window = {}
	window.flags = flags or {NoResize = false, NoCollapse = false}
	
	window["1"] = Instance.new("ScreenGui", runService:IsStudio() and players.LocalPlayer:WaitForChild("PlayerGui") or coreGui);
	window["1"]["IgnoreGuiInset"] = true;
	window["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
	window["1"]["Name"] = string.format("[%s] [%s] [%s]", GenerateRandomString(5), GenerateRandomString(5), GenerateRandomString(5))
	window["1"]["IgnoreGuiInset"] = true

	window["2"] = Instance.new("Frame", window["1"]);
	window["2"]["Active"] = true;
	window["2"]["BorderSizePixel"] = 0;
	window["2"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
	window["2"]["Selectable"] = true;
	window["2"]["AnchorPoint"] = Vector2.new(0, 0);
	window["2"]["ClipsDescendants"] = true;
	window["2"]["Size"] = size or UDim2.new(0, 550, 0, 350);
	window["2"]["Position"] = UDim2.fromOffset((viewport.X/2) - (window["2"].Size.X.Offset / 2), (viewport.Y/2) - (window["2"].Size.Y.Offset / 2));
	window["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	window["2"]["Name"] = string.format("[%s] [%s] [%s]", GenerateRandomString(5), GenerateRandomString(5), GenerateRandomString(5))
	window["2"]["Draggable"] = true

	window["3"] = Instance.new("Frame", window["2"]);
	window["3"]["Active"] = true;
	window["3"]["BorderSizePixel"] = 0;
	window["3"]["BackgroundColor3"] = Color3.fromRGB(42, 75, 123);
	window["3"]["Size"] = UDim2.new(1, 0, 0, 20);
	window["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	window["3"]["Name"] = string.format("[%s] [%s] [%s]", GenerateRandomString(5), GenerateRandomString(5), GenerateRandomString(5))

	window["4"] = Instance.new("Frame", window["3"]);
	window["4"]["Active"] = true;
	window["4"]["BorderSizePixel"] = 0;
	window["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	window["4"]["ClipsDescendants"] = true;
	window["4"]["Size"] = UDim2.new(0.8, 0, 1, 0);
	window["4"]["Position"] = UDim2.new(0, 3, 0, 0);
	window["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	window["4"]["Name"] = string.format("[%s] [%s] [%s]", GenerateRandomString(5), GenerateRandomString(5), GenerateRandomString(5))
	window["4"]["BackgroundTransparency"] = 1;

	window["5"] = Instance.new("UIListLayout", window["4"]);
	window["5"]["Padding"] = UDim.new(0, 3);
	window["5"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
	window["5"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
	window["5"]["FillDirection"] = Enum.FillDirection.Horizontal;

	if not window.flags.NoCollapse then
	window["6"] = Instance.new("Frame", window["4"]);
	window["6"]["Active"] = true;
	window["6"]["BorderSizePixel"] = 0;
	window["6"]["BackgroundColor3"] = Color3.fromRGB(25, 131, 237);
	window["6"]["ClipsDescendants"] = true;
	window["6"]["Size"] = UDim2.new(0, 18, 0, 18);
	window["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	window["6"]["Name"] = string.format("[%s] [%s] [%s]", GenerateRandomString(5), GenerateRandomString(5), GenerateRandomString(5))
	window["6"]["BackgroundTransparency"] = 1;

	window["7"] = Instance.new("UICorner", window["6"]);
	window["7"]["CornerRadius"] = UDim.new(0, 100);

	window["8"] = Instance.new("ImageButton", window["6"]);
	window["8"]["BorderSizePixel"] = 0;
	window["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	window["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	window["8"]["Image"] = [[rbxassetid://18421478126]];
	window["8"]["Size"] = UDim2.new(0, 13, 0, 13);
	window["8"]["BackgroundTransparency"] = 1;
	window["8"]["Name"] = string.format("[%s] [%s] [%s]", GenerateRandomString(5), GenerateRandomString(5), GenerateRandomString(5))
	window["8"]["ClipsDescendants"] = true;
	window["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	window["8"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	
	local toggle = true
	
	window["8"].Activated:Connect(function()
		if toggle then
			toggle = false
			    window["8"].Rotation = -90
				window["2"].Size = UDim2.new(window["2"].Size.X.Scale, window["2"].Size.X.Offset, 0, window["3"].Size.Y.Offset)
			else
				toggle = true
				window["8"].Rotation = 0
				window["2"].Size = size
			end
	end)
	
	window["6"]["MouseEnter"]:Connect(function()
			local goal = {BackgroundTransparency = 0}
			local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local tween = tweenService:Create(window["6"], tweenInfo, goal)
			tween:Play()
		end)
	window["6"]["MouseLeave"]:Connect(function()
			local goal = {BackgroundTransparency = 1}
			local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local tween = tweenService:Create(window["6"], tweenInfo, goal)
			tween:Play()
		end)
	end

	window["9"] = Instance.new("TextLabel", window["4"]);
	window["9"]["Active"] = true;
	window["9"]["BorderSizePixel"] = 0;
	window["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	window["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	window["9"]["TextSize"] = 14;
	window["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	window["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	window["9"]["BackgroundTransparency"] = 1;
	window["9"]["RichText"] = true;
	window["9"]["Size"] = UDim2.new(0.8, 0, 0, 20);
	window["9"]["ClipsDescendants"] = true;
	window["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	window["9"]["Text"] = title or "Dear ImGui Demo"
	window["9"]["Name"] = string.format("[%s] [%s] [%s]", GenerateRandomString(5), GenerateRandomString(5), GenerateRandomString(5))

	if not window.flags.NoResize then
	window["a"] = Instance.new("TextButton", window["2"]);
	window["a"]["LineHeight"] = 1.1;
	window["a"]["BorderSizePixel"] = 0;
	window["a"]["AutoButtonColor"] = false;
	window["a"]["TextTransparency"] = 0.6;
	window["a"]["TextSize"] = 17;
	window["a"]["TextColor3"] = Color3.fromRGB(76, 97, 122);
	window["a"]["Selectable"] = false;
	window["a"]["ZIndex"] = 67;
	window["a"]["AnchorPoint"] = Vector2.new(1, 1);
	window["a"]["Size"] = UDim2.new(0, 18, 0, 18);
	window["a"]["BackgroundTransparency"] = 1;
	window["a"]["Name"] = string.format("[%s] [%s] [%s]", GenerateRandomString(5), GenerateRandomString(5), GenerateRandomString(5))
	window["a"]["Text"] = "◢";
	window["a"]["Position"] = UDim2.new(1, 1, 1, 0);

	window["a"]["MouseEnter"]:Connect(function()
		local goal = {TextColor3 = Color3.fromRGB(67, 151, 251)}
		local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tween = tweenService:Create(window["a"], tweenInfo, goal)
		tween:Play()
	end)
	window["a"]["MouseLeave"]:Connect(function()
		local goal = {TextColor3 = Color3.fromRGB(76, 97, 122)}
		local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tween = tweenService:Create(window["a"], tweenInfo, goal)
		tween:Play()
	end)
	end
	
	return window
end
return Library
