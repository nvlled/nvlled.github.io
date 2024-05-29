PAGE_TITLE = "Skul"

return FIC_LAYOUT {
    read = true,

    IMG { src = "images/class.png" },
    PRE [[
        You arrived at the semi-crowded classroom.
        You took the backrow seat because it's comfy
        being in the back.

        Minutes later, the classroom is filled with
        black-robed, mostly soul-less students and the
        instructor arrived then shortly.

        "Today we will be discussing about magical incantations
        of if statements." said the gray-beard instructor without
        delay.

        "If statements allow you to conjure spells that are
        dependent on the situtation."

        "Before, you could only cast a fireball and shoot
        whatever is in the way."

        "Now, you can shoot fireballs only at specified targets,
        let's say, students who aren't wearing their souls."

        The students briefly exchanged glances.

        Then the instructor abruptly turned around and faced
        the whiteboard. He quickly scribbled the magical syntax
        of if statements.
        ]] / CODE [[
        | #include &lt;stdspell&gt;
        |
        | person target;
        | cin &gt;&gt; target;
        |
        | if (!hasSoul(target)) {
        |     shootFireball(target);
        | }
        ]] / [[

        The rest of the class followed and copied the writings
        on the board.

        "Okay, everyone take their wands out and we'll do some practice."

        ]] / A { href = "fireballs.html", "Everyone complied." }
}
