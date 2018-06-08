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

local builder = require "dromozoa.ucd.builder"

local unpack = table.unpack or unpack

local name_start_char = [[
":"
[A-Z]
"_"
[a-z]
[#xC0-#xD6]
[#xD8-#xF6]
[#xF8-#x2FF]
[#x370-#x37D]
[#x37F-#x1FFF]
[#x200C-#x200D]
[#x2070-#x218F]
[#x2C00-#x2FEF]
[#x3001-#xD7FF]
[#xF900-#xFDCF]
[#xFDF0-#xFFFD]
[#x10000-#xEFFFF]
]]

local name_char = name_start_char .. [[
"-"
"."
[0-9]
#xB7
[#x0300-#x036F]
[#x203F-#x2040]
]]

local function process(source, code_filename, test_filename)
  local _ = builder(false)

  local out = assert(io.open(test_filename, "w"))
  for line in source:gmatch "[^\n]+" do
    local a = line:match("^\"(.)\"$")
    local first, last
    if a then
      first = string.byte(a)
    else
      local a = line:match "^#x(%x+)$"
      if a then
        first = tonumber(a, 16)
      else
        local a, b = line:match "^%[(.)%-(.)%]"
        if a then
          first = string.byte(a)
          last = string.byte(b)
        else
          local a, b = assert(line:match "^%[#x(%x+)%-#x(%x+)%]$")
          first = tonumber(a, 16)
          last = tonumber(b, 16)
        end
      end
    end
    if not last then
      last = first
    end
    _:range(first, last, true)
    out:write(("%d\t%d\n"):format(first, last))
  end
  out:close()

  local data = _:build()

  local out = assert(io.open(code_filename, "w"))
  _.compile(out, data):close()
end

process(
    name_start_char,
    "dromozoa/dom/is_name_start_char.lua",
    "test/test_is_name_start_char.txt")
process(
    name_char,
    "dromozoa/dom/is_name_char.lua",
    "test/test_is_name_char.txt")
