-- Copyright (C) 2017,2018 Tomoyuki Fujimori <moyu@dromozoa.com>
--
-- This file is part of dromozoa-dom.
--
-- dromozoa-dom is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- dromozoa-dom is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with dromozoa-dom.  If not, see <http://www.gnu.org/licenses/>.

local class = {}
local metatable = {
  __index = class;
  ["dromozoa.dom.is_serializable"] = true;
}

function class:normalize()
  return self
end

function class:interpolate(that, alpha)
  that = that:normalize()
  local beta = 1 - alpha
  return class(
      beta * self[1] + alpha * that[1],
      beta * self[2] + alpha * that[2],
      beta * self[3] + alpha * that[3],
      beta * self[4] + alpha * that[4])
end

function metatable:__tostring()
  local r = self[1] * 255
  local g = self[2] * 255
  local b = self[3] * 255
  local a = self[4]
  if r % 1 == 0 and g % 1 == 0 and b % 1 == 0 then
    if a == 1 then
      if r % 17 == 0 and g % 17 == 0 and b % 17 == 0 then
        return ("#%01X%01X%01X"):format(r / 17, g / 17, b / 17)
      else
        return ("#%02X%02X%02X"):format(r, g, b)
      end
    else
      return ("rgba(%d,%d,%d,%.17g)"):format(r, g, b, a)
    end
  else
    local r = self[1] * 100
    local g = self[2] * 100
    local b = self[3] * 100
    if a == 1 then
      return ("rgb(%.17g%%,%.17g%%,%.17g%%)"):format(r, g, b)
    else
      return ("rgba(%.17g%%,%.17g%%,%.17g%%,%.17g)"):format(r, g, b, a)
    end
  end
end

return setmetatable(class, {
  __call = function (_, r, g, b, a)
    if a == nil then
      a = 1
    end
    local self = { r, g, b, a }
    for i = 1, 4 do
      local v = self[i]
      local t = type(v)
      if t ~= "number" then
        if t == "string" then
          v = tonumber(v)
          if not v then
            error("bad argument #" .. i .. " (number expected, got " .. t .. ")")
          end
        else
          error("bad argument #" .. i .. " (number expected, got " .. t .. ")")
        end
      end
      if v < 0 or 1 < v then
        error("bad argument #" .. i .. " (out of range)")
      end
      self[i] = v
    end
    return setmetatable(self, metatable)
  end;
})
