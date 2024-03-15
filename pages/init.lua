PAGE_TITLE = ""
PAGE_DATE = ""
PAGE_PATH = PAGE_PATH or ""
PAGE_TAGS = {}

local utc = os.date("!*t", os.time())
utc.hour = utc.hour + 8
NOW = os.time(utc)

Rel = function(targetPath) return ext.relativePath(targetPath, PAGE_PATH) end

require "components"
local markdown = require "markdown"
ext = require "ext"

MD = Node("", {
    tostring = function(node)
        local str = ext.trim(table.concat(node.children, ""))
        local lines = {}
        for line in ext.split(str, "\n") do
            line = ext.trim(line)
            if line:sub(1, 2) == "| " then
                line = "    " .. line:sub(3)
            end
            table.insert(lines, line)
        end
        return markdown(table.concat(lines, "\n"))
    end
})


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

if COMMAND_ARG == "build" then
    OnPostRender(function(contents)
        local links = FindLocalLinksWithFilenameParams(contents)
        local hrefs = {}
        for _, link in ipairs(links) do
            table.insert(hrefs, link.attrs.href)
        end
        QueueBuildFiles(hrefs)

        return contents
    end)
end
