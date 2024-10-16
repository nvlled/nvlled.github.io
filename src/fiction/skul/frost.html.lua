dofile("init")
local LAYOUT = require("fiction.layout")
local page = require("page")
page.data.title = 'Skul'

return LAYOUT {
    read = true,

    IMG { src = "images/frost.png" },
    PRE [[
        After a while, the room was starting to get polluted
        with suffering, so you wrote a spell named "iscream4icecream":

            #include &lt;stdspell&gt;
            student s;
            cin &gt;&gt; s;

            while (isBurning(s))
                extinguish(s);

        "Compile" you say with a tap. A green light went on,
        and swished and swashed with your wand,
        and executed ./iscream4icecream.

        With the burning student as your input,
        shaves of ice sprayed out of the tip of your wand
        towards the unfortunate one.

        Slowly, the fire went out as the student got buried
        with snow. The surrounding students stepped further away
        from the commotion.

        ]] / A { href = "graybeard.html", '"Oh ho" mourned the graybeard.' }
}
