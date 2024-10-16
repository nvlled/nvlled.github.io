dofile("init")
local LAYOUT = require("fiction.layout")
local page = require("page")

page.data.title = 'Fiction list'

return LAYOUT {
    H1 'Unfinished Fictions';

    P [[
        [12/2023] In here are fictions I wrote out of whim.
        All of them are unfinished, and I doubt
        I would ever find the time or energy to finish
        them, or even just edit them.
    ]];

    P "I don't think these works of junks have any"
        / "literary value even in the most generous sense."
        / "But I think they are at least amusing to read,"
        / "in more ways than one.";

    P [[
        If you have questions, or anything to comment about,
        feel free to message me at gmail.com, with the username
    ]] / B 'nvlled';

    UL {
        LI(A {href="walghvoghel.html"; "Walghvoghel (2021)"});
        LI {A {href="cabbit.html"; "Tails of Cabbit (2016)"}};
        LI {A {href="skul/index.html"; "Skul (2015)"}};
        LI {A {href="missing.html"; "Missing (2014)"}};
    };
}
