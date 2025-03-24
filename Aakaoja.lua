local function ReduceFPS()
    RunService:Set3dRenderingEnabled(true)
    local oldStep = RunService.RenderStepped:Connect(function()
        task.wait(1/10)
    end)
    return oldStep
end

local function RestoreFPS(connection)
    if connection then connection:Disconnect() end
    RunService:Set3dRenderingEnabled(true)
end
