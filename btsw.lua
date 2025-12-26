-- [[ LOGIKA UTAMA GITHUB - MATCHED STYLE CONTROL PANEL ]] --
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

    -- [ GUI MAIN WINDOW ]
    local sg = game.CoreGui:FindFirstChild("YahikoUltimate") or Instance.new("ScreenGui", game.CoreGui)
    sg.Name = "YahikoUltimate"; sg.ResetOnSpawn = false
    
    if not sg:FindFirstChild("Main") then
        local main = Instance.new("Frame", sg)
        main.Name = "Main"; main.Size = UDim2.new(0, 500, 0, 350)
        main.Position = UDim2.new(0.5, -250, 0.5, -175); main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        main.Active = true; main.Draggable = true

        -- HEADER
        local header = Instance.new("TextLabel", main)
        header.Size = UDim2.new(1, 0, 0, 30); header.Text = " YAHIKO ULTIMATE CONTROL PANEL"; header.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        header.TextColor3 = Color3.new(1,1,1); header.Font = Enum.Font.SourceSansBold

        -- SISI KIRI: PRIVATE SPAWN (LOG DETAIL)
        local left = Instance.new("Frame", main)
        left.Name = "SpawnSide"; left.Size = UDim2.new(0.5, -15, 1, -40); left.Position = UDim2.new(0, 10, 0, 35); left.BackgroundTransparency = 1
        
        local lTitle = Instance.new("TextLabel", left)
        lTitle.Size = UDim2.new(1, 0, 0, 20); lTitle.Text = "PRIVATE SPAWN LOG"; lTitle.TextColor3 = Color3.fromRGB(100, 200, 255); lTitle.BackgroundTransparency = 1

        local spawnBtn = Instance.new("TextButton", left)
        spawnBtn.Size = UDim2.new(1, 0, 0, 35); spawnBtn.Position = UDim2.new(0, 0, 0, 25)
        spawnBtn.Text = "SPAWN FISH NOW"; spawnBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 180); spawnBtn.TextColor3 = Color3.new(1,1,1); spawnBtn.Font = Enum.Font.SourceSansBold

        local spawnLog = Instance.new("ScrollingFrame", left)
        spawnLog.Size = UDim2.new(1, 0, 1, -75); spawnLog.Position = UDim2.new(0, 0, 0, 65)
        spawnLog.BackgroundTransparency = 0.6; spawnLog.BackgroundColor3 = Color3.new(0,0,0); spawnLog.BorderSizePixel = 0
        local sLay = Instance.new("UIListLayout", spawnLog); sLay.Padding = UDim.new(0, 5)

        -- SISI KANAN: GLOBAL PUBLISH (INPUT)
        local right = Instance.new("Frame", main)
        right.Name = "GlobalSide"; right.Size = UDim2.new(0.5, -15, 1, -40); right.Position = UDim2.new(0.5, 5, 0, 35); right.BackgroundTransparency = 1

        local rTitle = Instance.new("TextLabel", right)
        rTitle.Size = UDim2.new(1, 0, 0, 20); rTitle.Text = "GLOBAL PUBLISH"; rTitle.TextColor3 = Color3.fromRGB(255, 100, 100); rTitle.BackgroundTransparency = 1

        local inName = Instance.new("TextBox", right)
        inName.Size = UDim2.new(1, 0, 0, 30); inName.Position = UDim2.new(0, 0, 0, 25); inName.PlaceholderText = "Nama Ikan..."; inName.Text = "El Maja"

        local inWeight = Instance.new("TextBox", right)
        inWeight.Size = UDim2.new(1, 0, 0, 30); inWeight.Position = UDim2.new(0, 0, 0, 60); inWeight.PlaceholderText = "Ukuran (kg)..."; inWeight.Text = "669.48"

        local inRarity = Instance.new("TextBox", right)
        inRarity.Size = UDim2.new(1, 0, 0, 30); inRarity.Position = UDim2.new(0, 0, 0, 95); inRarity.PlaceholderText = "Rarity..."; inRarity.Text = "Secret"

        local pubBtn = Instance.new("TextButton", right)
        pubBtn.Size = UDim2.new(1, 0, 0, 40); pubBtn.Position = UDim2.new(0, 0, 0, 135)
        pubBtn.Text = "PUBLISH GLOBAL"; pubBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0); pubBtn.TextColor3 = Color3.new(1,1,1); pubBtn.Font = Enum.Font.SourceSansBold

        -- [ FUNGSI UNTUK MEMBUAT KOTAK LOG DETAIL (SAMA UNTUK KIRI & KANAN) ]
        local function addLogEntry(parent, name, weight, rarity, color)
            local entry = Instance.new("TextLabel", parent)
            entry.Size = UDim2.new(1, -5, 0, 50)
            entry.BackgroundColor3 = Color3.new(1,1,1)
            entry.BackgroundTransparency = 0.85
            entry.TextColor3 = color
            entry.TextSize = 12
            entry.Font = Enum.Font.SourceSansBold
            entry.TextXAlignment = Enum.TextXAlignment.Left
            entry.Text = string.format("  IKAN: %s\n  UKURAN: %s kg\n  RARITY: %s", name, weight, rarity)
            
            parent.CanvasSize = UDim2.new(0, 0, 0, parent.UIListLayout.AbsoluteContentSize.Y)
            parent.CanvasPosition = Vector2.new(0, parent.CanvasSize.Y.Offset)
        end

        -- EVENT TOMBOL SPAWN (KIRI)
        spawnBtn.MouseButton1Click:Connect(function()
            local w = string.format("%.2f", (math.random(30000, 60000)/100))
            Folder[_YG][_FS](Folder[_YG], {hookPosition = pos, name = config.name, rarity = config.rarity, weight = tonumber(w)})
            addLogEntry(spawnLog, config.name, w, config.rarity, Color3.fromRGB(100, 220, 255))
        end)

        -- EVENT TOMBOL PUBLISH (KANAN)
        pubBtn.MouseButton1Click:Connect(function()
            Folder[_PF][_FS](Folder[_PF], unpack({inName.Text, tonumber(inWeight.Text), inRarity.Text}))
            -- Opsional: Tambahkan log konfirmasi di sisi kanan juga jika mau
        end)

        -- TOMBOL CLOSE X
        local cl = Instance.new("TextButton", main)
        cl.Size = UDim2.new(0, 25, 0, 25); cl.Position = UDim2.new(1, -25, 0, 0); cl.Text = "X"; cl.BackgroundColor3 = Color3.new(0.6,0,0); cl.TextColor3 = Color3.new(1,1,1)
        cl.MouseButton1Click:Connect(function() sg:Destroy() end)
    end
end
