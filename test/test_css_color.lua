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

local color4b = require "dromozoa.css.color4b"
local color4d = require "dromozoa.css.color4d"
local colors = require "dromozoa.css.colors"

assert(tostring(color4b(0xFF, 0xFF, 0x00, 127.5)) == "rgba(255,255,0,0.5)")
assert(tostring(color4b(255, 127, 63)) == "#FF7F3F")
assert(tostring(color4b(255, 34, 0)) == "#F20")
assert(tostring(color4d(1, 0, 0x33/0xFF)) == "#F03")
assert(tostring(color4d(1, 0.5, 0.25)) == "rgb(100%,50%,25%)")
assert(tostring(color4d(1, 0.5, 0.25, 0.75)) == "rgba(100%,50%,25%,0.75)")
assert(tostring(colors.blue) == "#00F")
assert(tostring(colors.silver) == "#C0C0C0")
