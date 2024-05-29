local fparams = GetFilenameParams()
local tag = fparams.tag or ""

local Xt = require 'ext'
local logs, tags = ReadLogs()

logs = Xt.filter(logs, function(log, i)
    return log.tags[tag]
end)

return LAYOUT {
    DIV {
        "showing tags for ", "#" .. tag .. "|"
    },

    UL {
        Xt.map(logs, function(log)
            return LI { log.date, BR, log.contents }
        end)
    },

    HR,

    H3 "All tags",
    UL {
        Xt.map(tags, function(_, t)
            return LI { 
                A {href=SetFilenameParams(PAGE_PATH, {tag=t}), t}
            }
        end)
    }
}
