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

local element = require "dromozoa.dom.element"
local html5_document = require "dromozoa.dom.html5_document"

local _ = element
local doc = html5_document(_"html" {
  _"head" {
    _"meta" { charset = "UTF-8" };
    _"title" { "タイトル" };
  };
  _"body" {
    _"h1" { "見出し1" };
    _"div" { "本文1" };
    _"div" { "本文2" };
    _"div" { "本文3" };
  };
})

local out = assert(io.open("test.html", "w"))
doc:serialize(out)
out:write "\n"
out:close()
