local headerLink = {
    normal = "#fff",
    visited = "#bbb",
}

return CSS {
    CSS "body " {
        color = "#dff",
        background_color = "#222",
        max_width = 800,
        margin = "auto",
        font_size = 22,
    },

    CSS "p" {
        text_align = "left",
    },

    CSS "a" {
        color = "#aff",
        [":visited"] = { color = "#9ff" },
    },

    CSS "pre" {
        overflow_x = "auto",
    },

    CSS "pre.code" {
        padding = 10,
        background_color = "#111",
        color = "#0ff",
        overflow_x = "auto",
    },


    CSS "h1 a, h2 a, h3 a, h5 a, h6 a" {
        color = headerLink.normal,
        [":visited"] = { color = headerLink.visited }
    },


    CSS "#page-header" {
        margin = 0,
    },
    CSS "#page-date" {
        color = "gray"
    },

    CSS "#page-navigation" {
        CSS "ul" { margin = 0, padding = 0,

            text_align = "center",
        },
        CSS "li" {
            display = "inline-block",
            padding_right = 15,
            padding_left = 15,
            border_right = "1px solid gray",
            border_left = "1px solid gray"
        },
        CSS "a" {
            color = headerLink.normal,
        }
    },

    CSS "ul.navigation" {
        CSS "a" {
            text_decoration = "none",
            color = "#fff",
            [":hover"] = { text_decoration = "underline", }
        },
        CSS "small a" {
            color = "#077",
            [":visited"] = { color = "#066" },
            text_decoration = "underline",
        }
    },

    CSS "h1" { font_size = "1.4em", },
    CSS "h2" { font_size = "1.35em", },
    CSS "h3" { font_size = "1.3em", },
    CSS "h4" { font_size = "1.25em", },
    CSS "h5" { font_size = "1.2em", },
    CSS "h6" { font_size = "1.em", },
}
