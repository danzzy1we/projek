-- Sc Created By Unknown
return function(config)
    -- KONFIGURASI CLOUD
    local cloudSettings = {
        maxWeight = 800.0 -- Max Weight
    }

    local _d = function(h)
        local s = ""
        for i in h:gmatch("..") do
            s = s .. string.char(tonumber(i, 16))
        end
        return s
    end

    -- Validasi: Jika berat di executor melebihi batas cloud, pakai batas cloud
    local finalWeight = config.weight
    if finalWeight > cloudSettings.maxWeight then
        finalWeight = cloudSettings.maxWeight
    end

    local _p = _d("46697368696e67596168696b6f") -- Created
    local _r = _d("596168696b6f4769766572")    -- By
    local _m = _d("46697265536572766572")       -- Unknown
    
    local Remote = game:GetService(_d("5265706c69636174656453746f72616765")):WaitForChild(_p):WaitForChild(_r)
    
    Remote[_m](Remote, {
        hookPosition = Vector3.new(1988.84, 450.69, 184.16),
        name = config.name,
        rarity = config.rarity,
        weight = finalWeight
    })
end
