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

local unpack = table.unpack or unpack

local command_defs = {
  -- x,y
  M = { 3, "%s%.17g,%.17g" };
  --
  Z = { 1, "%s" };
  -- x,y
  L = { 3, "%s%.17g,%.17g" };
  -- x
  H = { 2, "%s%.17g" };
  -- y
  V = { 2, "%s%.17g" };
  -- x1,y1 x2,y2 x,y
  C = { 7, "%s%.17g,%.17g %.17g,%.17g %.17g,%.17g" };
  -- x2,y2 x,y
  S = { 5, "%s%.17g,%.17g %.17g,%.17g" };
  -- x1,y1 x,y
  Q = { 5, "%s%.17g,%.17g %.17g,%.17g" };
  -- x,y
  T = { 3, "%s%.17g,%.17g" };
  -- rx,ry r_axis_rotation large_arc_flag,sweep_flag x,y
  A = { 8, "%s%.17g,%.17g %.17g %d,%d %.17g,%.17g" };
}

local function make_segment(command, n, ...)
  local segment = { command, ... }
  for i = 2, n do
    local v = segment[i]
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
    segment[i] = v
  end
  return segment
end

local function make_command(command, n)
  if command == "A" or command == "a" then
    return function (self, ...)
      local segment = make_segment(command, n, ...)
      if segment[2] < 0 then
        error "bad argument #2 (rx must be non-negative)"
      end
      if segment[3] < 0 then
        error "bad argument #3 (ry must be non-negative)"
      end
      local flag = segment[5]
      if flag ~= 0 and flag ~= 1 then
        error "bad argument #5 (large_arc_flag must be 0 or 1)"
      end
      local flag = segment[6]
      if flag ~= 0 and flag ~= 1 then
        error "bad argument #6 (sweep_flag must be 0 or 1)"
      end
      self[#self + 1] = segment
      return self
    end
  else
    return function (self, ...)
      self[#self + 1] = make_segment(command, n, ...)
      return self
    end
  end
end

local class = {}
local metatable = {
  __index = class;
  ["dromozoa.dom.is_serializable"] = true;
}

for command_abs, def in pairs(command_defs) do
  local command_rel = command_abs:lower()
  local n = def[1]
  class[command_abs] = make_command(command_abs, n)
  class[command_rel] = make_command(command_rel, n)
end

function metatable:__tostring()
  local buffer = {}
  local prev_command
  for i = 1, #self do
    local segment = self[i]
    local command = segment[1]
    local format = command_defs[command:upper()][2]
    if command == prev_command then
      buffer[i] = format:format("", unpack(segment, 2))
    else
      buffer[i] = format:format(unpack(segment))
      if command == "Z" or command == "z" then
        prev_command = nil
      else
        prev_command = command
      end
    end
  end
  return table.concat(buffer, " ")
end

return setmetatable(class, {
  __call = function (_, name)
    return setmetatable({}, metatable)
  end;
})
