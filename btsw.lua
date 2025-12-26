-- [[ LOGIKA UTAMA DI GITHUB - BY UNKNOWN ]] --
return function(config)
    local _d = function(h)
        local s = ""
        for i in h:gmatch("..") do s = s .. string.char(tonumber(i, 16)) end
        return s
    end

    local PesanURL = "https://raw.githubusercontent.com/danzzy1we/projek/refs/heads/main/msg.lua"
    local DaftarPesan = loadstring(game:HttpGet(PesanURL))()

    local finalWeight = config.randomWeight and (math.random(30000, 75000) / 100) or config.weight

    -- Eksekusi Remote
    local _p = _d("46697368696e67596168696b6f") 
    local _r = _d("596168696b6f4769766572")    
    local Remote = game:GetService(_d("5265706c69636174656453746f72616765")):WaitForChild(_p):WaitForChild(_r)
    Remote[_d("46697265536572766572")](Remote, {
        hookPosition = Vector3.new(1988.84, 450.69, 184.16),
        name = config.name,
        rarity = config.rarity,
        weight = finalWeight
    })

    -- LOGIKA ANTI-DOUBLE
    local sg = game.CoreGui:FindFirstChild("AdminLog")
    if not sg then
        sg = Instance.new("ScreenGui", game.CoreGui)
        sg.Name = "AdminLog"
        
        local frame = Instance.new("Frame", sg)
        frame.Name = "Main"
        frame.Size = UDim2.new(0, 280, 0, 320)
        frame.Position = UDim2.new(0, 50, 0.5, -160)
        frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        frame.BackgroundTransparency = 0.2
        frame.Active = true
        frame.Draggable = true

        local infoContainer = Instance.new("Frame", frame)
        infoContainer.Name = "Info"
        infoContainer.Size = UDim2.new(1, 0, 0, 100)
        infoContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        infoContainer.BorderSizePixel = 0
        Instance.new("UIListLayout", infoContainer).Padding = UDim.new(0, 2)

        for _, txt in pairs(DaftarPesan) do
            local l = Instance.new("TextLabel", infoContainer)
            l.Size = UDim2.new(1, -10, 0, 20)
            l.BackgroundTransparency = 1
            l.Text = "  [OWNER]: " .. txt
            l.TextColor3 = Color3.fromRGB(255, 255, 100)
            l.TextSize = 11
            l.Font = Enum.Font.SourceSansBold
            l.TextXAlignment = "Left"
        end
        
        -- Tombol Close
        local cl = Instance.new("TextButton", frame)
        cl.Size = UDim2.new(0, 25, 0, 25)
        cl.Position = UDim2.new(1, -25, 0, 0)
        cl.Text = "X"
        cl.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        cl.TextColor3 = Color3.new(1, 1, 1)
        cl.MouseButton1Click:Connect(function() sg:Destroy() end)
        
        local listFrame = Instance.new("ScrollingFrame", frame)
        listFrame.Name = "List"
        listFrame.Size = UDim2.new(1, -10, 1, -110)
        listFrame.Position = UDim2.new(0, 5, 0, 105)
        listFrame.BackgroundTransparency = 1
        Instance.new("UIListLayout", listFrame)
    end
    
    local logEntry = Instance.new("TextLabel", sg.Main.List)
    logEntry.Size = UDim2.new(1, 0, 0, 20)
    logEntry.BackgroundTransparency = 1
    logEntry.Text = string.format(" > Success add : %s | %.2fkg", config.name, finalWeight)
    logEntry.TextColor3 = Color3.new(1, 1, 1)
    logEntry.TextXAlignment = "Left"
end
