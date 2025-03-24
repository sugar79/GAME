local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
local Sound = Instance.new("Sound")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- ตั้งค่า ImageLabel (ภาพ Jeff the Killer)
ImageLabel.Parent = ScreenGui
ImageLabel.Size = UDim2.new(1, 0, 1, 0)
ImageLabel.Position = UDim2.new(0, 0, 0, 0)
ImageLabel.Image = "rbxassetid://1234567890" -- ใส่ ID ของภาพ Jeff the Killer
ImageLabel.BackgroundTransparency = 1
ImageLabel.Visible = false -- ซ่อนภาพก่อน

-- ตั้งค่า Sound (เสียงจัมป์สแกร์)
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://0987654321" -- ใส่ ID ของเสียงจัมป์สแกร์
Sound.Volume = 5
Sound.PlayOnRemove = true -- เล่นเสียงเมื่อถูกลบ
Sound.Looped = false

-- ฟังก์ชันแสดงจัมป์สแกร์
local function JumpScare()
    ImageLabel.Visible = true -- แสดงภาพ
    Sound:Play() -- เล่นเสียง
    wait(2) -- แสดง 2 วินาที
    ScreenGui:Destroy() -- ลบ UI ออกไป
end

-- รอ 5 วินาทีแล้วจัมป์สแกร์
wait(5)
JumpScare()
