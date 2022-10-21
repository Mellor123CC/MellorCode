game.Players.LocalPlayer.Character.Humanoid.MaxHealth = 10000

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("MellorCode", "RJTheme3")

local Tab = Window:NewTab("Player")

local Section = Tab:NewSection("Settings")


Section:NewSlider("WalkSpeed", "Look how fast I can run!", 500, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewSlider("JumpPower", "Look how high I jump!", 500, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

Section:NewTextBox("HipHeight", "You're getting bigger", function(txt)
	game:GetService("Workspace").zwe1231.Humanoid.HipHeight = txt
end)

Section:NewTextBox("InfinityHealth", "GodMode v2?", function(txt)
    game.Players.LocalPlayer.Character.Humanoid.Health = txt
end)


Section:NewToggle("Noclip", "Walking through walls", function(state)
    if state then
        char = game.Players.LocalPlayer.Character
while true do 
if noclip == true then
for _,v in pairs(char:children()) do
pcall(function()
if v.className == "Part" then
v.CanCollide = false
end
end)
end
end
game:service("RunService").Stepped:wait()
end
    else
        char = game.Players.LocalPlayer.Character -- Gets your player
while true do -- Make sure someone is in game
if noclip == true then
for _,v in pairs(char:children()) do
pcall(function()
if v.className == "Part" then
v.CanCollide = false
end
end)
end
end
game:service("RunService").Stepped:wait()
end
    end
end)

Section:NewButton("ClickTP", "Teleport to the point that you click", function()
    mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Click Teleport"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
end)

Section:NewToggle("InfinityJump", "InfinityJumping", function(state)
    if state then
        local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
    else
        local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
    end
end)

local Tab = Window:NewTab("Murder Mystery 2")

local Section = Tab:NewSection("Settings")

Section:NewToggle("Aimbot", "Aimbot", function(state)
    if state then
        getgenv().AimPart = "Head" 
getgenv().ThirdPerson = false 
getgenv().FirstPerson = true 
getgenv().WallCheck = false 
getgenv().TeamCheck = true

loadstring(game:HttpGet("https://raw.githubusercontent.com/zxciaz/Universal-Scripts/main/Aimbot", true))()
    else
        getgenv().AimPart = "Head" 
getgenv().ThirdPerson = false 
getgenv().FirstPerson = true 
getgenv().WallCheck = false 
getgenv().TeamCheck = true 
 
loadstring(game:HttpGet("https://raw.githubusercontent.com/zxciaz/Universal-Scripts/main/Aimbot", true))()
    end
end)


local Tab = Window:NewTab("Render")

local Section = Tab:NewSection("Settings")

Section:NewToggle("ESP", "ESP", function(state)
    if state then
        while wait(0.5) do
    for i, childrik in ipairs(workspace:GetDescendants()) do
        if childrik:FindFirstChild("Humanoid") then
            if not childrik:FindFirstChild("EspBox") then
                if childrik ~= game.Players.LocalPlayer.Character then
                    local esp = Instance.new("BoxHandleAdornment",childrik)
                    esp.Adornee = childrik
                    esp.ZIndex = 0
                    esp.Size = Vector3.new(4, 5, 1)
                    esp.Transparency = 0.65
                    esp.Color3 = Color3.fromRGB(255,48,48)
                    esp.AlwaysOnTop = true
                    esp.Name = "EspBox"
                end
            end
        end
    end
end
    else
        while wait(0.5) do
    for i, childrik in ipairs(workspace:GetDescendants()) do
        if childrik:FindFirstChild("Humanoid") then
            if not childrik:FindFirstChild("EspBox") then
                if childrik ~= game.Players.LocalPlayer.Character then
                    local esp = Instance.new("BoxHandleAdornment",childrik)
                    esp.Adornee = childrik
                    esp.ZIndex = 0
                    esp.Size = Vector3.new(4, 5, 1)
                    esp.Transparency = 0.65
                    esp.Color3 = Color3.fromRGB(255,48,48)
                    esp.AlwaysOnTop = true
                    esp.Name = "EspBox"
                end
            end
        end
    end
end
    end
end)

Section:NewToggle("Tracer", "Not info", function(state)
    if state then
        local loPlayer = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint

_G.TeamCheck = true

for i,v in pairs(game.Players:GetChildren()) do
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    function tracer()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= loPlayer and v.Character.Humanoid.Health > 0 then
                local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                if OnScreen then
                    Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)

                    if _G.TeamCheck and v.TeamColor == loPlayer.TeamColor then

                        Tracer.Visible = false
                    else

                        Tracer.Visible = true
                    end
                else
                    Tracer.Visible = false
                end
            else
                Tracer.Visible = false
            end
        end)
    end
    coroutine.wrap(tracer)()
end

game.Players.PlayerAdded:Connect(function(v)
    local Tracer = Drawing.New("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    function tracer()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= loPlayer and v.Character.Humanoid.Health > 0 then
                local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                if OnScreen then
                    Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)

                    if _G.TeamCheck and v.TeamColor == loPlayer.TeamColor then

                        Tracer.Visible = false
                    else

                        Tracer.Visible = true
                    end
                else
                    Tracer.Visible = false
                end
            else
                Tracer.Visible = false
            end
        end)
    end
    coroutine.wrap(tracer)()
end)
    else
        local loPlayer = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint

_G.TeamCheck = true

for i,v in pairs(game.Players:GetChildren()) do
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    function tracer()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= loPlayer and v.Character.Humanoid.Health > 0 then
                local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                if OnScreen then
                    Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)

                    if _G.TeamCheck and v.TeamColor == loPlayer.TeamColor then

                        Tracer.Visible = false
                    else

                        Tracer.Visible = true
                    end
                else
                    Tracer.Visible = false
                end
            else
                Tracer.Visible = false
            end
        end)
    end
    coroutine.wrap(tracer)()
end

game.Players.PlayerAdded:Connect(function(v)
    local Tracer = Drawing.New("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    function tracer()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= loPlayer and v.Character.Humanoid.Health > 0 then
                local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                if OnScreen then
                    Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)

                    if _G.TeamCheck and v.TeamColor == loPlayer.TeamColor then

                        Tracer.Visible = false
                    else

                        Tracer.Visible = true
                    end
                else
                    Tracer.Visible = false
                end
            else
                Tracer.Visible = false
            end
        end)
    end
    coroutine.wrap(tracer)()
end)
    end
end)



local Tab = Window:NewTab("Fun")

local Section = Tab:NewSection("Settings")

Section:NewButton("SpamBot", "Spamming the chat", function()
    local settings = {
   AutoChat_Time = 1,
   AutoChat_Delay = 1,
   AutoChat = true,
}

local chatrem = game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest

while task.wait(settings.AutoChat_Time) do
    chatrem:FireServer('get good get blinkwinner.pov', "All")
    print("Sent Message")
end
end)

Section:NewButton("SpinBot", "The player is spinning", function()
    power = 500 
 
game:GetService('RunService').Stepped:connect(function()
game.Players.LocalPlayer.Character.Head.CanCollide = false
game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
end)
wait(.1)
local bambam = Instance.new("BodyThrust")
bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
bambam.Force = Vector3.new(power,0,power)
bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
end)

Section:NewButton("AntiAFK", "no kick long time afk", function()
    for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
    v:Disable()
end
end)


