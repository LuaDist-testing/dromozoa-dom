return function (c)
  c = c + 0
  if c < 895 then
    if c < 192 then
      if c < 95 then
        if c < 65 then
          if c < 59 then
            return c >= 58
          else
            return false
          end
        else
          return c < 91
        end
      else
        if c < 97 then
          return c < 96
        else
          return c < 123
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
        if c < 880 then
          return c < 768
        else
          return c < 894
        end
      end
    end
  else
    if c < 12289 then
      if c < 8304 then
        if c < 8204 then
          return c < 8192
        else
          return c < 8206
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
