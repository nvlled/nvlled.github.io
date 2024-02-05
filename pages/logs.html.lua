PAGE_TITLE = "Daily logs"
PAGE_DATE = ""

local logs = ReadLogs()

-- TODO:
-- group each log and images by day
-- and group each day by hour
-- -------------[ 2023-01-01 ]----------------------
-- 6:00 img1 img2 img3
--
-- 6:00 blah blah blah
-- 6:30 blah blah blah
--
-- 7:00 img1 img2 img3
--
-- 9:00 img1 img2 img3
-- 9:21 blah blah blah
-- -------------[ 2023-01-02 ]----------------------

local logs2 = {
    ["2023-01-01"] = {
        ["6:00"] = {
            images = {
                "/image1.png",
                "/image2.png",
            },
            logs = {
                {
                    contents = "",
                    date = "2023-01-01 6:10",
                },
                {
                    contents = "",
                    date = "2023-01-01 6:30",
                },
            }
        },
    },
}

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
        table.insert(entries[date][hour].images, image)

        ::continue::
    end

    for _, log in ipairs(logs) do
        local date, hour = log.date:match(pattern)
        if not date and not hour then
            table.insert(others, log)
            goto continue
        end

        initEntry(date, hour)
        table.insert(entries[date][hour].logs, log)

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

local list = {}
for _, date in ipairs(allLogs.dates) do
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
            local li = LI {
                B(hourKey), " ",
                PP(log.contents),
            }
            table.insert(list, li)
        end

        if #e.images > 0 then
            local li = LI {
                class = "images",
                EM(hour .. ":00 to " .. hour ..":59"),
                DIV {
                    ext.map(e.images, function(img)
                        return A { href = img, } / IMG { src = img }
                    end)
                }
            }
            table.insert(list, li)
        end

        ::continue::
    end
end


return LAYOUT {
    STYLE {
        CSS "pre" {
            margin = 0,
            overflow_x = "inherit",
            line_height = "1",
            font_family = "sans"
        },
        CSS "li" {
            list_style_type = "none",
            margin_bottom = "5px",
            border_left = "2px solid #4ff",
            padding_left = 10,

            CSS "img" {
                width = 200,
                margin = 5
            },

        },

        CSS "li.images" {
            list_style_type = "none",
            border_left = "2px solid #444",
            padding_left = 10,
            font_size="90%",
            CSS "div" {
                display = "flex",
                flex_wrap = "wrap",
                align_items = "center",
            }
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
        }
    },

    PP [[
        In here are the list of things I did for a particular hour or day.
        Also included here are the screenshots of games I played, or videos
        I watched or listened to, or just random things I stumbled upon.

        I'll probably occasionally write down what I'm thinking, or things
        I'm planning to do.
    ]],

    UL(list),
}
