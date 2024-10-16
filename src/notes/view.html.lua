dofile "init"
local LAYOUT = require "layout"
local notedb = require "notedb"
local path = require "path"
local page = require "page"
local ext = require "ext"

local params = path.getParams(page.PAGE_LINK)
local notes = notedb.getByDate(params.date, params.time)

return LAYOUT {


}
