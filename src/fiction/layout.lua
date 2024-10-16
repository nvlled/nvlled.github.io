local path = require("path")
local page = require("page")

return function(args)
    local node = DIV(args)
    local props, children = node.attrs, node.children
    return HTML {
        HEAD {
            META { charset = "UTF-8" },
            LINK { rel = "stylesheet", href = path.relative(props.css or "/fiction/common.css") },
            TITLE(page.data.title or "*"),
        },
        BODY {
            props.read and DIV {
                A { href = path.relative("/fiction/index.html"), "[back]" },
            } or DIV {
                A { href = "/", "[home]" },
            },
            BR,
            BR,
            children,
        }
    }
end