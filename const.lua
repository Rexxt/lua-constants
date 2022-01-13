local const_proxy = {}

return function(tab)
    tab[const_proxy] = {}
    local mt = {
        __index = function(t, k)
            return t[const_proxy][k]
        end,
        __newindex = function(t, k, v)
            if t[const_proxy][k] == nil then
                t[const_proxy][k] = v
            else
                error("attempted to modify constant " .. k, 2)
            end
        end
    }
    for k, v in pairs(tab) do
        if k ~= const_proxy then
            -- move contents over to const proxy
            tab[const_proxy][k] = v
            tab[k] = nil
        end
    end
    setmetatable(tab, mt)
    return tab
end