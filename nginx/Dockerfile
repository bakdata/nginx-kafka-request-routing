FROM gcc:4.9 AS compiler
COPY lualib/murmur2.c /usr/src
RUN gcc -shared -fPIC -o /usr/src/murmur2.so /usr/src/murmur2.c -Du_char="unsigned char"

FROM openresty/openresty:centos
RUN opm get ledgetech/lua-resty-http

COPY nginx/nginx.conf /usr/local/openresty/nginx/conf
COPY luaapi/ /usr/local/openresty/nginx/
COPY lualib/ /usr/local/openresty/lualib/

COPY --from=compiler usr/src/murmur2.so /usr/local/openresty/lualib