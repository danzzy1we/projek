-- Logika Utama yang Disembunyikan
return function(config)
    local _d = function(h)
        local s = ""
        for i in h:gmatch("..") do
            s = s .. string.char(tonumber(i, 16))
        end
        return s
    end

    -- Enkripsi Path & Method
    local _p = _d("46697368696e67596168696b6f") -- FishingYahiko
    local _r = _d("596168696b6f4769766572")    -- YahikoGiver
    local _m = _d("46697265536572766572")       -- FireServer
    
    local Remote = game:GetService(_d("5265706c69636174656453746f72616765")):WaitForChild(_p):WaitForChild(_r)
    
    Remote[_m](Remote, {
        hookPosition = Vector3.new(1988.84, 450.69, 184.16),
        name = config.name,
        rarity = config.rarity,
        weight = config.weight
    })
end
