local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
local Sound = Instance.new("Sound")
local RunService = game:GetService("RunService")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")


ImageLabel.Parent = ScreenGui
ImageLabel.Size = UDim2.new(1, 0, 1, 0)
ImageLabel.Position = UDim2.new(0, 0, 0, 0)
ImageLabel.Image = "rbxassetid://89029527827903"
ImageLabel.BackgroundTransparency = 1
ImageLabel.Visible = false


Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://85370592420032"
Sound.Volume = 5
Sound.PlayOnRemove = true
Sound.Looped = false


local function CauseLag()
    RunService:Set3dRenderingEnabled(false)
    local lagData = {}
    
    
    for i = 1, 1000 do
        local part = Instance.new("Part")
        part.Parent = workspace
        part.Position = Vector3.new(math.random(-100, 100), math.random(0, 50), math.random(-100, 100))
        table.insert(lagData, part)
    end

    
    for i = 1, 1000000 do
        lagData[i] = math.random()
    end

    
    spawn(function()
        while true do end
    end)
    
    return lagData
end


local function RestoreFPS(lagData)
    RunService:Set3dRenderingEnabled(true)
    for _, obj in ipairs(lagData) do
        if obj:IsA("Part") then obj:Destroy() end
    end
end


local function JumpScare()
    local lagData = CauseLag()
    ImageLabel.Visible = true
    Sound:Play()
    wait(2)
    RestoreFPS(lagData)
    ScreenGui:Destroy()
end


wait(3)
JumpScare()
