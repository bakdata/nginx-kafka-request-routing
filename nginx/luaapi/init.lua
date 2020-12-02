-- safe way to load csjon according to docs
local cjson = require "cjson"
local cjson2 = cjson.new()
local cjson_safe = require "cjson.safe"

-- Requests the partition host mapping from a arbitrary host
-- Returns a table of format partition -> ("host"->[host], "port"->[port])
local function fetch_partition_hosts()
    local addr ="http://10.0.0.12:8080"
    local http = require "resty.http"
    local httpc = http.new()
    local res, err = httpc:request_uri(addr .. "/metadata/partitions", { method = "GET" })

    if not res then
        ngx.log(ngx.ERR, "failed to request: ", err)
        return
    end

    local partition_hosts = cjson.decode(res.body)
    return partition_hosts
end

local function set_partitions(premature, partitions)
    local counter = 0
    for partition, host in pairs(fetch_partition_hosts()) do
        partitions:set(partition, host)
        counter = counter + 1
    end
    partitions:set("num_partitions", counter)
end

-- Workaround because cosockets are not available
-- see https://github.com/openresty/lua-nginx-module#cosockets-not-available-everywhere
local partitions = ngx.shared.partitions
if partitions["num_partitions"] == nil then
    ngx.timer.at(0, set_partitions, partitions)
end

