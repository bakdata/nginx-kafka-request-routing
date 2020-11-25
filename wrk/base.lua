-- Select random key and request value from store (LB responsible for routing request)
request = function()
    local key = math.random(0, 1000000)
    local path = "/store/" .. tostring(key)
    return wrk.format(nil, path)
end
