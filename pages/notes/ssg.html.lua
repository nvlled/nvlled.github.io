PAGE_TITLE = "Static Site Generator";
PAGE_DATE = "2023-02-20 00:00:00";
PAGE_DESC = "Create an SSG";

return LAYOUT {
    H1 "Yet another one",
    PP [[
    I know, there's already a million SSGs out there, yet I still decided to
    roll on my own. I should preparing for job interviews, or other more
    imortant things, but here I am, doing something that warrants the least
    amount of attention. I'd like to pretend that what I'm doing something
    uniquely different such that it requires a custom site generator. But no,
    this is just my procrastination cranked up to a notch. The idea of job
    interviews are a definite source of anxiety for me.

    If I'm making excuses anyway, I might as well do it with firm resolution. ]],
    H1 / S "Excuses" / "Reasons for creating my own",

    OL {
        LI /
        A { href = "#nih", "It's not that hard to create one" },
        LI /
        A { href = "#existing", "I don't like existing SSGs" },
        LI /
        A { href = "#deno", "I wanted to try deno" },
    },

    H1 { id = "nih", "1. It's not that hard to create one" },
    P [[
    SSGs are almost literally just text-concatenating tool that outputs a
    bunch of HTML files. I can use any tool with, even with cat+bash. While
    it's easy to create the bare minimum SSG, it's hard to create one that
    supports a wide range of use cases, and be at the same time not tedious to
    use. Which brings me to my next point. ]],
    H1 { id = "existing", "2. I don't like existing SSGs" },
    P {
        "Consider the Top 6 SSG listed from",
        A { href = "https://jamstack.org/generators/", "jamstack",
            UL {
                LI "Next.js",
                LI "Hugo",
                LI "Gatsby",
                LI "Jekyll",
                LI "Nuxt",
                LI "Docusaurus",
            },
        },
    },

    P [[ All the SSGs listed above has an active development and community of
    users. They probably has everything I need for an SSGs, and more. But for
    Next.js, it has too much. I don't need all that fancy SSR and client-side
    scripts. I want a simpler tool that converts typescript/jsx to an static
    HTML, and no more. I won't go with Hugo as well. I don't like it's
    templating syntax. A quite a petty reason, I know. Gatsby? I would nope
    out of any project that uses GraphQL. It's a bloated mass of complexity.
    As for Nuxt, it uses yet another crippled DSL that's prone to runtime
    errors as well. Docusaurus is packed with features, that again, I don't
    need. I want something simpler. ]],

    H1 { id = "deno", "3. I wanted to try out deno" },

    PP [[Why ]] / A { href = "https://deno.land/manual@v1.30.3/introduction", "deno" } / [[?
    Indeed, I could have just used node, and the end result wouldn't have made much
    difference. I'm not saying deno doesn't bring any improvements over the
    node/npm ecosystem, just that either node or deno would work either way
    for my specific case.

    But deno simplifies the setup and tooling. I just need to download the
    deno binary, setup deno for vscode, then done. Most importantly, deno
    supports typescript/jsx without much setup or dependency. ]] / HR / [[

    Okay, I think this is enough for now. This isn't seriously thought-out
    text, I just need some sample content while creating and testing my new
    personal website created with the SSG I made. ]]
}
