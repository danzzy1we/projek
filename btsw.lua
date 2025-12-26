-- [[ LOGIKA UTAMA GITHUB - FIXED ]] --
return function(config)
    local _d = function(h)
        local s = ""
        for i in h:gmatch("..") do s = s .. string.char(tonumber(i, 16)) end
        return s
    end

    -- [ ENKRIPSI STRING & KOORDINAT ]
    local _RS = _d("5265706c69636174656453746f72616765") -- 1
    local _FY = _d("46697368696e67596168696b6f")       -- 2
    local _YG = _d("596168696b6f4769766572")          -- 3
    local _PF = _d("5075626c69736846697368596168696b6f") -- 4
    local _FS = _d("46697265536572766572")             -- 5
    
    -- Koordinat Terenkripsi (1988.84, 450.69, 184.16)
    local pos = Vector3.new(tonumber(_d("313938382e3834")), tonumber(_d("3435302e3639")), tonumber(_d("3138342e3136")))

    -- SISTEM COOLDOWN
    local cooldown = 1
    if _G.YahikoCooldown and tick() - _G.YahikoCooldown < cooldown then return end
    _G.YahikoCooldown = tick()

    -- AMBIL PESAN OWNER
    local PesanURL = "https://raw.githubusercontent.com/danzzy1we/projek/refs/heads/main/msg.lua"
    local success, DaftarPesan = pcall(function() return loadstring(game:HttpGet(PesanURL))() end)
    if not success then DaftarPesan = {"Gagal memuat info owner"} end

    -- Penentuan Berat
    local finalWeight = config.randomWeight and (math.random(30000, 75000) / 100) or config.weight

    -- EKSEKUSI REMOTE
    local st = game:GetService(_RS)
    local Folder = st:WaitForChild(_FY)
    
    -- 1. Private Catch
    local PrivateRemote = Folder:WaitForChild(_YG)
    PrivateRemote[_FS](PrivateRemote, {
        hookPosition = pos,
        name = config.name,
        rarity = config.rarity,
        weight = finalWeight
    })

    -- 2. Global Catch
    local GlobalRemote = Folder:WaitForChild(_PF)
    GlobalRemote[_FS](GlobalRemote, unpack({config.name, finalWeight, config.rarity}))

    -- [ LOGIKA GUI - PASTI MUNCUL ]
    local sg = game.CoreGui:FindFirstChild("YahikoPanel")
    if not sg then
        sg = Instance.new("ScreenGui", game.CoreGui)
        sg.Name = "YahikoPanel"
        sg.ResetOnSpawn = false -- Penting agar tidak hilang saat mati
        
        -- Tombol Minimize
        local minBtn = Instance.new("TextButton", sg)
        minBtn.Size = UDim2.new(0, 80, 0, 25)
        minBtn.Position = UDim2.new(0, 10, 0, 10)
        minBtn.Text = "Hide Panel"
        minBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        minBtn.TextColor3 = Color3.new(1,1,1)
        minBtn.BorderSizePixel = 0

        -- Container Utama
        local main = Instance.new("Frame", sg)
        main.Name = "Container"
        main.Size = UDim2.new(0, 280, 0, 320)
        main.Position = UDim2.new(0, 50, 0.5, -160)
        main.BackgroundColor3 = Color3.new(0,0,0)
        main.BackgroundTransparency = 0.4
        main.Active = true
        main.Draggable = true

        -- Kotak Info Owner
        local infoBox = Instance.new("Frame", main)
        infoBox.Size = UDim2.new(1, -10, 0, 95)
        infoBox.Position = UDim2.new(0, 5, 0, 10)
        infoBox.BackgroundTransparency = 1
        local il = Instance.new("UIListLayout", infoBox); il.Padding = UDim.new(0, 2)
        
        for _, txt in pairs(DaftarPesan) do
            local l = Instance.new("TextLabel", infoBox)
            l.Size = UDim2.new(1, 0, 0, 18); l.BackgroundTransparency = 1
            l.Text = " [OWNER]: " .. txt; l.TextColor3 = Color3.new(1, 0.9, 0.4)
            l.TextSize = 11; l.Font = Enum.Font.SourceSansBold; l.TextXAlignment = "Left"
        end

        -- Console Log
        local list = Instance.new("ScrollingFrame", main)
        list.Name = "List"
        list.Size = UDim2.new(1, -10, 1, -120)
        list.Position = UDim2.new(0, 5, 0, 110)
        list.BackgroundTransparency = 1
        list.CanvasSize = UDim2.new(0,0,0,0)
        local ll = Instance.new("UIListLayout", list)
        ll:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            list.CanvasSize = UDim2.new(0, 0, 0, ll.AbsoluteContentSize.Y)
        end)

        -- Fungsi Toggle
        minBtn.MouseButton1Click:Connect(function()
            main.Visible = not main.Visible
            minBtn.Text = main.Visible and "Hide Panel" or "Show Panel"
        end)
    end
    
    -- Log Penambahan
    local log = Instance.new("TextLabel", sg.Container.List)
    log.Size = UDim2.new(1, 0, 0, 18); log.BackgroundTransparency = 1
    log.Text = string.format(" > Success add : %s | %.2fkg", config.name, finalWeight)
    log.TextColor3 = Color3.new(1, 1, 1); log.TextSize = 13; log.TextXAlignment = "Left"
end
