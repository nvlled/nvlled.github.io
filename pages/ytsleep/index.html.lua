return HTML {
    HEAD {
        META { charset = "UTF-8" },
        TITLE("-"),
        COMMAND_ARG == "serve" and SCRIPT(AUTORELOAD_SCRIPT),
        STYLE {
            CSS "body" {
                max_width = 840,
                font_size = "150%",
                color = "#ddd",
                background = "#222",
                CSS "#inputURL" {
                    color = "#eee",
                    background = "#333",
                },
            },
            CSS "div#input" {
                display = "flex",
                align_items = "center",
                CSS "> *" {
                    margin_right = 20,
                },
            },
            CSS "#inputURL" {
                width = "70%",
            },

            CSS "#timerRange" {
                width = "50%",
            },

            CSS_MEDIA "(max-width: 1250px)" {
                CSS "body" {
                    max_width = "unset",
                },
                CSS "#player" {
                    width = "100%",
                },
            }
        }
    },

    -- TODO: loop video
    -- TODO: load video button
    -- TODO: stop timer on error

    BODY {
        DIV {
            INPUT { id = "inputURL", placeholder = "enter youtube URL" },
            BUTTON {id="load", "load video" },
        },
        BR,
        DIV {
            id = "input",
            INPUT { id = "timerRange", type = "range", min = "1", max = "60", readonly = true },
            SPAN { id = "timerText" },
            LABEL {
                INPUT { id="loop", type = "checkbox" },
                "loop?",
            }
        },

        BR,
        DIV { id = "player" },
        SCRIPT { src = "script.js" },
    }
}
