dofile("init")

local LAYOUT = require("layout")
local aggregate = require("notes.aggregate")
local ext = require("ext")

local sortedTags = {}
for k, items in pairs(aggregate.tags) do
    table.insert(sortedTags, {name=k; count=#items})
end
table.sort(sortedTags, function(a, b)
    return a.name < b.name
end)

return LAYOUT {
    UL(ext.map(sortedTags, function(t)
        return SPAN {
            A {href="/notes/index[tag=" .. t.name .. "].html"; "#" .. t.name};
            SMALL {"(";tostring(t.count);")"};
            NBSP;
        }
    end));
    STYLE {CSS "a" {text_decoration="none"}};
}
