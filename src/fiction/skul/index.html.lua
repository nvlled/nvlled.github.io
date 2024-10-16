dofile("init")
local LAYOUT = require("fiction.layout")
local page = require("page")

page.data.title = 'Skul'

return LAYOUT {
    read = true,

    H1 { page.data.title },
    IMG { src = "images/road.png" },
    PRE [[
        It is early in the morning and you are on
        your way to your school. The weather forecast
        today is great disappointment with thunderstorms,
        so you brought a broken umbrella with you to get
        a headstart for the day. Slowly and unsurely,
        you trudge ]] / A { href = "skul.html", "your way to school." }

}
