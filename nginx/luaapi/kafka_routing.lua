-- Extract key from path
local function parse_key(uri)
    return uri:match("store/(%S+)")
end

-- Split address into table
local function split(str)
    local result = {}
    local host, port = str:match(("(%S+):(%d+)"))
    result["host"] = host
    result["port"] = tonumber(port)
    return result
end

local balancer = require "ngx.balancer"
local mm = require("murmur2")

local hash = mm(parse_key(ngx.var.request_uri)) % ngx.shared.partitions:get("num_partitions")
local addr = split(ngx.shared.partitions:get(tostring(hash)))
balancer.set_current_peer(addr["host"], addr["port"])
