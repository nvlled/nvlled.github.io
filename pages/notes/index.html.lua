PAGE_TITLE = "Notes"

local subPages = {}
local notes = {}

for _, page in ipairs(GetPageList()) do
    local root = page.link:match("^/notes/")
    if page.link == "/notes/index.html" then goto continue end
    if root ~= "/notes/" then goto continue end

    if page.path.dir ~= "/notes" then
        if page.path.base ~= "index.html" then
            if not subPages[page.path.dir] then
                subPages[page.path.dir] = {}
            end
            table.insert(subPages[page.path.dir], page)
        else
            table.insert(notes, page)
        end
    else
        table.insert(notes, page)
    end

    ::continue::
end

return LAYOUT {
    PP [[
        These are my baseless, unfounded ramblings about things.
        They are at most maybe-work-in-progress drafts that are most likely
        not useful or interesting to anyone but me (or maybe not me).
    ]],

    UL {
        class = "navigation",
        ext.map(notes, function(page)
            local sub = subPages[page.path.dir]
            return LI {
                A { href = page.link } / ext.alt(page.title, page.link),
                " ",
                SMALL /
                A { href = page.link, "[" .. ext.alt(page.link) .. "]" },
                sub and UL {
                    ext.map(sub, function(p)
                        return LI {
                            A { href = p.link, p.title },
                            " ",
                            SMALL /
                            A { href = p.link, "[" .. ext.alt(p.link) .. "]" },
                        }
                    end)
                }
            }
        end)
    },
}
