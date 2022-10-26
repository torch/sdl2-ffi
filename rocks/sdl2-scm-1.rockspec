package = "sdl2"
version = "scm-1"

source = {
   url = "git+https://github.com/arkenidar/lua-sdl2-ffi-luajit.git"
}

description = {
   summary = "A FFI interface to SDL2",
   detailed = [[
   See http://libsdl.org for more details.
   ]],
   homepage = "https://github.com/torch/sdl2-ffi",
   license = "BSD"
}

dependencies = {
   "lua >= 5.1",
}

build = {
   type = "builtin",
   modules = {
      ["sdl2.init"] = "init.lua",
      ["sdl2.cdefs"] = "cdefs.lua",
      ["sdl2.defines"] = "defines.lua"
   }      
}
