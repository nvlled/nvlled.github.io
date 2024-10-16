local page = require "page"
local path = require "path"

local function LAYOUT(args)
    local node = DIV(args)
    local attrs, children = node.attrs, node.children
    return HTML {
        HEAD {
            META {charset="UTF-8"};
            LINK {
                rel="stylesheet";
                href=path.relative(attrs.css or "/style.css");
            };
            TITLE(page.data.title or "");
            attrs.style and STYLE(attrs.style);
        };
        BODY {
            id=attrs.id;
            BR;

            DIV {
                id="page-navigation";
                UL {
                    LI / A {href="/"; "⌂ home"};
                    LI / A {href="/about.html"; "about"};
                    LI / A {href="/fiction/index.html"; "fiction"};
                    LI / A {href="/notes/index.html"; "notes"};
                    LI / A {href="/notes/tags.html"; "tags"};
                };
            };

            DIV {
                id="random-navigation";
                UL {
                    LI "[ random:";
                    LI / A {href="/notes/random-note.html"; "note"};
                    LI "/";
                    LI / A {href="/notes/random-image.html"; "image"};
                };
                "]";
            };

            (page.PAGE_LINK ~= "/index.html" and page.PAGE_LINK ~= "/") and {
                DIV {
                    page.title and H1 {id="page-header"; page.title};
                    page.date and SMALL {id="page-date"; page.date};
                };
            };
            children;

            BR;
            BR;
            BR;

            P {
                style="text-align: center; font-size: 70%";
                SPAN {
                    function()
                        return "site last updated on "
                                   .. string.lower(
                                       os.date("%Y-%m-%d", os.time()))
                    end;
                    " | created with ";
                    A {href="https://github.com/nvlled/moontpl"; "moontpl"};
                };
            };
        };
    }
end

return LAYOUT
