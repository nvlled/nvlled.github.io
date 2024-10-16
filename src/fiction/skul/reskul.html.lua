dofile("init")
local LAYOUT = require("fiction.layout")
local page = require("page")
page.data.title = 'Skul'

return LAYOUT {
    read = true,

    IMG { src = "images/halt.png" },
    PRE [[
        Almost an hour later, you got back at the school entrance.
        You pinned your soul on your chest and walked towards the
        entrance.

        "NO SOUL, NO ENTRY!" cried frosty.

        You suspended your movement in disbelief but then
        you realized frosty was addressing someone else.
        You heard the defendant make the same retort.

        You resumed walking towards the main building.
        You already missed your first class just because
        you didn't have a soul.

        A lot of students take off their souls anyways
        as soon as they got through the gate. But
        you kept your soul pinned to your heart
        because of the trouble you went through without it.

        Your next class is ]] / A { href = "class.html", "Magic Conjuration Fundamentals I." }
}
