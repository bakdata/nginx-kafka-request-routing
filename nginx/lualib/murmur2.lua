-- Import murmur_hash2 written in C
local ffi = require "ffi"
local ffi_cast = ffi.cast
local C = ffi.C
local tonumber = tonumber

local lib = ffi.load "/usr/local/openresty/lualib/murmur2.so"

ffi.cdef [[
typedef unsigned char u_char;
uint32_t murmur_hash2(u_char *data, size_t len);
]]

-- This is not strictly murmur2 because the C function already returns a positive value required to be equivalent to the
-- Java client's implementation of Kafka's partitioner
return function(value)
    return tonumber(lib.murmur_hash2(ffi_cast('uint8_t *', value), #value))
end
