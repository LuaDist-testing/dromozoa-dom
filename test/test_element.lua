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

local element = require "dromozoa.dom.element"
local serialize_html5 = require "dromozoa.dom.serialize_html5"
local serialize_xml = require "dromozoa.dom.serialize_xml"

local _ = element

local root = _"html" {
  _"head" {
    _"meta" { charset = "UTF-8" };
  };
  _"body" {
    _"div" {
      class = "foo bar & baz";
      style = "display: box; border: 1px solid black";
      "foo";
      _"a" { href="https://gihub.com/dromozoa/dromozoa-dom/"; "bar" };
      "baz";
      _"input" { type = "text", disabled = true, value = 2.0 };
    };
  };
}

local div = root[2][1]
div[#div + 1] = _"span" { "qux" }

assert(not pcall(function () div["invalid name"] = 42 end))

serialize_html5(io.stdout, root)
io.write("\n")

serialize_xml(io.stdout, root)
io.write("\n")
