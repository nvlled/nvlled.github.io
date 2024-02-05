return CSS '' {
    CSS 'body' {
        color = "white",
        background_color = "#233",
        margin = 20,
        font_size = '120%',
        max_width = '840',
    },

    CSS 'a' {
        color = '#dff',
        [':visited'] = {
            color = '#bee',
        },
    },

    pre = {
        margin_left = 0,
        padding = 0,
        font_family = '"Courier New", Courier, monospace',
        white_space = "pre-line",

        CSS 'code' {
            white_space = "pre",
        }
    },


    ['h1, h2, h3, h4, h5, h6'] = { margin = 2 },

    ul = {
        margin_top = 0
    }
}
