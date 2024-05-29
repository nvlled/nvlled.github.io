return LAYOUT {
    STYLE {
        CSS "body" {
            max_width = "unset",
        },
        CSS "#table-container" {
            left = 0,
            position = "relative",

            CSS "#selector" {
                position = "absolute",
                background = "#f00a",
                top = 0,
                left = 0,
                width = "10px",
                height = "10px",
                pointer_events = "none"
            },

            CSS "table" {
                border_spacing = 0,
                border_collapse = "collapse",
            },
            CSS "tr" {
                margin = 0,
                padding = 0,
                outline = 0,
            },
            CSS "td" {
                width = "50px !important",
                height = "50px !important",
                min_width = "50px !important",
                min_height = "50px !important",
                max_width = "50px !important",
                max_height = "50px !important",
                margin = 0,
                padding = 0,
                outline = 0,
                border = "1px solid white",
                font_size = "0.6em"
            },
            CSS "td.selected" {
                background = "red"
            },
        },
        CSS "#canvas-container" {
            display = "flex",
            justify_content = "center",
        },
        CSS "#buttons" {
            display = "flex",
            justify_content = "center",
            margin_bottom = 5,
        },
        CSS "canvas" {
            border = "1px solid white",
            --width = "100%",
        },
        CSS "input" {
            width = 40,
        }
    },
    --LABEL { "scale", INPUT { name = "scale", type = "number", min = "0.5", max = "2", value = "1", step = "0.1" }, },
    --SPAN " ",
    --LABEL { "origin", INPUT { name = "tx", type = "number", value="0" }, },INPUT { name = "ty", type = "number", value="0" },

    DIV {
        id = "buttons",
        --BUTTON { "select & move" },
        SELECT {
            OPTION { "select & move" },
            OPTION { "insert" }
        },
    },

    DIV {
        id = "table-container",
        TABLE {},
        DIV { id = "selector" },
    },

    DIV {
        id = "canvas-container",
        CANVAS {},
    },

    P {
        id = "debug",
    },

    SCRIPT { src = "/js/fengari-web.js" },
    --SCRIPT { src = "ant.js.lua", type = "text/lua", async = true },
    SCRIPT { src = "ant.js", },
}
