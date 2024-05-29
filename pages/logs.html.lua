local Xt = require 'ext'
local tagInfo = require 'tags'

PAGE_TITLE = "Daily logs"
PAGE_DATE = ""

local logs, allTags = ReadLogs()
local allLogs

function groupImagesAndLogs(images, logs)
    local dates = {}
    local entries = {}
    local others = {}
    local pattern = "(%d+%-%d+%-%d+)[- ]?(%d+).*"

    local function initEntry(date, hour)
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
        local date, hour = image.filename:match(pattern)
        if not date and not hour then
            table.insert(others, image)
            goto continue
        end
        if not hour or hour == "00" then hour = "12" end

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
        if not hour or hour == "00" then hour = "12" end

        initEntry(date, hour)
        table.insert(entries[date][hour].logs, 1, log)

        ::continue::
    end

    table.sort(dates, function(a, b) return a > b end)

    return {
        dates = dates,
        entries = entries,
        others = others
    }
end

local function renderEntry(date)
    local result = {}
    table.insert(result, LI {
        class = "date",
        DIV { class = "line" },
        "[ " .. date .. " ]",
        DIV { class = "line" },
    })

    local day = allLogs.entries[date]

    for hourNum = 23, 0, -1 do
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
                class = "log " .. (log.tags.hidden and "hidden" or ""),
                DIV {
                    B(hourKey), " ",
                    A { href = link .. "#" .. aID, "[link]" },
                    Xt.map(log.tags, function(_, t)
                        if t == "text" then return nil end
                        return FRAGMENT {
                            SPAN " ",
                            A { href = "logs[tag=" .. t .. "].html", "#" .. t }
                        }
                    end),
                    log.title and STRONG { " > ", log.title } or "",
                },
                type(log.contents) == "string" and MD(log.contents) or log.contents,
            }
            table.insert(result, li)
        end

        if #e.images > 0 then
            local li = LI {
                class = "images",
                EM(hour .. ":00 to " .. hour .. ":59"),
                DIV {
                    ext.map(e.images, function(img)
                        return DIV {
                            class = "thumbnail-container",
                            A { href = img.filename, } / IMG { src = img.filename, loading = "lazy" },

                            DIV {
                                class = "img-tags",
                                Xt.map(img.tags, function(_, t)
                                    return FRAGMENT {
                                        SPAN " ",
                                        A { href = "logs[tag=" .. t .. "].html", "#" .. t }
                                    }
                                end)
                            }
                        }
                    end)
                }
            }
            table.insert(result, li)
        end

        ::continue::
    end

    return FRAGMENT(result)
end

local images, imageTags = ReadImages()
for k in pairs(imageTags) do
    allTags[k] = true
end

local sortedTags = {}
for k in pairs(allTags) do
    table.insert(sortedTags, k)
end

table.sort(sortedTags)

local fparams = GetFilenameParams()
local page = tonumber(fparams.page) or 1
local viewWeek = fparams["view-week"]
local tag = fparams.tag or ""

if not Xt.isEmptyString(tag) then
    logs = Xt.filter(logs, function(log)
        return log.tags[tag]
    end)
    images = Xt.filter(images, function(img)
        return img.tags[tag]
    end)
end

allLogs = groupImagesAndLogs(images, logs)

local list = {}
local groups = { {} }
local pageSize = 5

if not Xt.isEmptyString(tag) then
    page = 1
    for _, date in ipairs(allLogs.dates) do
        table.insert(groups[page], date)
    end
else
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
end

local logsToShow = (groups[page] or {})

for _, date in ipairs(logsToShow) do
    table.insert(list, renderEntry(date))
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
            font_family = "sans",
            overflow_wrap = "break-word",
            white_space = "pre-wrap",
            color = "#aff"
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
        CSS "#popup" {
            position = "fixed",
            top = 0,
            left = 0,
            width = "100vw",
            height = "100vh",
            background = "#222b",
            display = "flex",
            align_items = "center",
            justify_content = "center",

            CSS ".popup-header" {
                position = "absolute",
                left = 0,
                top = 0,
                width = "100%",
                display = "flex",
                justify_content = "center",
                column_gap = 30,
                margin = 20,

                CSS "button" {
                    background = "red",
                    font_size = "1.0em",
                }
            },

            CSS ".popup-header" {
                ["@media"] = "(max-width: 900px)",
                CSS "button" {
                    ["@media"] = "(max-width: 900px)",
                    text_size_adjust = "none",
                    font_size = "1.5em",
                }
            },

            CSS "#image-filename" {
                position = "absolute",
                bottom = 0,
                left = 0,
            },

            CSS "img" {
                object_fit = "contain",
                width = "80vw",
                height = "80vh",
            },
        },

        CSS "a.clear" {
            text_decoration = "none",
            font_size = "0.7em",
        },


        CSS "a.tag" {
            text_decoration = "none",
            [":hover"] = { color = "red" }
        },

        CSS ".thumbnail-container" {
            position = "relative",
            CSS ".img-tags" {
                position = "absolute",
                bottom = -2,
                left = 0,
                background = "#222c",
                CSS "a" {
                    color = "white",
                    text_decoration = "none",
                    font_size = "0.7em",
                    margin_right = 5,
                    [":hover"] = { color = "red" }
                }
            }
        },

        CSS ".hidden" {
            display = "none",
        }
    },

    PP [[
        In here are the list of things I did for a particular hour or day.
        Also included here are the screenshots of games I played, or videos
        I watched or listened to, or just random things I stumbled upon.
        I'll occasionally write down what I'm thinking, or things
        I'm planning to do.
    ]],

    not Xt.isEmptyString(tag) and DIV {
        style = "text-align: center",
        BR,
        I {
            style = "font-size: 1.3em", "showing entries with tag ",
            SPAN {
                style = "color:red",
                "#",
                tag
            }
        },
        SPAN " ",
        A { class = "clear", title = "clear tags", href = "/logs.html", "✗" },
        tagInfo[tag] and DIV {
            H2 { tagInfo[tag] }
        }
    },
    DETAILS {
        SUMMARY ^ I "all tags ",
        DIV {
            Xt.map(sortedTags, function(t)
                return SPAN {
                    " ",
                    A { class = "tag", href = SetFilenameParams(PAGE_PATH, { tag = t }), "#" .. (t == tag and "*" or "") .. t },
                }
            end)
        },
    },
    BR,

    nav(A { id = "top", href = "#bottom", "[bottom]" }),
    BR,

    UL { class = "main", list },

    DIV {
        id = "popup",
        style = "visibility: hidden",
        DIV {
            class = "popup-header",
            BUTTON {
                id = "prev",
                "previous"
            },
            SPAN,
            BUTTON {
                id = "close",
                "close"
            },
            SPAN,
            BUTTON {
                id = "next",
                "next"
            },
        },
        DIV {
            id = "image-filename",
            "test",
        },
        DIV {
            id = "popup-body",
        }
    },

    nav(A { id = "bottom", href = "#top", "[top]" }),
    DIV { id = "bottom" },

    SCRIPT { src = "logs.js" },
}
