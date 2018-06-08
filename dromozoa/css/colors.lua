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

local color4b = require "dromozoa.css.color4b"

return {
  black = color4b(0, 0, 0);
  silver = color4b(192, 192, 192);
  gray = color4b(128, 128, 128);
  white = color4b(255, 255, 255);
  maroon = color4b(128, 0, 0);
  red = color4b(255, 0, 0);
  purple = color4b(128, 0, 128);
  fuchsia = color4b(255, 0, 255);
  green = color4b(0, 128, 0);
  lime = color4b(0, 255, 0);
  olive = color4b(128, 128, 0);
  yellow = color4b(255, 255, 0);
  navy = color4b(0, 0, 128);
  blue = color4b(0, 0, 255);
  teal = color4b(0, 128, 128);
  aqua = color4b(0, 255, 255);
  transparent = color4b(0, 0, 0, 0);
}
