dofile("init")
local LAYOUT = require("fiction.layout")
local page = require("page")
page.data.title = 'Skul'

return LAYOUT {
    read = true,

    IMG { src = "images/figure.png" },
    PRE [[
        You got to your feet and walked towards the door.
        On your way, you stumbled upon the student
        who got badly burned by the graybeard and the
        other students. He was just rising
        to his feet, dusting off ashes and ices shavings.

        "You alright?" you asked the fallen one.

        "Yeah" replied the burnt one.

        You rubbed your forehead amidst the confusion, then decided
        to just go home. What's this all about? I don't know
        either, says a distant voice.
        ]]
}
