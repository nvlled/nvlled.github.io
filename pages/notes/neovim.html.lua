PAGE_TITLE = "Neovim configuration and scripting"
PAGE_DATE = "2024-02-1 20:25"

return LAYOUT {
    H1 ^ EM ^ "TODO",

    UL {
        LI "Preamble",
        LI "Configuration",
        LI "Scripting",
        LI "Useful nvim shortcuts (see recent reddit thread)",
        LI "Other general remarks",
        LI "My current init.lua",
    },

    H2 "Preamble",
    PP [[
        Not too long ago, my vscodium has been lagging really bad lately,
        not really sure why. Worse, sometimes the neovim extension
        would bug out and break my undo history, leaving my code in a
        broken, garbled state.

        So I decided to just use neovim directly, as I realized as well
        that I was using a really old version of neovim (0.8 I think).
        Since I've been writing a lot of lua lately and I've been
        pretty comfortable with it, I decided to give lua scripting
        on neovim a try again.

        After some brief period of futzing around and non-rhetorically
        asking myself what am I even doing with my life, I managed to
        create a minimal neovim setup from scratch that I'm comfortable with,
        without any plugins (except for fzf). Writing my own configuration
        from scratch is important, since I need to know how to fix my setup
        if something broke, or more importantly, I can modify my setup
        accoring to my very specific preferences.

        In this document, I will write down the things I learned, which
        will serve as a reference in case I need to start a new setup
        from scratch again.
    ]],
}
