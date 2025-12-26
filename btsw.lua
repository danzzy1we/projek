-- [[ LOGIKA UTAMA GITHUB - BY SOMEONE ]] --
return function(config)
    local _d = function(h)
        local s = ""
        for i in h:gmatch("..") do s = s .. string.char(tonumber(i, 16)) end
        return s
    end

    -- [ SISTEM COOLDOWN ANTI-SPAM ] --
    local cooldown = 1 -- Detik
    if _G.YahikoCooldown and tick() - _G.YahikoCooldown < cooldown then
        warn("Spam Terdeteksi! Tunggu sebentar.")
        return
    end
    _G.YahikoCooldown = tick()

    local PesanURL = "https://raw.githubusercontent.com/danzzy1we/projek/refs/heads/main/msg.lua"
    local DaftarPesan = loadstring(game:HttpGet(PesanURL))()

    local finalWeight = config.randomWeight and (math.random(30000, 75000) / 100) or config.weight

    local _st = game:GetService(_d("5265706c69636174656453746f72616765"))
    local Remote = _st:WaitForChild(_d("46697368696e67596168696b6f")):WaitForChild(_d("596168696b6f4769766572"))
    Remote[_d("46697265536572766572")](Remote, {
        hookPosition = Vector3.new(1988.84, 450.69, 184.16),
        name = config.name,
        rarity = config.rarity,
        weight = finalWeight
    })

    local sg = game.CoreGui:FindFirstChild("YahikoPanel")
    if not sg then
        sg = Instance.new("ScreenGui", game.CoreGui); sg.Name = "YahikoPanel"
        
        local main = Instance.new("Frame", sg)
        main.Name = "Container"; main.Size = UDim2.new(0, 320, 0, 380)
        main.Position = UDim2.new(0, 50, 0.5, -190); main.BackgroundTransparency = 1
        main.Active = true; main.Draggable = true

        local cl = Instance.new("TextButton", main)
        cl.Size = UDim2.new(0, 25, 0, 25); cl.Position = UDim2.new(1, -25, 0, 0)
        cl.Text = "X"; cl.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        cl.TextColor3 = Color3.new(1,1,1); cl.MouseButton1Click:Connect(function() sg:Destroy() end)

        local infoFrame = Instance.new("Frame", main)
        infoFrame.Name = "InfoBox"; infoFrame.Size = UDim2.new(1, -5, 0, 110)
        infoFrame.Position = UDim2.new(0, 0, 0, 30); infoFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        infoFrame.BackgroundTransparency = 0.2; infoFrame.BorderSizePixel = 0
        
        local infoList = Instance.new("UIListLayout", infoFrame); infoList.Padding = UDim.new(0, 2)
        
        for _, txt in pairs(DaftarPesan) do
            local l = Instance.new("TextLabel", infoFrame)
            l.Size = UDim2.new(1, 0, 0, 22); l.BackgroundTransparency = 1
            l.Text = " [OWNER]: " .. txt; l.TextColor3 = Color3.fromRGB(255, 220, 100)
            l.TextSize = 12; l.Font = Enum.Font.SourceSansBold; l.TextXAlignment = "Left"
        end

        local logFrame = Instance.new("Frame", main)
        logFrame.Name = "LogBox"; logFrame.Size = UDim2.new(1, -5, 1, -150)
        logFrame.Position = UDim2.new(0, 0, 0, 145); logFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        logFrame.BackgroundTransparency = 0.3; logFrame.BorderSizePixel = 1

        local scroll = Instance.new("ScrollingFrame", logFrame)
        scroll.Name = "List"; scroll.Size = UDim2.new(1, -10, 1, -10)
        scroll.Position = UDim2.new(0, 5, 0, 5); scroll.BackgroundTransparency = 1
        scroll.CanvasSize = UDim2.new(0,0,0,0); scroll.ScrollBarThickness = 3
        
        local layout = Instance.new("UIListLayout", scroll)
        layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
        end)
    end
    
    local logEntry = Instance.new("TextLabel", sg.Container.LogBox.List)
    logEntry.Size = UDim2.new(1, 0, 0, 20); logEntry.BackgroundTransparency = 1
    logEntry.Text = string.format(" > Success add : %s | %.2fkg", config.name, finalWeight)
    logEntry.TextColor3 = Color3.new(1, 1, 1); logEntry.TextSize = 13
    logEntry.Font = Enum.Font.Code; logEntry.TextXAlignment = "Left"
end
