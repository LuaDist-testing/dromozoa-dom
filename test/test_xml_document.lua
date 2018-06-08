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
local xml_document = require "dromozoa.dom.xml_document"

local _ = element
local doc = xml_document(_"svg" {
  version = "1.1";
  width = 600;
  height = 600;
  xmlns = "http://www.w3.org/2000/svg";
  _"circle" {
    cx = 300;
    cy = 300;
    r = 100;
  };
})
-- doc.doctype = {
--   name = "svg";
--   public_id = "-//W3C//DTD SVG 1.1//EN";
--   system_id = "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd";
-- }

doc:serialize(io.stdout)
io.write("\n")
