PAGE_TITLE = "Home"
PAGE_DESC = ""

local logs = ReadLogs()
local images = ReadImages()

logs = ext.filter(logs, function(log) return not log.tags.hidden end)
logs = ext.reverse(logs)

images = ext.reverse(images)

return LAYOUT {
    id = "home",
    STYLE {
        CSS "img" {
            width = 170,
            height = 100,
            margin = 5,
            object_fit = "cover",
        },
        CSS ".images li" {
            display = "inline-block",
        },
        CSS "ol li" {
            margin_bottom = 20,
        }
    },

    H2 / "Recent images",
    UL {
        class = "images",
        ext.mapSlice(1, 8, images, function(image, i)
            return LI {
                A {
                    href = image.filename,
                    IMG { src = image.filename, lazy = true, }
                }
            }
        end),
    },

    H2 / "Recent logs",
    OL {
        class = "navigation",
        ext.mapSlice(1, 10, logs, function(log)
            local limit = 150
            local contents = type(log.contents) == "string" and log.contents or log.contents:__textContent()

            if #contents > limit then
                contents = contents:sub(1, limit) .. "..."
            end

            local aID = log.date:gsub(" ", "-")
            local year, month, day = log.date:match("(%d+)%-(%d+)%-(%d+)")
            local week = tonumber(day) // 8
            local link = "/logs[view-week=" .. year .. "-" .. month .. "-w" .. week .. "].html"

            return LI {
                contents,
                " ",
                A { href = link .. "#" .. aID, "[more]" }
            }
        end),
    },

}
