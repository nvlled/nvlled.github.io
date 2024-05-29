PAGE_TITLE = ""
PAGE_DATE = ""
PAGE_PATH = PAGE_PATH or ""
PAGE_TAGS = {}

require "components"
local markdown = require "markdown"
local Xt = require "ext"
ext = require "ext"


local utc = os.date("!*t", os.time())
utc.hour = utc.hour + 8
NOW = os.time(utc)

Rel = function(targetPath) return ext.relativePath(targetPath, PAGE_PATH) end


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


function ReadImages()
    if not SharedState.readImagesData then
        SharedState.readImagesData = {
            images = {},
            tags = {},
            modified = 0,
        }
    end
    local data = SharedState.readImagesData
    local dir = "screenshots"

    local modified = unix.stat(dir):mtim()
    if modified < data.modified then
        return data.images, data.tags
    end

    local tags = {}
    local images = {}
    for name, _, _, _ in assert(unix.opendir(dir)) do
        if name ~= "." and name ~= ".." then
            local imageTags = GetFilenameParams(name)
            local filename = "/screenshots/" .. name

            for k, v in pairs(imageTags) do
                if v ~= true then
                    imageTags[k] = nil
                else
                    tags[k] = true
                    imageTags[k] = true
                end
            end

            table.insert(images, 1, {
                filename = filename,
                tags = imageTags
            })
        end
    end

    data.images = images
    data.tags = tags
    data.modified = os.time()

    table.sort(images, function(a, b) return a.filename < b.filename end)

    return images, tags
end

function ReadLogs()
    local filenames = { "../logs.txt" }
    local logsDir = "../logs"

    local allLogs = {}
    local allTags = {}
    for _, f in ipairs(filenames) do
        if ext.endsWith(f, ".txt") then
            local logs, tags = readLogs(f)
            for _, l in ipairs(logs) do
                table.insert(allLogs, l)
            end
            for _, t in ipairs(tags) do
                allTags[t] = true
            end
        elseif ext.endsWith(f, ".lua") then
            local filename = logsDir .. "/" .. f
            local log = dofile(filename)
            table.insert(allLogs, log)

            local tags = {}
            for _, t in ipairs(log.tags) do
                allTags[t] = true
                tags[t] = true
            end
            log.tags = tags
        end
    end
    table.sort(allLogs, function(a, b) return a.date < b.date end)

    return allLogs, allTags
end

function readLogs(filename)
    local text = Slurp(filename)
    local logs = {}
    local allTags = {}

    local i, j = text:find("@(%d+)%-(%d+)%-(%d+)")
    if i then
        while true do
            local i2, j2 = text:find("@(%d+)%-(%d+)%-(%d+)", j)
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
                local date = ext.trim(section:sub(2, a))
                local contents = ext.trim(section:sub((b or 0) + 1, -1))

                local tags = { text = true }
                for s in string.gmatch(date, "#[%w_-]+") do
                    s = s:sub(2)
                    tags[s] = true
                    allTags[s] = true
                end

                if contents then
                    table.insert(logs, {
                        date = date,
                        tags = tags,
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

    allTags['text'] = true
    allTags['hidden'] = nil

    return logs, allTags
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
