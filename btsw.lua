-- [[ LOGIKA UTAMA GITHUB - BY UNKNOWN ]] --
return function(config)
    local _hex = function(h)
        local s = ""
        for i in h:gmatch("..") do s = s .. string.char(tonumber(i, 16)) end
        return s
    end

    -- [ ENKRIPSI STRING ]
    local _RS = _d("5265706c69636174656453746f72616765") -- Kaciw
    local _FY = _d("46697368696e67596168696b6f")       -- Kaciw
    local _YG = _d("596168696b6f4769766572")          -- Kaciw
    local _PF = _d("5075626c69736846697368596168696b6f") -- Kaciw
    local _FS = _d("46697265536572766572")             -- Kaciw

    -- SISTEM COOLDOWN
    local cooldown = 1
    if _G.YahikoCooldown and tick() - _G.YahikoCooldown < cooldown then return end
    _G.YahikoCooldown = tick()

    -- Ambil Pesan Owner dari GitHub
    local PesanURL = "https://raw.githubusercontent.com/danzzy1we/projek/refs/heads/main/msg.lua"
    local DaftarPesan = loadstring(game:HttpGet(PesanURL))()

    -- Penentuan Berat
    local finalWeight = config.randomWeight and (math.random(30000, 75000) / 100) or config.weight

    -- Akses
    local st = game:GetService(_RS)
    local Folder = st:WaitForChild(_FY)
    
    -- Private Catch)
    local PrivateRemote = Folder:WaitForChild(_YG)
    PrivateRemote[_FS](PrivateRemote, {
        hookPosition = Vector3.new(1988.84, 450.69, 184.16),
        name = config.name,
        rarity = config.rarity,
        weight = finalWeight
    })

    -- lobal Catch (PublishFishYahiko)
    local GlobalRemote = Folder:WaitForChild(_PF)
    GlobalRemote[_FS](GlobalRemote, unpack({
        config.name,
        finalWeight,
        config.rarity
    }))

    -- [ GUI LOGIC ]
    local sg = game.CoreGui:FindFirstChild("YahikoPanel")
    if not sg then
        sg = Instance.new("ScreenGui", game.CoreGui); sg.Name = "YahikoPanel"
        
        -- Tombol Minimize
        local minBtn = Instance.new("TextButton", sg)
        minBtn.Name = "Toggle"; minBtn.Size = UDim2.new(0, 80, 0, 25)
        minBtn.Position = UDim2.new(0, 10, 0, 10)
        minBtn.Text = "Hide Panel"; minBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        minBtn.TextColor3 = Color3.new(1,1,1); minBtn.Draggable = true

        -- Container Utama
        local main = Instance.new("Frame", sg)
        main.Name = "Container"; main.Size = UDim2.new(0, 280, 0, 320)
        main.Position = UDim2.new(0, 50, 0.5, -160); main.BackgroundColor3 = Color3.new(0,0,0)
        main.BackgroundTransparency = 0.4; main.Active = true; main.Draggable = true

        -- Info Owner
        local infoFrame = Instance.new("Frame", main)
        infoFrame.Size = UDim2.new(1, -10, 0, 90); infoFrame.Position = UDim2.new(0, 5, 0, 10); infoFrame.BackgroundTransparency = 1
        Instance.new("UIListLayout", infoFrame).Padding = UDim.new(0, 2)
        
        for _, txt in pairs(DaftarPesan) do
            local l = Instance.new("TextLabel", infoFrame)
            l.Size = UDim2.new(1, 0, 0, 18); l.BackgroundTransparency = 1
            l.Text = " [OWNER]: " .. txt; l.TextColor3 = Color3.fromRGB(255, 220, 100)
            l.TextSize = 11; l.Font = Enum.Font.SourceSansBold; l.TextXAlignment = "Left"
        end

        -- Console Log
        local logFrame = Instance.new("ScrollingFrame", main)
        logFrame.Name = "List"; logFrame.Size = UDim2.new(1, -10, 1, -115)
        logFrame.Position = UDim2.new(0, 5, 0, 105); logFrame.BackgroundTransparency = 1
        logFrame.CanvasSize = UDim2.new(0,0,0,0); logFrame.ScrollBarThickness = 2
        local layout = Instance.new("UIListLayout", logFrame)
        layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            logFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
        end)

        -- Minimize Toggle
        local visible = true
        minBtn.MouseButton1Click:Connect(function()
            visible = not visible
            main.Visible = visible
            minBtn.Text = visible and "Hide Panel" or "Show Panel"
        end)
    end
    
    local log = Instance.new("TextLabel", sg.Container.List)
    log.Size = UDim2.new(1, 0, 0, 18); log.BackgroundTransparency = 1
    log.Text = string.format(" > Success add : %s | %.2fkg", config.name, finalWeight)
    log.TextColor3 = Color3.new(1, 1, 1); log.TextSize = 13; log.TextXAlignment = "Left"
end
