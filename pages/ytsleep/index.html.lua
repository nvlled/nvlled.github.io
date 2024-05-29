return HTML {
    HEAD {
        META { charset = "UTF-8" },
        TITLE("ytsleep"),
        STYLE {
            CSS "body" {
                padding_top = 20,
                max_width = 800,
                margin = "auto",
                font_size = "150%",
                color = "#ddd",
                background = "#222",
                CSS "#inputURL" {
                    color = "#eee",
                    background = "#333",
                },
            },

            CSS "form#input" {
                display = "flex",
                align_items = "center",
                column_gap = 20,
                CSS "#inputURL" {
                    flex_grow = "1",
                },
            },

            CSS "div#settings" {
                display = "flex",
                column_gap = 10,
                align_items = "center",
                CSS "> *" {
                },
                CSS "#timerRange" {
                    flex_grow = "1",
                },
                CSS "#timerText" {
                    width=100,
                },
            },

            CSS "#player" {
                width="100%",
            },

            CSS "h1, h2, h3, h4, h5" {
                font_size="100%",
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

    BODY {
        FORM {
            id = "input",
            INPUT { id = "inputURL", placeholder = "enter youtube URL" },
            BUTTON { id = "load", "load video" },
        },
        BR,
        DIV {
            id = "settings",
            INPUT { id = "timerRange", type = "range", min = "1", max = "60", readonly = true },
            SPAN { id = "timerText" },
            LABEL {
                INPUT { id = "loop", type = "checkbox" },
                "loop?",
            }
        },

        BR,
        DIV { id = "player" },

        H1 "What's this?",
        PP [[
            A youtube UI that with a countdown timer.
            When the timer reaches zero, the video will stop playing.
            The primary use is for listening to long youtube videos before
            sleeping. 
        ]],


        SCRIPT { src = "https://www.youtube.com/iframe_api" },
        SCRIPT { src = "script.js" },
    }
}
