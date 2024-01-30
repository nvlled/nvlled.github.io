PAGE_TITLE = "Notes"

-- TODO: finish converting all other tsx files
-- TODO: find all other notes I wrote and dump them all here
--[[

Catchsup [/notes/catchsup.html]
Habit builder [/notes/habit-builder.html]
First ideas and plan [/notes/first-ideas-and-plan.html]
Entrepreneur [/notes/entrepreneur.html]
Myrmarachne [/notes/myrmarachne.html]
Abstraction [/notes/abstraction.html]
Learning Game Development [/notes/gamedev/index.html]
  - Page 1[/notes/gamedev/page1.html]
  - Page 2[/notes/gamedev/page12html]

]]

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
