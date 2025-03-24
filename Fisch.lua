local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui") 
local contentProvider = game:GetService("ContentProvider")

local gui = Instance.new("ScreenGui")
gui.Parent = playerGui 

local imageLabel = Instance.new("ImageLabel")
imageLabel.Parent = gui
imageLabel.Size = UDim2.new(2, 0, 2, 0)
imageLabel.Position = UDim2.new(-0.5, 0, -0.5, 0)
imageLabel.BackgroundTransparency = 0 
imageLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  
imageLabel.ScaleType = Enum.ScaleType.Stretch 
imageLabel.Visible = false 

local imageId = "rbxassetid://YOUR_IMAGE_ID"

local success, err = pcall(function()
    contentProvider:PreloadAsync({imageId})
end)

if success then
    imageLabel.Image = imageId 
    imageLabel.Visible = true 
else
    warn("Error loading image: " .. err)
end
