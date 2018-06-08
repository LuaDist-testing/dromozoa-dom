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

local comma_separated = require "dromozoa.dom.comma_separated"
local element = require "dromozoa.dom.element"
local space_separated = require "dromozoa.dom.space_separated"
local xml_document = require "dromozoa.dom.xml_document"
local path_data = require "dromozoa.svg.path_data"

local _ = element

local doc = xml_document(_"svg" {
  version = "1.1";
  xmlns = "http://www.w3.org/2000/svg";
  _"defs" {
    _"marker" {
      id = "arrow";
      viewBox = space_separated { 0, 0, 2, 2 };
      refX = 0;
      refY = 1;
      markerWidth = 3;
      markerHeight = 3;
      orient = "auto";
      _"path" {
        d = path_data():M(0,0):L(0,2):L(2,1):Z();
        stroke = "none";
        fill = "#000";
        ["fill-opacity"] = 0.5;
      };
      _"rect" {
        x = 0;
        y = 0;
        width = 2;
        height = 2;
        fill = "#fff";
        ["fill-opacity"] = 0.5;
      };
    };
  };
  _"circle" {
    class = "c1";
    cx = 100;
    cy = 100;
    r = 10;
    fill = "#fcf";
    stroke = "#ccf";
    ["stroke-width"] = 4;
  };
  _"circle" {
    class = "c1";
    cx = 200;
    cy = 200;
    r = 10;
    fill = "#fcf";
    stroke = "#ccf";
    ["stroke-width"] = 4;
  };
  _"path" {
    d = path_data():M(100,100):L(200,200);
    stroke = "#f00";
    ["stroke-width"] = 4;
    ["marker-end"] = "url(#arrow)";
    ["data-ss"] = space_separated { "foo", "bar", "baz" };
    ["data-cs"] = comma_separated { "foo", "bar", "baz" };
  };
})
doc:serialize(io.stdout)
io.write("\n")
