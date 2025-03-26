function generateRandomKey()
    local length = 10
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    local key = "OP_"

    
    for i = 1, length do
        local randomIndex = math.random(1, #chars)
        key = key .. chars:sub(randomIndex, randomIndex)
    end

    return key
end


function copyToClipboard(text)
    local success, message = pcall(function()
        setclipboard(text)
    end)
    
    if success then
        print("คีย์ได้ถูกคัดลอกไปยังคลิปบอร์ด: " .. text)
    else
        print("เกิดข้อผิดพลาดในการคัดลอกข้อความ")
    end
end


local randomKey = generateRandomKey()


copyToClipboard(randomKey)
