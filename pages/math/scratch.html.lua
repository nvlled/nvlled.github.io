PAGE_TITLE = ""

return LAYOUT {
    FORM {
        DIV {
            "x", INPUT { id = "x", size = "3" },
            SPAN " = ",
            "a",
            INPUT { id = "a", size = "3" },
            SPAN " * ",
            "b", INPUT { id = "b", size = "3" },
            " + ",
            INPUT { id = "c", size = "3" },
            SPAN " ",
            BUTTON { id = "fill", "fill" },
            BUTTON { id = "run", "run" },
        },
        TABLE { id = "result" }
    },
    SCRIPT { src = "/js/fengari-web.js", type = "text/javascript" },
    SCRIPT { src = "math.js.lua", type = "text/lua", async = true },
    STYLE {
        CSS "table#result td"{
            border="1px solid gray",
            padding=5,
        }
    }
}
