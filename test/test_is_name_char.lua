-- Copyright (C) 2017 Tomoyuki Fujimori <moyu@dromozoa.com>
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

local is_name_char = require "dromozoa.dom.is_name_char"
local is_name_start_char = require "dromozoa.dom.is_name_start_char"

local function check(f, expect_filename)
  local expect = {}

  for i = 0, 0x10FFFF do
    expect[i] = false
  end

  for line in io.lines(expect_filename) do
    local first, last = assert(line:match("^(%d+)\t(%d+)$"))
    first = tonumber(first)
    last = tonumber(last)
    for i = first, last do
      expect[i] = true
    end
  end

  for i = 0, 0x10FFFF do
    assert(f(i) == expect[i])
  end
end

check(is_name_start_char, "test/test_is_name_start_char.txt")
check(is_name_char, "test/test_is_name_char.txt")
