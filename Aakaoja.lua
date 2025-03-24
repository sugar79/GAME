local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
local CloseButton = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- ตั้งค่า ImageLabel (ภาพเต็มหน้าจอ)
ImageLabel.Parent = ScreenGui
ImageLabel.Size = UDim2.new(1, 0, 1, 0)
ImageLabel.Position = UDim2.new(0, 0, 0, 0)
ImageLabel.Image = "rbxassetid://111311683582193"
ImageLabel.BackgroundTransparency = 1
ImageLabel.ScaleType = Enum.ScaleType.Crop


CloseButton.Parent = ScreenGui
CloseButton.Size = UDim2.new(0, 50, 0, 50)
CloseButton.Position = UDim2.new(1, -60, 0, 10)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 30
CloseButton.BorderSizePixel = 0

-- กดปุ่มแล้วปิด UI
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy() -- ปิด UI ทิ้งไปเลย
end)
