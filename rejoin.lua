local function rejoin()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end

wait(2) -- ตั้งเวลารีจอยเดี่ยวตั้งให้2วิ
rejoin()
