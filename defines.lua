local sdl

local function registerdefines(sdl)

   -- audio

   function sdl.AUDIO_BITSIZE(x)
      return bit.band(x, sdl.AUDIO_MASK_BITSIZE)
   end

   function sdl.AUDIO_ISFLOAT(x)
      return bit.band(x, sdl.AUDIO_MASK_DATATYPE) ~= 0
   end

   function sdl.AUDIO_ISBIGENDIAN(x)
      return bit.band(x, sdl.AUDIO_MASK_ENDIAN) ~= 0
   end

   function sdl.AUDIO_ISSIGNED(x)
      return bit.band(x, sdl.AUDIO_MASK_SIGNED) ~= 0
   end

   function sdl.AUDIO_ISINT(x)
      return not sdl.AUDIO_ISFLOAT(x)
   end

   function sdl.AUDIO_ISLITTLEENDIAN(x)
      return not sdl.AUDIO_ISBIGENDIAN(x)
   end

   function sdl.AUDIO_ISUNSIGNED(x)
      return not sdl.AUDIO_ISSIGNED(x)
   end

   function sdl.loadWAV(file, spec, audio_buf, audio_len)
      local f = sdl.RWFromFile(file, 'rb')
      local wav = sdl.loadWAV_RW(f, 1, spec, audio_buf, audio_len)
      sdl.RWClose(f)
      return wav
   end

end

return registerdefines
