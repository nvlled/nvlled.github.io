PAGE_TITLE = "Calculus for programmers"
PAGE_DATE = "2024-02-07 18:50"

return LAYOUT {
    H1 ^ EM ^ "TODO",

    UL {
        LI "Introduction",
        LI "About me",
        LI "About you",
        LI "Functions",
        LI "Curves, graphs and locus",
    },

    H2 "Introduction",

    H2 "About me",
    PP [[
        The author (that's me) is a smelly NEET who
        is currently struggling to find a cozy remote
        job. The author is also too dumb to get a CS or math degree,
        but the author nonetheless decided to write something
        about calculus.
    ]],

    H2 "About you",
    PP [[
        This document assumes you have written lots
        of code before, preferrably in the style of function programming.
        Just as lots of calculus texts build up intuition from the respective
        author's domain (physics, finance, economics), I will build up intuition
        from the perspective of a programmer. Which is to say, no special
        domain knowledge required, other than basic algebra.
    ]],
}
