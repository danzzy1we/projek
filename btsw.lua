-- Logika Utama / Fungsi Utama By Unknown
return function(config)
    local maxWeightCloud = 800.0 
    
    local _d = function(h)
        local s = ""
        for i in h:gmatch("..") do
            s = s .. string.char(tonumber(i, 16))
        end
        return s
    end

    -- Penentuan Berat Akhir
    local finalWeight
    if config.randomWeight == true then
        finalWeight = math.random(30000, 75000) / 100
    else
        finalWeight = config.weight
    end

    if finalWeight > maxWeightCloud then
        finalWeight = maxWeightCloud
    end

    local _p = _d("46697368696e67596168696b6f") -- Ngapain?
    local _r = _d("596168696b6f4769766572")    -- Ngapain?
    local _m = _d("46697265536572766572")       -- Ngapain?
    local _st = game:GetService(_d("5265706c69636174656453746f72616765"))
    local Remote = _st:WaitForChild(_p):WaitForChild(_r)
    
    Remote[_m](Remote, {
        hookPosition = Vector3.new(1988.84, 450.69, 184.16),
        name = config.name,
        rarity = config.rarity,
        weight = finalWeight
    })

    local sg = game.CoreGui:FindFirstChild("Log") or Instance.new("ScreenGui", game.CoreGui)
    sg.Name = "Log"
    
    local frame = sg:FindFirstChild("Main")
    if not frame then
        frame = Instance.new("Frame", sg)
        frame.Name = "Main"
        frame.Size = UDim2.new(0, 200, 0, 250)
        frame.Position = UDim2.new(0, 50, 0.5, -125)
        frame.BackgroundColor3 = Color3.new(0,0,0)
        frame.BackgroundTransparency = 0.5
        frame.Active = true
        frame.Draggable = true
        
        local cl = Instance.new("TextButton", frame)
        cl.Size = UDim2.new(0, 20, 0, 20)
        cl.Position = UDim2.new(1, -20, 0, 0)
        cl.Text = "X"
        cl.BackgroundColor3 = Color3.new(1,0,0)
        cl.MouseButton1Click:Connect(function() sg:Destroy() end)
        
        local list = Instance.new("ScrollingFrame", frame)
        list.Name = "List"
        list.Size = UDim2.new(1, 0, 1, -20)
        list.Position = UDim2.new(0, 0, 0, 20)
        list.BackgroundTransparency = 1
        Instance.new("UIListLayout", list)
    end
    
    local l = Instance.new("TextLabel", frame.List)
    l.Size = UDim2.new(1, 0, 0, 20)
    l.Text = " " .. config.name .. " | " .. finalWeight .. "kg"
    l.TextColor3 = Color3.new(1,1,1)
    l.BackgroundTransparency = 1
    l.TextXAlignment = "Left"
end
