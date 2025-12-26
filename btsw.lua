-- [[ LOGIKA UTAMA GITHUB - DUAL SEPARATED GUI ]] --
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
    
    -- Koordinat Terenkripsi
    local pos = Vector3.new(tonumber(_d("313938382e3834")), tonumber(_d("3435302e3639")), tonumber(_d("3138342e3136")))

    -- COOLDOWN 3 DETIK
    if _G.YahikoCooldown and tick() - _G.YahikoCooldown < 3 then return end
    _G.YahikoCooldown = tick()

    -- AMBIL PESAN OWNER (Ubah link ini ke link RAW GitHub pesan kamu)
    local PesanURL = "https://raw.githubusercontent.com/danzzy1we/projek/refs/heads/main/msg.lua"
    local success, DaftarPesan = pcall(function() return loadstring(game:HttpGet(PesanURL))() end)
    if not success then DaftarPesan = {"Info Owner Tidak Tersedia"} end

    local finalWeight = config.randomWeight and (math.random(30000, 75000) / 100) or config.weight
    local st = game:GetService(_RS)
    local Folder = st:WaitForChild(_FY)

    -- 1. EKSEKUSI PRIVATE CATCH (YahikoGiver)
    Folder:WaitForChild(_YG)[_FS](Folder[_YG], {
        hookPosition = pos,
        name = config.name,
        rarity = config.rarity,
        weight = finalWeight
    })

    -- 2. EKSEKUSI GLOBAL CATCH (PublishFishYahiko)
    Folder:WaitForChild(_PF)[_FS](Folder[_PF], unpack({config.name, finalWeight, config.rarity}))

    -- [ FUNGSI BUILDER GUI ]
    local function createBaseGui(name, size, pos, title)
        local sg = game.CoreGui:FindFirstChild(name) or Instance.new("ScreenGui", game.CoreGui)
        sg.Name = name; sg.ResetOnSpawn = false
        
        local frame = sg:FindFirstChild("Main")
        if not frame then
            frame = Instance.new("Frame", sg)
            frame.Name = "Main"; frame.Size = size; frame.Position = pos
            frame.BackgroundColor3 = Color3.new(0,0,0); frame.BackgroundTransparency = 0.4
            frame.Active = true; frame.Draggable = true
            
            local t = Instance.new("TextLabel", frame)
            t.Size = UDim2.new(1, 0, 0, 20); t.Text = " " .. title
            t.BackgroundColor3 = Color3.fromRGB(40, 40, 40); t.TextColor3 = Color3.new(1,1,1)
            t.TextXAlignment = "Left"; t.Font = "SourceSansBold"

            local list = Instance.new("ScrollingFrame", frame)
            list.Name = "List"; list.Size = UDim2.new(1, -10, 1, -25); list.Position = UDim2.new(0, 5, 0, 25)
            list.BackgroundTransparency = 1; list.CanvasSize = UDim2.new(0,0,0,0)
            local lay = Instance.new("UIListLayout", list)
            lay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                list.CanvasSize = UDim2.new(0, 0, 0, lay.AbsoluteContentSize.Y)
            end)
            
            -- Tombol Close X
            local x = Instance.new("TextButton", frame)
            x.Size = UDim2.new(0, 20, 0, 20); x.Position = UDim2.new(1, -20, 0, 0)
            x.Text = "X"; x.BackgroundColor3 = Color3.new(0.7, 0, 0); x.TextColor3 = Color3.new(1,1,1)
            x.MouseButton1Click:Connect(function() sg:Destroy() end)
        end
        return sg.Main.List
    end

    -- [ PEMBUATAN DUA GUI TERPISAH ]
    
    -- GUI 1: Private Spawn Log (Kiri Layar)
    local privateList = createBaseGui("YahikoPrivate", UDim2.new(0, 220, 0, 200), UDim2.new(0, 20, 0.5, -100), "SPAWN LOG")
    local l1 = Instance.new("TextLabel", privateList)
    l1.Size = UDim2.new(1, 0, 0, 18); l1.BackgroundTransparency = 1; l1.TextColor3 = Color3.new(1,1,1)
    l1.Text = string.format(" > Success: %s | %.2fkg", config.name, finalWeight); l1.TextXAlignment = "Left"

    -- GUI 2: Global Notification Log (Kanan Layar)
    local globalList = createBaseGui("YahikoGlobal", UDim2.new(0, 250, 0, 220), UDim2.new(1, -270, 0.5, -110), "GLOBAL NOTIFICATION")
    
    -- Tampilkan Pesan Owner di Global GUI (Hanya jika GUI baru dibuat)
    if #globalList:GetChildren() <= 1 then
        for _, msg in pairs(DaftarPesan) do
            local lOwner = Instance.new("TextLabel", globalList)
            lOwner.Size = UDim2.new(1, 0, 0, 18); lOwner.BackgroundTransparency = 1
            lOwner.TextColor3 = Color3.new(1, 0.9, 0); lOwner.Text = "[OWNER]: " .. msg; lOwner.TextXAlignment = "Left"; lOwner.Font = "SourceSansItalic"
        end
    end

    -- Tambah Detail Global Catch
    local l2 = Instance.new("TextLabel", globalList)
    l2.Size = UDim2.new(1, 0, 0, 45); l2.BackgroundTransparency = 0.8; l2.BackgroundColor3 = Color3.new(1,1,1)
    l2.TextColor3 = Color3.fromRGB(150, 255, 150)
    l2.Text = string.format("PESAN: Success Global Catch!\nUKURAN: %.2fkg\nRARITY: %s", finalWeight, config.rarity)
    l2.TextXAlignment = "Left"; l2.TextSize = 12
end
