game.Players.LocalPlayer.Character.Humanoid.MaxHealth = 100000000

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("MellorCode Beta", "RJTheme3")

local Tab = Window:NewTab("Player")

local Section = Tab:NewSection("Settings")


Section:NewSlider("WalkSpeed", "Look how fast I can run!", 500, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewButton("WalkSpeed2", "AntiCheat Bypass", function()
while game:GetService("RunService").RenderStepped:wait() do
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 75
end
end)


Section:NewSlider("JumpPower", "Look how high I jump!", 500, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

Section:NewButton("GodMode", "infinityHP", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 100000000
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

local Tab = Window:NewTab("Murder Mystery 2")

local Section = Tab:NewSection("Settings")


Section:NewButton("AutoGrab", "MurderMystery2", function()
    if Toggles.AutoGun.Value and roles[LocalPlayer] == "Innocent" then
            local gundrop = Workspace:FindFirstChild("GunDrop")
            if gundrop and not lastCFrame then
                lastCFrame = character.HumanoidRootPart.CFrame
                task.spawn(pcall, function()
                    repeat
                        character.HumanoidRootPart.CFrame = gundrop.CFrame
                        RunService.Stepped:Wait()
                    until not gundrop:IsDescendantOf(Workspace) or not Toggles.AutoGun.Value
                    character.HumanoidRootPart.CFrame = lastCFrame
                    lastCFrame = false
                end)
            end
        end
end)
    

Section:NewButton("ESP", "Esp murder and sheriff", function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer
local roles

function CreateHighlight()
    for i, v in pairs(Players:GetChildren()) do
        if v ~= LP and v.Character and not v.Character:FindFirstChild("Highlight") then
            Instance.new("Highlight", v.Character)           
        end
    end
end

function UpdateHighlights()
    for _, v in pairs(Players:GetChildren()) do
        if v ~= LP and v.Character and v.Character:FindFirstChild("Highlight") then
            Highlight = v.Character:FindFirstChild("Highlight")
            if v.Name == Sheriff and IsAlive(v) then
                Highlight.FillColor = Color3.fromRGB(0, 0, 225)
            elseif v.Name == Murder and IsAlive(v) then
                Highlight.FillColor = Color3.fromRGB(225, 0, 0)
            elseif v.Name == Hero and IsAlive(v) and not IsAlive(game.Players[Sheriff]) then
                Highlight.FillColor = Color3.fromRGB(255, 250, 0)
            else
                Highlight.FillColor = Color3.fromRGB(0, 225, 0)
            end
        end
    end
end 

function IsAlive(Player)
    for i, v in pairs(roles) do
        if Player.Name == i then
            if not v.Killed and not v.Dead then
                return true
            else
                return false
            end
        end
    end
end



RunService.RenderStepped:connect(function()
    roles = ReplicatedStorage:FindFirstChild("GetPlayerData", true):InvokeServer()
    for i, v in pairs(roles) do
        if v.Role == "Murderer" then
            Murder = i
        elseif v.Role == 'Sheriff'then
            Sheriff = i
        elseif v.Role == 'Hero'then
            Hero = i
        end
    end
    CreateHighlight()
    UpdateHighlights()
end)
end)


Section:NewButton("WhoMurder?", "MurderMystery2", function()
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
    local items = v.Backpack
    if items:FindFirstChild("Knife") then
        print(v.Name .. " Is the murder")
    else if items:FindFirstChild("Gun") then
        print(v.Name .. " Is the sheriff")
    else
        print(v.Name .. " Is innocent")
    end
    end
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

Section:NewButton("Chams", "Chams players", function()
    
local coreGui = game:GetService("CoreGui")
local runService = game:GetService("RunService")

local viewportGui = Instance.new("ScreenGui", coreGui)
viewportGui.IgnoreGuiInset = true

local viewportFrame = Instance.new("ViewportFrame")
viewportFrame.Parent = viewportGui
viewportFrame.CurrentCamera = workspace.CurrentCamera
viewportFrame.BackgroundTransparency = 1
viewportFrame.Size = UDim2.new(1, 0, 1, 0)
viewportFrame.Position = UDim2.new(0, 0, 0, 0)

function clonePart(part, model, character)
   
    if part:IsA("BasePart") then
        local head = character:WaitForChild("Head")

        
        local clone = part:Clone() 

        for _, obj in next, clone:GetChildren() do
            
            if not obj:IsA("SpecialMesh") then
                obj:Destroy()
                continue
            end

            
            obj.TextureId = ""
        end
        clone.Color = Color3.fromRGB(0, 255, 0)
        clone.Parent = model

        
        runService.RenderStepped:connect(function()
            
            if head:IsDescendantOf(workspace) then
                
                local _, visible = workspace.CurrentCamera:WorldToViewportPoint(part.Position)

               
                if visible then
                    
                    clone.CFrame = part.CFrame
                    clone.Size = part.Size
                    clone.Transparency = part.Transparency < 1 and 0 or 1
                else
                    
                    clone.Transparency = 1
                end
            else
                
                model:Destroy()
                return
            end
        end)
    end
end

function chams(character)
    local model = Instance.new("Model")
    model.Name = character.Name
    model.Parent = viewportFrame

    for _, obj in next, character:GetChildren() do
        if character:FindFirstChild("Head") then
            clonePart(obj, model, character)
        end
    end
end


for _, plr in next, game:GetService("Players"):GetChildren() do
    -- get character
    local character = plr.Character or plr.CharacterAdded:Wait()
    character:WaitForChild("Head")

    
    chams(character)

    
    plr.CharacterAdded:connect(function(char)
    
        char:WaitForChild("Head")
        chams(char)
    end)
end

game:GetService("Players").PlayerAdded:connect(function(plr)
    local character = plr.Character or plr.CharacterAdded:Wait()
    character:WaitForChild("Head")
    chams(character)
    
    plr.CharacterAdded:connect(function(char)
        char:WaitForChild("Head")
        chams(char)
    end)
end)
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
    chatrem:FireServer('get good get mellorcode', "All")
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

Section:NewButton("Spam F9", "Check F9", function()
    while game:GetService("RunService").RenderStepped:wait() do
        print("MellorCode SPAAAM")
 end      
end)

