-- [[ LOGIKA UTAMA GITHUB - CONTROL PANEL EDITION ]] --
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

    -- AMBIL PESAN OWNER DARI GITHUB
    local PesanURL = "https://raw.githubusercontent.com/danzzy1we/projek/refs/heads/main/msg.lua"
    local success, DaftarPesan = pcall(function() return loadstring(game:HttpGet(PesanURL))() end)
    if not success then DaftarPesan = {"Info Owner Tidak Tersedia"} end

    -- [ FUNCTION GLOBAL CATCH ]
    local function fireGlobal(name, weight, rarity)
        Folder:WaitForChild(_PF)[_FS](Folder[_PF], unpack({name, tonumber(weight), rarity}))
    end

    -- [ 1. GUI CONTROL PANEL (UNTUK INPUT) ]
    local sgPanel = game.CoreGui:FindFirstChild("AdminControl") or Instance.new("ScreenGui", game.CoreGui)
    sgPanel.Name = "AdminControl"
    
    if not sgPanel:FindFirstChild("Main") then
        local main = Instance.new("Frame", sgPanel)
        main.Name = "Main"; main.Size = UDim2.new(0, 200, 0, 250)
        main.Position = UDim2.new(0.1, 0, 0.5, -125); main.BackgroundColor3 = Color3.fromRGB(30,30,30)
        main.Active = true; main.Draggable = true

        local title = Instance.new("TextLabel", main)
        title.Size = UDim2.new(1, 0, 0, 25); title.Text = " CONTROL PANEL"; title.BackgroundColor3 = Color3.fromRGB(50,50,50)
        title.TextColor3 = Color3.new(1,1,1); title.TextXAlignment = "Left"; title.Font = "SourceSansBold"

        -- Input Nama
        local inName = Instance.new("TextBox", main)
        inName.Name = "FishName"; inName.PlaceholderText = "Nama Ikan..."; inName.Size = UDim2.new(1, -20, 0, 30)
        inName.Position = UDim2.new(0, 10, 0, 40); inName.Text = "El Maja"

        -- Input Ukuran
        local inWeight = Instance.new("TextBox", main)
        inWeight.Name = "FishWeight"; inWeight.PlaceholderText = "Ukuran (kg)..."; inWeight.Size = UDim2.new(1, -20, 0, 30)
        inWeight.Position = UDim2.new(0, 10, 0, 80); inWeight.Text = "669.48"

        -- Input Rarity
        local inRarity = Instance.new("TextBox", main)
        inRarity.Name = "FishRarity"; inRarity.PlaceholderText = "Rarity..."; inRarity.Size = UDim2.new(1, -20, 0, 30)
        inRarity.Position = UDim2.new(0, 10, 0, 120); inRarity.Text = "Secret"

        -- Tombol Submit
        local btn = Instance.new("TextButton", main)
        btn.Size = UDim2.new(1, -20, 0, 40); btn.Position = UDim2.new(0, 10, 0, 170)
        btn.Text = "PUBLISH GLOBAL"; btn.BackgroundColor3 = Color3.fromRGB(0, 150, 0); btn.TextColor3 = Color3.new(1,1,1)
        btn.Font = "SourceSansBold"

        btn.MouseButton1Click:Connect(function()
            fireGlobal(inName.Text, inWeight.Text, inRarity.Text)
        end)
    end

    -- [ 2. GUI DISPLAY NOTIFICATION (TERPISAH) ]
    local sgGlobal = game.CoreGui:FindFirstChild("AdminGlobal") or Instance.new("ScreenGui", game.CoreGui)
    sgGlobal.Name = "AdminGlobal"

    if not sgGlobal:FindFirstChild("Main") then
        local mainG = Instance.new("Frame", sgGlobal)
        mainG.Name = "Main"; mainG.Size = UDim2.new(0, 280, 0, 250)
        mainG.Position = UDim2.new(0.7, 0, 0.5, -125); mainG.BackgroundColor3 = Color3.new(0,0,0); mainG.BackgroundTransparency = 0.4
        mainG.Active = true; mainG.Draggable = true

        local t = Instance.new("TextLabel", mainG)
        t.Size = UDim2.new(1, 0, 0, 25); t.Text = " GLOBAL NOTIFICATION"
        t.BackgroundColor3 = Color3.fromRGB(150, 0, 0); t.TextColor3 = Color3.new(1,1,1); t.Font = "SourceSansBold"

        local list = Instance.new("ScrollingFrame", mainG)
        list.Name = "List"; list.Size = UDim2.new(1, -10, 1, -35); list.Position = UDim2.new(0, 5, 0, 30)
        list.BackgroundTransparency = 1; list.CanvasSize = UDim2.new(0,0,0,0)
        local lay = Instance.new("UIListLayout", list); lay.Padding = UDim.new(0, 5)
        
        lay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            list.CanvasSize = UDim2.new(0, 0, 0, lay.AbsoluteContentSize.Y)
        end)

        -- Tampilkan Pesan Owner
        for _, msg in pairs(DaftarPesan) do
            local lOwner = Instance.new("TextLabel", list)
            lOwner.Size = UDim2.new(1, 0, 0, 18); lOwner.BackgroundTransparency = 1
            lOwner.TextColor3 = Color3.new(1, 0.9, 0); lOwner.Text = "[OWNER]: " .. msg; lOwner.TextXAlignment = "Left"; lOwner.Font = "SourceSansItalic"
        end

        -- Logika Update Tampilan saat Remote di-fire
        Folder:WaitForChild(_PF).OnClientEvent:Connect(function(name, weight, rarity)
            local entry = Instance.new("TextLabel", list)
            entry.Size = UDim2.new(1, 0, 0, 50); entry.BackgroundTransparency = 0.7; entry.BackgroundColor3 = Color3.new(1,1,1)
            entry.TextColor3 = Color3.fromRGB(150, 255, 150)
            entry.Text = string.format("PESAN: Success Global Catch!\nUKURAN: %.2fkg\nRARITY: %s", weight, rarity)
            entry.TextXAlignment = "Left"; entry.TextSize = 13
        end)
    end
end
