PAGE_TITLE = ""
PAGE_DATE = ""
PAGE_PATH = PAGE_PATH or ""
PAGE_TAGS = {}

Rel = function(targetPath) return ext.relativePath(targetPath, PAGE_PATH) end

require "components"
ext = require "ext"


function ReadLogs()
    local text = Slurp("../logs.txt")
    local logs = {}

    local i, j = text:find("(%d+)-(%d+)-(%d+)")
    if i then
        while true do
            local i2, j2 = text:find("(%d+)-(%d+)-(%d+)", j)
            local done = false
            local section = ""
            if not i2 then
                done = true
                section = text:sub(i, -1)
            else
                section = text:sub(i, i2 - 2)
            end

            section = ext.trim(section)

            local a, b = section:find("\n")
            if b then
                local date = ext.trim(section:sub(1, a))
                local contents = ext.trim(section:sub((b or 0) + 1, -1))

                if contents then
                    table.insert(logs, {
                        date = date,
                        contents = contents
                    })
                end
            end

            i = i2
            j = j2

            if done then break end
        end
        table.sort(logs, function(a, b) return a.date > b.date end)
    end
    return logs
end
