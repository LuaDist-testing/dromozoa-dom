return function (c)
  c = c + 0
  if c < 8204 then
    if c < 192 then
      if c < 96 then
        if c < 59 then
          if c < 47 then
            return c >= 45
          else
            return c >= 48
          end
        else
          if c < 91 then
            return c >= 65
          else
            return c >= 95
          end
        end
      else
        if c < 183 then
          if c < 123 then
            return c >= 97
          else
            return false
          end
        else
          return c < 184
        end
      end
    else
      if c < 248 then
        if c < 216 then
          return c < 215
        else
          return c < 247
        end
      else
        if c < 895 then
          return c < 894
        else
          return c < 8192
        end
      end
    end
  else
    if c < 12289 then
      if c < 8304 then
        if c < 8255 then
          return c < 8206
        else
          return c < 8257
        end
      else
        if c < 11264 then
          return c < 8592
        else
          return c < 12272
        end
      end
    else
      if c < 65008 then
        if c < 63744 then
          return c < 55296
        else
          return c < 64976
        end
      else
        if c < 65536 then
          return c < 65534
        else
          return c < 983040
        end
      end
    end
  end
end
