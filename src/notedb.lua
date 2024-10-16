local site = require "site"
local ext = require "ext"
local notedb = {}

notedb.entries = {}
notedb.map = {}

local tags = nil
local nextID = 1

local function entry(data)
    if not data._id then
        data._id = nextID
        nextID = nextID + 1
    end
    local e = {contents={}}
    for k, v in pairs(data) do
        if type(k) == "number" then
            if type(v) == "string" then
                v = ext.trim(v)
            end
            if type(v) ~= string or  #v > 0 then
                e.contents[k] = v
            end
        else
            e[k] = v
        end
    end
    for _, t in ipairs(e.tags or {}) do
        e.tags[t] = true
    end
    e.tags["text"] = true

    if not e.id then
        e.id = e.date .. "_" .. e.time
    end

    if #e.contents > 0 then
        table.insert(notedb.entries, e)
        --e.num = #e -- huh
    end
end

function notedb.getTags()
    if tags then
        return tags
    end
    tags = {}
    for _, e in ipairs(notedb.entries) do
        if not e._tags then
            goto loop
        end

        if type(e._tags) ~= "string" then
            error("tags must be a table")
        end

        for _, t in ipairs(e._tags) do
            if not tags[t] then
                tags[t] = {}
            end
            table.insert(tags[t], e._id)
        end

        ::loop::
    end
    return tags
end

function notedb.getEntriesWithTag(tag)
    local ids = tags[id]
    if not ids then
        return {}
    end
    return ext.map(ids, function(id)
        return notedb.map[id]
    end)
end

function notedb.getByDate(date, time)
    local result = {}
    for _, e in ipairs(notedb.entries) do
        if e.date ~= date then
            goto continue
        end
        if time and e.time:sub(1,5) ~= time:sub(1,5) then
            goto continue
        end
        table.insert(result, e)
        
        ::continue::
    end
    return result
end

for _, name in ipairs(site.files {dir="/notedb"; lua=true}) do
    local loadNoteDbIndex, err = loadfile(name)
    if err ~= nil then
        error(err)
    end
    local env = {}
    for k, v in pairs(getfenv()) do
        env[k] = v
    end
    env.entry = entry
    setfenv(loadNoteDbIndex, env)
    loadNoteDbIndex()
end

table.sort(notedb.entries, function(a, b)
    return (a.date .. a.time) < (b.date .. b.time)
end)

for num, note in ipairs(notedb.entries) do
    note.num = num
end

return notedb
