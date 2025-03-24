local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- UI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NoClipUI"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 200, 0, 50)
ToggleButton.Position = UDim2.new(0.5, -100, 0.9, 0)
ToggleButton.Text = "Enable NoClip"
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 25

local isNoClip = false

-- Function to set NoClip state
local function setNoClip(enabled)
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") and part.CanCollide ~= not enabled then
                part.CanCollide = not enabled
            end
        end
    end
end

-- Function to handle button toggle
local function toggleNoClip()
    isNoClip = not isNoClip
    setNoClip(isNoClip)

    if isNoClip then
        ToggleButton.Text = "Disable NoClip"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    else
        ToggleButton.Text = "Enable NoClip"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
end

-- Connect the button click event
ToggleButton.MouseButton1Click:Connect(toggleNoClip)

-- Connect character added event
LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    
    -- Set NoClip based on current state when the character is reset
    setNoClip(isNoClip)
end)

-- Use Heartbeat instead of Stepped for performance
RunService.Heartbeat:Connect(function()
    -- If NoClip is enabled, change CanCollide state
    if isNoClip then
        setNoClip(true)
    end
end)

-- Add Credit UI Text
local CreditLabel = Instance.new("TextLabel")
CreditLabel.Parent = ScreenGui
CreditLabel.Size = UDim2.new(0, 200, 0, 50)
CreditLabel.Position = UDim2.new(1, -220, 0, 10)
CreditLabel.Text = "(by Asanai)"
CreditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditLabel.BackgroundTransparency = 1
CreditLabel.Font = Enum.Font.SourceSansBold
CreditLabel.TextSize = 18
