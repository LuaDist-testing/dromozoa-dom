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
local xml_document = require "dromozoa.dom.xml_document"
local color4d = require "dromozoa.css.color4d"

local _ = element

local doc = xml_document(_"svg" {
  version = "1.1";
  xmlns = "http://www.w3.org/2000/svg";
  _"defs" {
    _"linearGradient" {
      id = "g";
      gradientTransform = "rotate(45)";
      _"stop" {
        offset = 0;
        ["stop-color"] = color4d(1,0,0,1);
      };
      _"stop" {
        offset = 1;
        ["stop-color"] = color4d(1,1,0,1);
      };
    };
    _"radialGradient" {
      id = "g2";

      gradientTransform = "matrix(1,0,0, 0,1,0, 0,0,1)";

      _"stop" {
        offset = 0;
        ["stop-color"] = color4d(1,0,0,1);
      };
      _"stop" {
        offset = 1;
        ["stop-color"] = color4d(1,1,0,1);
      };
    };
  };
  _"rect" {
    x = 100;
    y = 100;
    width = 512,
    height = 256,
    fill = "url(#g)";
    stroke = "none";
  };
})
doc:serialize(io.stdout)
io.write("\n")
