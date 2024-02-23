PAGE_TITLE = "Daily logs"
PAGE_DATE = ""

local logs = ReadLogs()

function groupImagesAndLogs(images, logs)
    table.sort(images)
    table.sort(logs, function(a, b) return a.date < b.date end)

    local dates = {}
    local entries = {}
    local others = {}
    local pattern = "(%d+-%d+-%d+)[- ]?(%d+).*"

    local function initEntry(date, hour)
        if not hour then hour = "12" end

        if not entries[date] then
            entries[date] = {}
            table.insert(dates, 1, date)
        end
        if not entries[date][hour] then
            entries[date][hour] = {
                images = {},
                logs = {},
            }
        end
    end

    for _, image in ipairs(images) do
        local date, hour = image:match(pattern)
        if not date and not hour then
            table.insert(others, image)
            goto continue
        end

        initEntry(date, hour)
        table.insert(entries[date][hour].images, 1, image)

        ::continue::
    end

    for _, log in ipairs(logs) do
        local date, hour = log.date:match(pattern)
        if not date and not hour then
            table.insert(others, log)
            goto continue
        end

        initEntry(date, hour)
        table.insert(entries[date][hour].logs, 1, log)

        ::continue::
    end



    return {
        dates = dates,
        entries = entries,
        others = others
    }
end

local images = {}
for name, kind, ino, off in assert(unix.opendir("screenshots")) do
    if name ~= "." and name ~= ".." then
        table.insert(images, 1, "/screenshots/" .. name)
    end
end

local allLogs = groupImagesAndLogs(images, logs)

local fparams = GetFilenameParams()
local page = tonumber(fparams.page) or 1
local viewWeek = fparams["view-week"]

local list = {}
local groups = { {} }
local pageSize = 5

if viewWeek then
    local tyear, tmonth, tweek = viewWeek:match("(%d+)%-(%d+)%-w(%d+)")
    for _, date in ipairs(allLogs.dates) do
        local year, month, day = date:match("(%d+)%-(%d+)%-(%d+)")
        local week = tonumber(day) // 8

        if tyear == year and tmonth == month and tweek == tostring(week) then
            table.insert(groups[page], date)
        end
    end
else
    for _, date in ipairs(allLogs.dates) do
        if #groups[#groups] >= pageSize then
            table.insert(groups, {})
        end
        table.insert(groups[#groups], date)
    end
end

for _, date in ipairs(groups[page] or {}) do
    table.insert(list, LI {
        class = "date",
        DIV { class = "line" },
        "[ " .. date .. " ]",
        DIV { class = "line" },
    })

    local day = allLogs.entries[date]
    for hourNum = 23, 1, -1 do
        local hour = tostring(hourNum)
        local e = day[hour]
        if not e then goto continue end

        for _, log in ipairs(e.logs) do
            local hourKey = log.date:sub(12, 16):gsub(" ", "-")
            local aID = log.date:gsub(" ", "-")

            local link
            do
                local year, month, day = log.date:match("(%d+)%-(%d+)%-(%d+)")
                local week = tonumber(day) // 8
                link = "/logs[view-week=" .. year .. "-" .. month .. "-w" .. week .. "].html"
            end

            local li = LI {
                id = aID,
                class = "log",
                B(hourKey), " ",
                A { href = link .. "#" .. aID, "[link]" },
                MD(log.contents),
            }
            table.insert(list, li)
        end

        if #e.images > 0 then
            local li = LI {
                class = "images",
                EM(hour .. ":00 to " .. hour .. ":59"),
                DIV {
                    ext.map(e.images, function(img)
                        return A { href = img, } / IMG { src = img, loading = "lazy" }
                    end)
                }
            }
            table.insert(list, li)
        end

        ::continue::
    end
end

local nav = function(link)
    return DIV {
        class = "page-nav",
        function()
            if viewWeek then
                return A { href = SetFilenameParams(PAGE_PATH, {}), "←newest" }
            end
            if page > 1 then
                return A { href = SetFilenameParams(PAGE_PATH, { page = page - 1 }), "←newer" }
            end
            return DIV {}
        end,
        link,

        function()
            if viewWeek then
                local tyear, tmonth, tweek = viewWeek:match("(%d+)%-(%d+)%-w(%d+)")
                return viewWeek and EM ^ SMALL {
                    "viewing logs for ",
                    tyear .. "-" .. tmonth .. " week " .. tonumber(tweek + 1)
                }
            end
            if page < #groups then
                return A { href = SetFilenameParams(PAGE_PATH, { page = page + 1 }), "older→" }
            end
            return DIV ""
        end

    }
end


return LAYOUT {
    STYLE {
        CSS "pre" {
            margin = 0,
            overflow_x = "inherit",
            line_height = "1",
            font_family = "sans"
        },

        CSS "ul" { padding = 0 },

        CSS "li.log" {
            list_style_type = "none",
            margin_bottom = "5px",
            border_left = "2px solid #4ff",
            padding_left = 10,

            CSS "img" {
                width = "100%",
            },

            CSS "li" {
                margin_left = 30
            },
        },

        CSS "li.images" {
            list_style_type = "none",
            border_left = "2px solid #444",
            padding_left = 10,
            font_size = "90%",
            CSS "div" {
                display = "flex",
                flex_wrap = "wrap",
                align_items = "center",
            },
            CSS "img" {
                width = 170,
                height = 100,
                margin = 5,
                object_fit = "cover",
            },
        },

        CSS "li.date" {
            border_left = "none",
            list_style_type = "none",
            text_align = "center",
            display = "flex",
            align_items = "center",
            justify_content = "center",

            CSS ".line" {
                border_bottom = "1px solid white",
                width = "40%",
            },
        },
        CSS ".page-nav" {
            display = "flex",
            position = "relative",
            justify_content = "space-between",
            CSS "a" { display = "block", },
            CSS "#top, #bottom" {
                position = "absolute",
                left = "45%"
            },
        },
    },

    PP [[
        In here are the list of things I did for a particular hour or day.
        Also included here are the screenshots of games I played, or videos
        I watched or listened to, or just random things I stumbled upon.
        I'll occasionally write down what I'm thinking, or things
        I'm planning to do.
    ]],

    nav(A { id = "top", href = "#bottom", "[bottom]" }),
    UL { class = "main", list },
    #list > 5 and nav(A { id = "bottom", href = "#top", "[top]" }),
}
