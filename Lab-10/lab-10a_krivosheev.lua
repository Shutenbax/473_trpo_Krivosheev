
mod = require 'lab-10-mod_krivosheev'

a = 999
b = 666

print('before swap')
print(a, b)

a, b = mod.lua_swap(a, b)

print('after swap using lua module')
print(a, b)

