-- [[ LOGIKA UTAMA GITHUB - ALL-IN-ONE CONTROL PANEL ]] --
return function(config)
    local _d = function(h)
        local s = ""
        for i in h:gmatch("..") do s = s .. string.char(tonumber(i, 16)) end
        return s
    end

    -- [ ENKRIPSI REMOTES ]
    local _RS = _d("5265706c69636174656453746f72616765")
    local _FY = _d("46697368696e67596168696b6f")
    local _YG = _d("596168696b6f4769766572")
    local _PF = _d("5075626c69736846697368596168696b6f")
    local _FS = _d("46697265536572766572")
    
    local st = game:GetService(_RS)
    local Folder = st:WaitForChild(_FY)
    local pos = Vector3.new(1988.84, 450.69, 184.16)

    -- AMBIL PESAN OWNER
    local PesanURL = "https://raw.githubusercontent.com/username/repo/main/my_messages.lua"
    local success, DaftarPesan = pcall(function() return loadstring(game:HttpGet(PesanURL))() end)
    if not success then DaftarPesan = {"Info Owner Tidak Tersedia"} end

    -- [ GUI MAIN WINDOW ]
    local sg = game.CoreGui:FindFirstChild("YahikoUltimate") or Instance.new("ScreenGui", game.CoreGui)
    sg.Name = "YahikoUltimate"; sg.ResetOnSpawn = false
    
    if not sg:FindFirstChild("Main") then
        local main = Instance.new("Frame", sg)
        main.Name = "Main"; main.Size = UDim2.new(0, 450, 0, 300)
        main.Position = UDim2.new(0.5, -225, 0.5, -150); main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        main.Active = true; main.Draggable = true

        -- HEADER
        local header = Instance.new("TextLabel", main)
        header.Size = UDim2.new(1, 0, 0, 30); header.Text = " YAHIKO ULTIMATE CONTROL PANEL"; header.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        header.TextColor3 = Color3.new(1,1,1); header.Font = "SourceSansBold"

        -- SISI KIRI: SPAWN FISH (AUTO/PRIVATE)
        local left = Instance.new("Frame", main)
        left.Name = "SpawnSide"; left.Size = UDim2.new(0.5, -15, 1, -40); left.Position = UDim2.new(0, 10, 0, 35)
        left.BackgroundTransparency = 1
        
        local lTitle = Instance.new("TextLabel", left)
        lTitle.Size = UDim2.new(1, 0, 0, 20); lTitle.Text = "PRIVATE SPAWN"; lTitle.TextColor3 = Color3.fromRGB(100, 200, 255); lTitle.BackgroundTransparency = 1

        local spawnBtn = Instance.new("TextButton", left)
        spawnBtn.Size = UDim2.new(1, 0, 0, 40); spawnBtn.Position = UDim2.new(0, 0, 0, 25)
        spawnBtn.Text = "SPAWN FISH NOW"; spawnBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 150); spawnBtn.TextColor3 = Color3.new(1,1,1)

        local spawnLog = Instance.new("ScrollingFrame", left)
        spawnLog.Size = UDim2.new(1, 0, 1, -70); spawnLog.Position = UDim2.new(0, 0, 0, 70)
        spawnLog.BackgroundTransparency = 0.5; spawnLog.BackgroundColor3 = Color3.new(0,0,0)
        local sLay = Instance.new("UIListLayout", spawnLog)

        -- SISI KANAN: GLOBAL NOTIFICATION (MANUAL)
        local right = Instance.new("Frame", main)
        right.Name = "GlobalSide"; right.Size = UDim2.new(0.5, -15, 1, -40); right.Position = UDim2.new(0.5, 5, 0, 35)
        right.BackgroundTransparency = 1

        local rTitle = Instance.new("TextLabel", right)
        rTitle.Size = UDim2.new(1, 0, 0, 20); rTitle.Text = "GLOBAL PUBLISH"; rTitle.TextColor3 = Color3.fromRGB(255, 100, 100); rTitle.BackgroundTransparency = 1

        local inName = Instance.new("TextBox", right)
        inName.Size = UDim2.new(1, 0, 0, 25); inName.Position = UDim2.new(0, 0, 0, 25); inName.PlaceholderText = "Nama Ikan..."; inName.Text = "El Maja"

        local inWeight = Instance.new("TextBox", right)
        inWeight.Size = UDim2.new(1, 0, 0, 25); inWeight.Position = UDim2.new(0, 0, 0, 55); inWeight.PlaceholderText = "Ukuran (kg)..."; inWeight.Text = "669.48"

        local inRarity = Instance.new("TextBox", right)
        inRarity.Size = UDim2.new(1, 0, 0, 25); inRarity.Position = UDim2.new(0, 0, 0, 85); inRarity.PlaceholderText = "Rarity..."; inRarity.Text = "Secret"

        local pubBtn = Instance.new("TextButton", right)
        pubBtn.Size = UDim2.new(1, 0, 0, 35); pubBtn.Position = UDim2.new(0, 0, 0, 115)
        pubBtn.Text = "PUBLISH GLOBAL"; pubBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0); pubBtn.TextColor3 = Color3.new(1,1,1)

        -- FUNGSI TOMBOL SPAWN
        spawnBtn.MouseButton1Click:Connect(function()
            Folder[_YG][_FS](Folder[_YG], {hookPosition = pos, name = config.name, rarity = config.rarity, weight = (math.random(30000, 60000)/100)})
            local log = Instance.new("TextLabel", spawnLog)
            log.Size = UDim2.new(1,0,0,15); log.Text = " > Spawned: " .. config.name; log.TextColor3 = Color3.new(1,1,1); log.BackgroundTransparency = 1; log.TextSize = 10
            spawnLog.CanvasSize = UDim2.new(0,0,0, sLay.AbsoluteContentSize.Y)
        end)

        -- FUNGSI TOMBOL PUBLISH
        pubBtn.MouseButton1Click:Connect(function()
            Folder[_PF][_FS](Folder[_PF], unpack({inName.Text, tonumber(inWeight.Text), inRarity.Text}))
        end)

        -- TOMBOL CLOSE X
        local cl = Instance.new("TextButton", main)
        cl.Size = UDim2.new(0, 25, 0, 25); cl.Position = UDim2.new(1, -25, 0, 0); cl.Text = "X"; cl.BackgroundColor3 = Color3.new(0.6,0,0); cl.TextColor3 = Color3.new(1,1,1)
        cl.MouseButton1Click:Connect(function() sg:Destroy() end)
    end
end
