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
local path_data = require "dromozoa.svg.path_data"

local _ = element

local doc = xml_document(_"svg" {
  version = "1.1";
  xmlns = "http://www.w3.org/2000/svg";
  _"path" {
    d = path_data():M(100, 100):L(300, 100):L(200, math.sqrt(3) * 100 + 100):Z();
    fill = "#fcf";
    stroke = "#333";
  };
  _"path" {
    d = path_data():M(400, 100):V(200):H(500):C(550, 150, 450, 50, 400, 100);
    fill = "none";
    stroke = "#333";
  };
  _"path" {
    d = path_data():M(400, 100):L(450, 50):L(550, 150):L(500, 200);
    fill = "none";
    stroke = "#333";
    ["stroke-dasharray"] = "2";
  };
  _"path" {
    d = path_data():M(600, 100):V(200):H(700):S(700, 100, 600, 100);
    fill = "none";
    stroke = "#333";
  };
  _"path" {
    d = path_data():M(600, 100):L(700, 100):L(700, 200);
    fill = "none";
    stroke = "#333";
    ["stroke-dasharray"] = "2";
  };
  _"path" {
    d = path_data():M(400, 300):V(400):H(500):Q(500, 300, 400, 300);
    fill = "none";
    stroke = "#333";
  };
  _"path" {
    d = path_data():M(400, 300):L(500, 300):L(500, 400);
    fill = "none";
    stroke = "#333";
    ["stroke-dasharray"] = "2";
  };
  _"path" {
    d = path_data():M(600, 300):T(600, 400):T(700, 400):T(700, 300):T(600, 300);
    fill = "none";
    stroke = "#333";
  };
  _"path" {
    d = path_data():M(600, 300):L(600, 400):L(700, 400):T(700, 300):L(600, 300);
    fill = "none";
    stroke = "#333";
    ["stroke-dasharray"] = "2";
  };
  _"path" {
    d = path_data():M(100, 400):L(200, 400):A(100, 100, 0, 0, 0, 100, 300);
    fill = "none";
    stroke = "#333";
  };
  _"path" {
    d = path_data():M(250, 400):L(350, 400);
    fill = "none";
    stroke = "#c00";
  };
})
doc:serialize(io.stdout)
io.write("\n")
