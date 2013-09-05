print[[
-- Do not change this file manually
-- Generated with dev/create-init.lua

local ffi = require 'ffi'
local C = ffi.load('SDL2')
local sdl = {}
local registerdefines = require 'sdl2.defines'

require 'sdl2.cdefs'

local function register(luafuncname, funcname)
   local symexists, msg = pcall(function()
                              local sym = C[funcname]
                           end)
   if symexists then
      sdl[luafuncname] = C[funcname]
   end
end
]]

local defined = {}

local txt = io.open('cdefs.lua'):read('*all')
for funcname in txt:gmatch('SDL_([^%=,%.%;<%s%(%)]+)%s*%(') do
   if funcname and not defined[funcname] then
      local luafuncname = funcname:gsub('^..', function(str)
                                                  if str == 'RW' then
                                                     return str
                                                  else
                                                     return string.lower(str:sub(1,1)) .. str:sub(2,2)
                                                  end
                                               end)
      print(string.format("register('%s', 'SDL_%s')", luafuncname, funcname))
      defined[funcname] = true
   end
end

print()

for defname in txt:gmatch('SDL_([^%=,%.%;<%s%(%)|%[%]]+)') do
   if not defined[defname] and defname == string.upper(defname) then
      print(string.format("register('%s', 'SDL_%s')", defname, defname))
   end
end

print[[

registerdefines(sdl)

return sdl
]]
