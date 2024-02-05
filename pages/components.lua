LAYOUT = function(args)
    local props, children = GetComponentArgs(args)
    return HTML {
        HEAD {
            META { charset = "UTF-8" },
            LINK { rel = "stylesheet", href = Rel(props.css or "/style.css") },
            TITLE(PAGE_TITLE or "*"),
            props.style and STYLE(props.style),
        },
        BODY {
            id = props.id,
            BR,

            DIV {
                id = "page-navigation",
                UL {
                    LI / A { href = "/", "home" },
                    LI / A { href = "/fiction", "fiction" },
                    LI / A { href = "/notes", "notes" },
                    LI / A { href = "/logs.html", "logs" }
                },
            },
            (PAGE_PATH ~= "/index.html" and PAGE_PATH ~= "/") and {
                DIV {
                    BR {},
                    PAGE_TITLE and H1 { id = "page-header", PAGE_TITLE },
                    PAGE_DATE and SMALL { id = "page-date", PAGE_DATE },
                }
            },
            children,
        }
    }
end

FIC_LAYOUT = function(args)
    local props, children = GetComponentArgs(args)
    return HTML {
        HEAD {
            META { charset = "UTF-8" },
            LINK { rel = "stylesheet", href = Rel(props.css or "/fiction/common.css") },
            TITLE(PAGE_TITLE or "*"),
        },
        BODY {
            props.read and DIV {
                A { href = Rel("/fiction/index.html"), "[back]" },
            } or DIV {
                A { href = "/", "[home]" },
            },
            BR,
            BR,
            children,
        }
    }
end
