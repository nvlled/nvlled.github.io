
dofile("init")
local LAYOUT = require("fiction.layout")
local page = require("page")
page.data.title = 'Skul'

return LAYOUT {
    read = true,

    IMG { src = "images/fireball.png" },
    PRE [[
        "Let's go through the basics of conjuring a spell again."

        "First you write down your spells in a scroll."

        "Then you tap it with your wand and utter the word 'compile'."

        "If you did your spell correctly,
        a green light will appear that tells you
        the precise wand movements to execute your spell.
        Also, remember that the name you gave the to the scroll
        will be the name of the spell."

        "But if you did something wrong, a red light will appear,
        and the your error will be shown on your scroll."

        "Okay, let's try it out."

        The graybeard took out his wand, tapped the scroll named
        "gotohell" with the spells written in it,
        then uttered "compile". A green light appeared,
        making a spiral motion then an
        upward-downward motion.

        The graybeard then imitated the
        movement created by the green light,
        then yelled "GOTOHELL!", pointing
        his wand to a student sitting in front.

        A fireball shot out of the wand and
        the student without a soul burst into flames.

        "WHA HA HA" blurted demonically by the instructor
        as the flaming student rolled on the ground. Everyone else
        stood still, immobilized with indifference or amusement.

        ]] / A { href = "frost.html", "So they watched" }
}
