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

local check_name = require "dromozoa.dom.check_name"

local verbose = os.getenv "VERBOSE" == "1"

local function check(name, expect)
  local result = { pcall(check_name, name) }
  if verbose then
    print(result[1], result[2])
  end
  assert(result[1] == expect)
end

check("0123", false)
check("_123", true)
check("n..e", true)
check("na e", false)
check("na\n", false)
check("name", true)
check("名前", true)
