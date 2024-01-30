-- TODO: convert remaining tsx files
-- TODO: deploy

PAGE_TITLE = "Home"
PAGE_DESC = "blah"

local entries = GetPageList()

local fiction = {}
local notes = {}

for _, page in ipairs(entries) do
    local base = GetBasePath(page.link)
    local dir = path.dirname(page.link)
    local filename = path.basename(page.link)
    if base == "fiction" and page.link ~= "/fiction/index.html" and
        (dir == "/fiction" or filename == "index.html") then
        table.insert(fiction, page)
    elseif base == "notes" then
        table.insert(notes, page)
    end
end

notes = ext.slice(notes, 1, 5)
fiction = ext.slice(fiction, 1, 5)

return LAYOUT {
    id = "home",

    H2 / A { href = "/notes/index.html", "Recent Notes" },
    UL {
        class = "navigation",
        ext.map(notes, function(page)
            return LI {
                A { href = page.link, ext.alt(page.title, page.link) },
                " ",
                SMALL / A { href = page.link, "[" .. ext.alt(page.link) .. "]" }
            }
        end),
        BR,
    },

    BR,

    H2 / A { href = "/fiction/index.html", "Fiction" },
    UL {
        class = "navigation",
        ext.map(fiction, function(page)
            return LI {
                A { href = page.link, ext.alt(page.title, page.link) },
                " ",
                SMALL /
                A { href = page.link, "[" .. ext.alt(page.link) .. "]" }
            }
        end)
    },
}
