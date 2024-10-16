local os = require("os")
local X = require("ext")
local site = require("site")

local imagedb = {entries={}; tags={}}

local function changeFileExt(filename, ext)
    local i = #filename
    while i >= 1 do
        if filename:sub(i, i) == "." then
            if ext:sub(1, 1) ~= "." then
                ext = "." .. ext
            end
            return filename:sub(1, i - 1) .. ext
        end
        i = i - 1
    end
    return filename
end

function imagedb.loadData(filename)
    filename = changeFileExt(filename, ".lua")
    local data = {}
    pcall(function()
        data = dofile(filename, false) or {}
    end)
    return data
end

function imagedb.get(index)
    return imagedb.entries[index]
end

imagedb.entries = X.map(site.files {dir="/screenshots"}, function(filename, i)
    local data = imagedb.loadData(filename)
    local time = tonumber(filename:match("%-(%d%d%d%d+)%.")) - 8 * 60 * 60
    data.time = os.date("%H:%M:%S", time)
    data.date = os.date("%Y-%m-%d", time)
    data.filename = filename
    data.tags = data.tags or {}
    data.num = i

    for _, t in ipairs(data.tags or {}) do
        data.tags[t] = true
        imagedb.tags[t] = true
    end

    return data
end)

return imagedb
