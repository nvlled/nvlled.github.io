local ext = require("ext")
local function CD(str)
    return P ^ PRE ^ CODE(ext.detab(str, "|"))
end

entry {
    date="2024-02-01";
    time="18:27";
    tags={"site"; "foo123"; "blah_1"};
    [[
    I was using lua to generate a new page using the redbean runtime,
    but I noticed the local time returned by
    os.time() was off by -16 hours.
    I thought this was just a quirk of lua library (lua does have a lot).
    But then, I tried it again with the official lua interpreter, and it returns 
    the correct time. This isn't documented anywhere, so I guess it's a redbean bug.
    
    More importantly, I felt like the year was also off by one, it's
    shows 2024, but it's only 2023 right?
    
    No, it's already 2024. The fuck...?
    ]];
}

entry {
    date="2024-02-01";
    time="19:06";
    tags={};
    [[
    Following up on my prior disbelief of flying time bananas, 
    I will now make a habit of making a log of what I'm doing.
    Right now, I'm still working on my personal site/blog.
    The logs I'm writing here will be automatically added in the site,
    which reduces the friction of writing some stupid shit.
    
    I'm also digging up my random notes and add it to my crappy site.
    
    I should also add a script to make it easier to add screenshots of
    what I'm doing.
    ]];
}

entry {
    date="2024-02-01";
    time="20:00";
    tags={"site"};
    [[
    Okay, now I added some bash script using the scrot tool to easily
    screenshot my current questionable decisions in life.
    I just now need to modify the log.page.html page to automatically
    embed the screenshots I did for each hour.
    
    Also, I didn't realize how much bigger PNG images are compared to JPEG.
    I know JPEG is a lossy format, but to think how much disk space it saves,
    the JPEG screenshot I just took is about 1/10 the size of the same PNG image.
    
    Anyway, that's enough coding for the day. My chest is starting to ache a bit
    from the coffee+adrenaline and sitting for too long.
    ]];
}

entry {
    date="2024-02-02";
    time="11:38";
    tags={};
    [[
    I spent about a 0.5 hour browsing HN and reddit while sipping some coffee
    and munching on some bananas. I briefly went over the "Who's hiring thread"
    and scanned for jobs that I might qualify. As usual, most posts are US/EU 
    constrained by time or location. I basically have abysmal chances of getting
    even an interview, so I'm not even going to bother applying this time.
    ]];
}

entry {
    date="2024-02-02";
    time="11:46";
    tags={"math"; "notes"};
    [[
    I'm currently reading "Elementary calculus: An infinitesimal approach".
    I've been slowly reading for about an hour each day. But just a random thought,
    I should make a simple youtube web frontend, so that I could listen to longer videos
    while I sleep. I want the videos to stop playing automatically after 30 minutes,
    so it doesn't waste my phone batteries when I'm already deep slumber to listen.
    ]];
}

entry {
    date="2024-02-02";
    time="12:08";
    tags={"nvim"};
    [[
    I got distracted and looked up how to insert ≈ and ≉ in vim.
    Vim has default digraph entry for ≈ (ctrl+k ?2), but not ≉.
    So I made a brief visit to the vim docs to figure out how to add
    digraphs. I did the following:
    
    ]];
    CD ":digraph /2 2249";
    [[
    
    But this doesn't work. The 2249 is the hex UTF-16 encoding for ≉.
    Vim actually wants a decimal number, so I convert hex to decimal:
    
    ]];
    CD ":digraph /2 8777";
    [[
    
    And it works. Actually, I'm using lua to configure nvim, so:
    
    ]];
    CD 'vim.cmd.digraph("/2", 8777)';
    [[
    
    ≉≉≉≉≉≉≉≉≉≉≉≉≉≉≉
    
    Math nerds and their silly symbols.
    And oh yeah, a ≈ b means a is infinitely close to b,
    or that a -b is an infinitesimal. Otherwise a ≉ b.
    ]];
}

entry {
    date="2024-02-02";
    time="16:17";
    tags={};
    [[
    I got up from  my computer around 13:00. So in three hours,
    I did the following in order: ]];

    OL {
        LI "walk around";
        LI "give husky a bath";
        LI "give myself a bath";
        LI "eat";
        LI "feed the doggies and cats";
        LI "clean";
    };

}

entry {
    date="2024-02-02";
    time="18:45";
    tags={};
    [[
    I took a nap after my last log, and I just
    finished watching two anime episodes while drinking
    coffee.
    ]];
}

entry {
    date="2024-02-02";
    time="19:38";
    tags={"nvim"};
    [[
    Uhh, I just spend almost an hour adding a vim abbreviation
    to insert the current date time. So I would type cdt in
    insert mode, and a date gets inserted.
    
    Not exactly what was I planning on doing this early evening of friday...
    
    It's not like I have better things to do though.
    ]];
}

entry {
    date="2024-02-02";
    time="20:26";
    tags={};
    [[
    I've now wrote some code to automatically embed
    the screenshots on my log page. Look at the disgustingly horrible code.
    Oh well, it works for now, I'll modify it a month later once
    it starts running too slow.
    
    Also listening to some ragnarok online BGM. I never got to play the game,
    but I still remember my highschool buddies talking about it back
    in the day. I kind of want to play the offline version of the game though.
    The art style sort of looks like trails in the sky.
    ]];
}

entry {
    date="2024-02-03";
    time="11:30";
    tags={};
    [[
    I got up from bed around 9:30, I cleaned up a lot 
    of dog poop, then cooked me some omelette.
    As usual, I browsed HN, reddit and youtube while
    sipping coffee.
    
    I also modified the screenshot script a little
    so I could take screenshot of the entire app window,
    in addition to being able to select a region of the screen.
    ]];
}

entry {
    date="2024-02-03";
    time="13:00";
    tags={};
    [[
    I played oath in felghana for about an hour or two.
    Not sure if I should even write these down,
    oh well, I'll see if it becomes a habit, or 
    I'll just quickly get tired  of writing inconsequential
    things down.
    ]];
}

entry {
    date="2024-02-03";
    time="16:37";
    tags={};
    [[
    I gave the six puppies a bath, which took me around two
    hours to do.
    ]];
}

entry {
    date="2024-02-04";
    time="19:54";
    tags={};
    [[
    Too lazy to write anything today. I did the minimum
    physical chores, I didn't give the other
    7 adult dogs a bath today, maybe tomorrow. At least,
    I least I took some screenshots of some of the things
    I'm watching or playing. It's not like I need to accurately
    keep track of the time for each things I did, just something
    I need to give me an idea what I did, or look back on.
    
    Sometimes I do forget to screenshot though or take note
    of what I'm doing. I wrote a tool
    before that periodically takes screenshot of my screen, 
    but that it became quickly a chore to sort through
    the dozens of screenshots.
    
    A better way is just to have a notification that
    asks me what I'm doing every hour or two.
    ]];
}

entry {
    date="2024-02-05";
    time="12:18";
    tags={};
    [[
    Okay, I finally understood now what differential calculus is.
    Or at least, I have a high-level intuitive understanding
    of what it means to differentiate a function. It's not
    actually a difficult concept, it's just a higher-order
    function that returns the slope of f at point x with
    an infinitesimal change ε, to 
    state it loosely and imprecisely.
    
    It's not like I could now compute the derivatives of any
    function I could find in the wild, but at least I know
    how it works or what it means, which was my original goal:
    not to become a mathematician, but to learn how to apply math
    with programming.
    ]];
}

entry {
    date="2024-02-05";
    time="19:23";
    tags={};
    [[
    There, I modified the code for the daily logs page so the 
    screenshots and log content are grouped by day,
    and by hour for each day. Well, it's a slow day, that's
    about the only programming I did for today.
    
    I should do a test deploy on github pages and see
    how it long it loads with a bunch of images in it.
    ]];
}

entry {
    date="2024-02-05";
    time="20:04";
    tags={};
    [[
    Neat, github actions is actually pretty handy. I used to
    commit the generated html files before, but with github actions,
    the site is automatically rebuilt when I push new commits,
    and I only need to commit the lua source files.
    
    Yeah, I like this setup. I like the moon-temple too, it's
    the best static site generator I've made so far. The whole
    dependency for building the site 
    is a single cross-platform 2MB executable file.
    
    I also like the DSL I've made with lua. It's really expressive,
    it's inpired by JSX, dare I say, even more so. I like writing code
    with it.
    ]];
}

entry {
    date="2024-02-06";
    time="19:41";
    tags={};
    [[
    What did I even do today...
    
    I played some YS this late morning, I still can't beat
    the dragon chicken boss though. I was supposed to continue reading
    that calculus book, but my mother was being (extra) disruptive
    today, basically telling me to get a job.
    
    This evening I watched some anime while on coffee break usual.
    Then, I worked on moon-temple to add autoreload when a file
    has changed. It doesn't look like redbean has built-in 
    filesystem monitoring, probably because there's no easy
    way of doing cross-platform filesystem monitoring.
    So I had to resort in creating my own in lua, using polling+stat.
    It looks very hacky, but surprisingly works just fine.
    
    Autoreload is not even an important, I just feel like doing it.
    ]];
}

entry {
    date="2024-02-07";
    time="11:52";
    tags={};
    [[
    As usual, I scrolled through HN with my mind on autopilot while
    sipping coffee. Also, I see bluesky is now open for public.
    In my own inaccurate description, bluesky is a social 
    network for the purpose of competing and luring existing
    dissatisfied twitter users.
    
    I don't really use twitter or any social network, but out
    of curiosity I signed up for bluesky anyway last night on my phone,
    in the middle of the night.
    
    This morning I scrolled over the "Video game" feeds on bluesky.
    And... I barely see anything remotely related to video games.
    For a second, I thought I mistakenly signed up for an esoteric
    dating site. Of course, the reason for that is because there's an influx of
    new users coming in, so most of posts are "re-introduction" posts that
    consists of the following name, pronouns, location, hobbies.
    
    I know when a I see a pronoun preference listed, there's bound 
    to be eggshells scattered everywhere[*]. I've heard of tales where
    blood filled the streets because a pronoun was mistaken (okay,
    I made that up). But I will refrain from making any direct remarks with 
    regards to how these people look.
    
    Still, I will note down some (probably wrong) cursory observation. 
    And that is, a lot of those
    who listed she/her as their pronoun will likely include "gay"
    in their hobbies/interest, and their strong muscular facial structure
    indicates a biological male gender. 
    In contrast, people who listed he/him actually look like a normal
    male person, and not who transcended. My question is, why is that?
    Or not, I'm too distracted to even make a objective observation.
    Trying to infer gender based on facial structure is exactly the kind
    of thing that would pour gasoline over the eggshells, so I don't know
    why I'm still writing.
    
    Anyways, I noticed some dude listed lemon as his pronoun,
    and a girl used fae/faer as the pronoun. That's cool, I didn't know
    you could use any word as a pronoun. Okay, I've decided then, if
    anyone asks for my pronouns, it would be: he/huh/potato/orc
    
    [*] https://www.collinsdictionary.com/dictionary/english/walk-on-eggshells
    ]];
}

entry {
    date="2024-02-07";
    time="16:23";
    tags={};
    [[
    Cleaned up my code yesterday. I tried using `loadfile` instead of `dofile`
    to run page script, so that I could avoid problems with messing up page state
    when there are concurrent page requests. I reverted my changes though
    since `require` behaves strangely when inside a loadfile env, the globals
    couldn't be resolved anymore. 
    
    Not a problem I guess. Oh wait, I do think this is definitely not a problem
    because redbean forks a new subprocess for each page request, so each
    page request state is isolated.
    ]];
}

entry {
    date="2024-02-07";
    time="19:55";
    tags={};
    [[
    I started creating an outline for some guides/tutorial that
    I'm planning to write. My motativation for this is that writing
    might help me get a foot in the technical writing. If that fails,
    I could also try selling the guide on gumroad or something.
    Worst case scenario is that no one gives a fuck about it,
    but that doesn't sound too bad since I learned something myself.
    ]];
}

entry {
    date="2024-02-07";
    time="20:06";
    tags={};
    [[
    I'm going drive my humor a little more.
    Previously I said my pronouns would: he/huh/potato/orc,
    but that's barely sufficient if I'm aiming to optimal
    political prowess. Asking my pronouns should be akin to navigating
    a deeply intricate labrynith of recursive state machines, each
    pronoun infinitely contingent on a random, ambiguous state.
    This way, no mortal sentient being could possibly get
    my pronouns right, ever, under any circumstances.
    Asking for my pronouns is a guaranteed zero-sum, losing game:
    the only winning move is not to play (or kicking me in the nuts works too).
    
    ... The "joke" isn't as funny as I thought it would be.
    ]];
}

entry {
    date="2024-02-08";
    time="12:46";
    tags={"math"};
    [[
    I continued reading the calculus book. I got stuck
    while following an example problem where
    sqrt(∆x)/∆x =  1/sqrt(∆x)
    and ∆x is a positive infinitesimal.
    
    I can only get sqrt(∆x)/∆x =  ∆x⁻²/∆x = 1/∆x∆x² = 1/∆x³
    There's no way x³ = x⁻²
    
    Oh well, maybe just a typographic error, or I'm just dumb.
    Not important anyway. Moving on.
    ]];
}

entry {
    date="2024-02-08";
    time="16:45";
    tags={};
    [[
    Worked on the neovim guide, I didn't get to do much,
    mostly read the neovim docs. I'm not even sure how
    I should organize the document, or if this is even
    worth spending my time on.
    ]];
}

entry {
    date="2024-02-08";
    time="20:17";
    tags={};
    [[
    Still reading the neovim docs, I'm looking for
    function that I can use. I'm thinking of creating
    a side-by-side table showing comparing lua and vimscript.
    But then again, I really don't know much vimscript.
    I guess I could just copy the code snippet from the docs.
    ]];
}

entry {
    date="2024-02-09";
    time="13:02";
    tags={};
    [[
    I've been trying to run a file watcher using neovim lua scripts
    using like nvim -l script.lua, but nothing is working so far,
    even the official examples. I'm guessing libuv doesn't work
    well with -l.
    
    Or not, I should ask reddit or other neovim support channels.
    ]];
}

entry {
    date="2024-02-09";
    time="16:47";
    tags={"math"};
    [[
    Nah, fuck this shit, I'm undoing all the changes I made
    today to moon-temple, I just added a bunch of pasta spaghetti monstrosity
    just to save me save keystrokes when reloading my changes.
    
    On an unrelated note, I think I want to create a mini-simple
    computer algebra system, like an interactive math equation builder.
    That way, I'll have more fun manipulating equation with a keyboard.
    It'll be simple, just a symbolic modifier.
    
    Something like this:
    
    ]];
    CD [[
    | repl:
    | > expr = createExpression()
    | > expr // (nothing)
    | > expr.add(sym.x) // x
    | > expr.add(sym.x) // x + x
    | > expr.mul(sym.y) // (x + x)y
    | > expr.distribute() // xy + xy
    | > expr.factor(sym.x) // x(y + y)
    | > expr[1].combine() // x2y
    | > expr.swap(1,2) // 2yx
    ]];
}

entry {
    date="2024-02-09";
    time="18:55";
    tags={"math"};
    [[
    I checked out sympy, a computer algebra system in python.
    sqrt(x)/x does indeed simplify to 1/sqrt(x).
    ... It took me too long to realize that
    sqrt(x) is not x^-2, but actually x^0.5
    ]];
}

entry {
    date="2024-02-11";
    time="11:50";
    tags={"ys"};
    [[
    I finally defeated the dragon chicken boss
    on Ys. It was quite the rush, I barely 
    have any health left, but I managed
    to defeat the chicken. Has that boss
    part always been that hard?
    ]];
}

entry {
    date="2024-02-11";
    time="19:07";
    tags={};
    [[
    Didn't really do much on this weekend,
    which how it should be. Relax, and don't
    think about anything, so that when Monday
    comes in, my mind will be fresh anew.
    
    The week is almost over, but what did I 
    even do this week? Luckily, with notes
    and screenshots, I should have a fairly
    good idea of what I did. Let's see...
    Watch anime, watch vtubers, programming,
    study, and ad infinitum. Basically
    routine stuffs I do everyday on
    my computer.
    
    As to the specifics, I mostly worked
    on improving moon-temple and adding
    stuffs on my personal site. And oh yeah,
    bluesky. It hasn't become a habit to
    regularly scroll bluesky like I do
    with HN and reddit. Which is understandable,
    as I also find it hard to get into 
    twitter-type of content.
    
    I do kind of what to use bluesky more,
    since it's one way of becoming more social.
    I should get out of my comfort zone and
    make it a habit of interacting with people online,
    and not just lurking. Maybe, that's one step
    towards getting rid of my social anxiety.
    
    ...
    
    I should remind myself that I'm uploading
    this text onto a public site. I don't think
    I should be writing down my personal problems here.
    But if I filter that much thought, what is there left to write?
    Not that anyone would even bother reading this shit.
    Although there's always the problem of potential employers
    sniffing through my possibly inciminating writings.
    Then again, I'm just being myself, and if being myself
    is grounds for disqualification, then so be it.
    ]];
}

entry {
    date="2024-02-11";
    time="20:05";
    tags={};
    [[
    So I spent about 30 minutes scrolling through
    bluesky, mostly on discover and video game feeds.
    Among the hot takes and content shilling, I didn't 
    really see anything of interest, except for some 
    nice drawings I saw. I want to see less of people
    giving hot takes or promoting their own content,
    and more people just talking about what they did or create,
    boring or uninteresting as it may be.
    
    It all comes down to curating my own feed and following
    the right people. I'm following one person who sort
    of talks about boring mundane things, and that
    person is a voice actor learning software engineering.
    What a weird combination of interest, I don't see
    that much often. I'll lurk and see what sort of things
    he create.
    ]];
}

entry {
    date="2024-02-12";
    time="16:08";
    tags={};
    [[
    Didn't do much this morning, aside from cleaning
    and walking around. I also spent some time answering
    a questionnaire for a job assessment. I got an email
    back this weekend from a job application that I sent
    months ago, either I completely forgot about or just gave up on it.
    I'm not expecting much, I don't have strong feelings
    one way or the other, rejected or not, life carries on
    as usual.
    ]];
}

entry {
    date="2024-02-12";
    time="19:55";
    tags={"site"};
    [[
    I started implementing pagination for the logs page,
    this is too avoid loading too many images in one page.
    The ideal, alternative solution would be to generate
    thumbnails for my screenshots, but for now I want
    moon-temple to be fully cross-platform without any dependencies,
    and for that, I can't rely on external image libraries
    to resize images. It's possible to write a pure lua
    implementation of png resizing, but that's not going to
    be an easy task.
    ]];
}

entry {
    date="2024-02-13";
    time="12:44";
    tags={"site"};
    [[
    Finished the pagination. In my previous site generator,
    I used query parameters for the page numbers, but this
    time I used a custom file parameters, such as:
    
    /page[page=1,param=2,xyz=foo].html
    
    This way, the local links will be the same on dev server,
    and on the html build files. I also discovered that I 
    can lazy load images by doing `<img loading="lazy" ... />.`
    This should at least reduce page load time and bandwidth usage.
    It's a nice work-around for not being able to generate thumbnails
    for the mean time.
    ]];
}

entry {
    date="2024-02-13";
    time="16:01";
    tags={"site"};
    [[
    Modified the build action so that local links with filename parameters
    will be included in the build files. I also updated converted the
    .gif files to mp4, which reduced the overall size from ~100MB to 20MB.
    Even though I only worked for about an hour or two, I feel like
    I got a lot of things done. Useless stuffs to be sure, but at least
    I felt productive. Also, the owl has just finished singing.
    ]];
}

entry {
    date="2024-02-14";
    time="10:46";
    tags={"math"};
    [[
    Now, I'm trying to follow an example of how 
    to get the derivative of 1/x. Once again, whenever I see
    I fractions, I frequently scratch my head how did the book
    go from this to that. I should probably learn the basics
    how to combine fractions together, but I am  weirdly
    fixed on notational purity, so I want to see could I 
    solve this just in terms of exponents.
    
    First, consider the equation:
    ]];
    CD [[
    |   1/(x+y) - 1/x
    | = 1/(x+y) + -1/x
    | = (x+y)^-1 + x^-1
    ]];
    [[
    
    Now, I'm stuck. How do I simplify this? Can I distribute ^-1 inside (x+y)?
    
    ]];
    CD [[
    | (x+y)^-1 =? (x+y)1^-1
    ]];
    [[
    
    Are these two equal? Nope. I do know that
    
    ]];
    CD [[
    | x^n = (x^a)(x^b) where n = a+b
    ]];
    [[
    
    So (x+y)^n = ([x+y]^a)([x+y]^b)
    
    Nope, it's even more complicated now, I've further strayed
    away from the light, the opposite of simplifying.
    
    Oh well, I think I'll read the book of abstract algebra first.
    ]];
}

entry {
    date="2024-02-14";
    time="11:52";
    tags={"math"};
    [[
    Aha, I found what I'm looking for:
    
    ]];
    CD [[
    | (ab)^-1 = (a^-1)(b^-1) 
    ]];
    [[
    
    Or not, this only applies to a group with one operation. 
    Actually, an algebraic system with two operations is
    called a ring, not a group. I'll skip ahead to chapter
    17 of the book and see if I can find the relevant
    theorem I'm looking for. It's funny how I'm just
    like skimming an API documentation and looking
    for something I can use to bring my abomination into
    fruition.
    ]];
}

entry {
    date="2024-02-15";
    time="11:23";
    tags={"math"};
    [[
    I skimmed over the book of abstract algebra last night,
    I didn't find anything I could use.
    
    Played around more with equations, on paper, vim,
    and with python/sympy.
    
    What I just realized is that, 1/(x+y) - 1/x
    can no longer be simplified. The book actually does simplification
    with (1/(x+y) - 1/x)/y
    
    Second realization is that sympy does not automatically simplify
    when comparing equality between expressions. I seriously started
    questioning and doubting myself when it returns false 
    with (a*b)*x == a*x + b*x.
    
    I actually need to do simplify((a*b)*x) == simplify(a*x + b*x)
    
    That said, the furthest simplification I got was
    ]];
    CD [[
    |   (1/(x+y) - 1/x)/y
    | = (x+y)^-1*(y^-1) + (-x^-1)*(y^-1)
    ]];
    [[
    
    ^-1 looks really messy though, for I'll use ~ as an abbreviation for ^-1
    ]];
    CD [[
    |   (1/(x+y) - 1/x)/y
    | = (x+y)~y~ + -x~y~
    ]];
    [[
    
    I also found out that a~b~ = (ab)~, this is actually I learned
    from abstract algebra as well, but it's something I won't see
    when looking up exponential laws.
    
    ]];
    CD [[
    |   (1/(x+y) - 1/x)/y
    | = (x+y)~y~ + -x~y~
    | = [(x+y)y]~ + (-xy)~
    ]];
    [[
    
    Alas, that's hardly a simplification. It's still quite far away from
    the simplification shown by the calculus book and sympy:
    
    ]];
    CD [[
    |  (1/(x+y) - 1/x)/y
    | = -1/(x*(x + y))
    ]];
    [[
    
    Just I was about to resign to my fate as a retard who can't
    even do basic algebra by using only exponential laws, I realized
    that sympy does the following (de)simplification:
    
    ]];
    CD [[
    |   x~ + y~
    | = (x + y)/(x*y)
    | = (x + y)(x*y)~
    ]];
    [[
    
    Interesting, it's not immediately clear how I would do that using
    theorems from groups, rings, fields and whatnot. Then again,
    it's probably using a basic fraction rule that I'm too dumb to see.
    Well, at least I have a lead for the next morning session.
    
    Ultimately, my goal is to show (to myself) that I can do algebraic
    manipulations without using fractions. It's a hill I'm willing
    to die on, probably. Or at least, lose a leg.
    ]];
}

entry {
    date="2024-02-15";
    time="20:09";
    tags={"site"};
    [[
    Added some markdown library, so my logs would look
    well formatted. The markdown library is actually 
    using the older spec, so triple ``` isn't event supported.
    It's good enough for now, but ideally, I should just
    avoid markdown and just put longer notes on a separate
    lua page.
    
    I also gave myself a haircut today. By haircut, I mean
    I trimmed excess hair so the hair would stop poking my
    eyes, and I could save some soap and shampoo.
    Cutting my own hair saved me about $2, and importantly
    saves me the anxiety of having to go outside.
    Needless to say, my hair looks like shit, before
    and after.
    
    But as the saying goes, even stinkiest
    fart eventually goes away. I'm sure
    in the whole history of mankind someone said that,
    surely. I just remembered a certain shark
    saying "fart in the wind", which is
    identical in meaning.
    ]];
}

entry {
    date="2024-02-16";
    time="11:04";
    tags={"math"};
    CD [[
    |   x~ + y~
    | = (x + y)/(x*y)
    ]];
    [[
    
    Okay, I understand now, it really is just a
    simple fraction rule. Three things
    of note:
    
    ]];
    CD [[
    |   x   numerator
    | -----
    |   y   denominator
    ]];
    [[
    
    - two fractions can be added together if they have the same denominator
    - for any a, a/a = 1
    - for any a, a*1 = a
    
    To solve `1/x + 1/y`, I just need to make them have the same denominator:
    ]];
    CD [[
    |   1/x + 1/y
    | = (1/x)(y/y) + (1/y)(x/x)
    | = y/xy + x/xy
    | = (x+y)/xy
    ]];
    [[
    
    -----
    
    Now I just need to translate this to exponential notation:
    ]];
    CD [[
    |   x~ + y~
    | = x~yy~ + y~xx~
    | = (yy~ + y~x)x~
    | = (x+y)x~y~
    ]];
    [[
    
    There, I solved it without needing special rules like 
    "same-denominator fractions can be added" or
    "dividing x/y by z is the same as x/yz".
    
    ----
    
    Back to the previous problem, I need to simplify `(1/(x+y) - 1/x)/y`:
    
    Simplify the numerator first
    ]];
    CD [[
    |   1/(x+y) - 1/x               
    | = (x+y)~ + -x~                // (A)
    | = (x+y)~xx~ + -x~(x+y)(x+y)~
    | = (x+y)~xx~ + -x~(x+y)(x+y)~  // common: x~,(x+y)~
    | = [ xx~ + -x~(x+y) ](x+y)~
    | = [ x + -(x+y) ](x+y)~x~
    | = [ x + -x -y) ](x+y)~x~
    | = -y(x+y)~x~                 //  (B)
    
    |   (1/(x+y) - 1/x)/y
    | = [ (x+y)~ + -x~ ]y~       // (A) times y~
    | = [ -y(x+y)~x~   ]y~       // replaced (A) with (B)
    | = -(x+y)~x~                // yy~ are inverses, so yy~ = 1
    | = -1/(x+y)*x
    ]];
    [[
    
    Aha, now I got the same equation as shown in the book.
    
    ----
    
    I'm still not sure if avoiding fractional notation is better,
    but at least so far I've managed to avoid relying on special
    rules to do algebraic simplifications. I still don't know
    how the book was able to get `-1/(x+y)*x`, it just seems
    "magic" for me. Well actually, looking closer, the book did
    use the same trick by making both terms use the same denominator.
    It only just skipped lots of steps in between.
    ]];
}

entry {
    date="2024-02-16";
    time="14:20";
    tags={"math"};
    [[
    I'm wondering now, why do I need to add the two fractions
    together before I could simplify it. Isn't there another way?
    That does sounds like a math trick that I must do
    without knowing why.
    That's what I tried before, but I couldn't get any further:
    
    ]];
    CD [[
    |   [1/(x+y) - 1/x]/y               
    | = [(x+y)~ - x~]y~
    | = (x+y)~y~ - x~y~
    | = [(x+y)y]~ - x~y~
    | = [xy+yy]~ - x~y~     // how do I go from this...
    | ...
    | = -(x+y)~x~           // to this                 
    ]];
    [[
    
    Maybe, there's a theorem that I could use for this?
    
    ]];
    CD [[
    |   x~ + y~ = (x+y)x~y~
    |   x~ + y~ = [(x+y)~x]~y~
    |   x~ + y~ = [(x+y)~x]~y~      // TODO:
    
    | xy~ = (x~y)~          // ooh, this is actually true
    | x~y = (xy~)~          // woah, this  holds as well
    | xy = (x~y~)~          // this too!?!? 
    | xyz = (x~y~z~)~       // cool, it generalizes to arbitrary number of terms
    |                       // actually ~ behaves a like  de morgan's law
    ]];
    [[
    
    Ahaaha, did I just discover/invent new theorems for my own operator?
    This is actually pretty neat stuffs. My mind feels a bit blown.
    I didn't think math would be this fun. Yeah, with this new theorem,
    I think I could actually do solve the equation without relying 
    on the math trick.
    ]];
}

entry {
    date="2024-02-18";
    time="19:20";
    tags={};
    [[
    Around 18:30, there's was a traffic incident just across
    the street from my house. A tricycle and a motorcyle
    crashed into each other. Me and my mother curiously
    watched from the front gate. It appears no one
    was seriously injured. There was an ambulance,
    but I didn't see any stretchers, or
    anyone gravely injured that
    needed immediate medical attention.
    It was for the most part, a nothingburger,
    for anyone not directly involved in the incident.
    Maybe. It's hard to see anything from where I stood.
    
    In my whole life, I strangely don't think I've ever seen
    a serious traffic accident in person, and I say
    this as someone who used to walk home alongside the
    highways a lot back in the old days. Or maybe there was,
    and I just can't remember.
    ]];
}

entry {
    date="2024-02-19";
    time="11:29";
    tags={};
    [[
    I just finished breakfast, which is quite late for a reason.
    Around hour ago, my husky dog went through a hole in the wall,
    and was set free in the swampy wilderness. I didn't realize though
    until I saw two people in the swap yelling to me about our dog attacking
    their ducklings. I said, that can't be, all of our dogs are in the
    house. Then I went around and noticed I don't see the big ole furry
    dog anywhere. Oh fuck, I thought.
    
    I didn't really have any choice though, but to go out and search for
    my dog. I screencaped a google map and annotated it to make it easier
    to explain.
    
    - In the image, the husky dog went through a hole on (B)
    I really don't want to wade through the swamp if possible,
    so I went through the front gate first (F)
    - I walked around neighbourhood street first (1) and (2)
    and didn't see any husky dog
    - I checked out the aggrived duckling owners, went through
    their lot (3) and walked through the swampy terrain.
    I didn't see or hear anything.
    - At this point, I went back inside and put some
    long pants and boots, because the swamp likely consists
    of various nasty household gooey waste,
    not to mention the possible snakes.
    - It's hard to see anything because of the really, realy
    tall grasses, so went to the discontinued road for a better
    view of the surroundings (4)
    - Walking through the abandoned road wasn't any easier,
    but at least it was dry. It had a lot of sharp
    tall grasses (wild sugarcane I think they are called),
    so I only tried walking on the edges. (5)
    - My mother was on a tricycle yelling, searching for me
    and the dog (C)
    - While I was on the way to (6), I heard a splash in the swamp,
    followed by chickens flying. From point (C) looking at point (A),
    I finally found the the husky dog
    - I slowly trudged back to point (A), hoping the husky dog
    didn't run off to somewhere. Thankfully, the husky was still there standing,
    waiting for chickens to munch on. I put him on a leash, and made
    our way back to the dry lands. (7)
    - I saw a dead orange tabby cat (A), which suspiciously looked
    like our cat, but I'm not sure. I didn't check further though,
    because the husky might actually try eating it.
    
    And there, it was quite a terrible morning to start a day with, but
    I'm just glad I found the husky safe. Worse case scenario,
    my dog went further out, in the neighbouring streets, never
    to be found again. I admit, I did kind of enjoy walking in the swamps,
    just the like old days.
    ]];
}

entry {
    date="2024-02-19";
    time="12:36";
    tags={"math"};
    [[
    Continuing from last friday, I found about multiplicative
    inverses conforming to de morgan's law:
    
    ]];
    CD [[
    | xy~ = (x~y)~ 
    | x~y = (xy~)~ 
    | xy = (x~y~)~ 
    
    |   [1/(x+y) - 1/x]/y               
    | = [(x+y)~ - x~]y~
    | = (x+y)~y~ - x~y~
    | = [(x+y)y]~ - x~y~
    | = [xy+yy]~ - x~y~     // how do I go from this...
    | = ...
    | = -(x+y)~x~           // to this                 
    ]];
    [[
    
    Nope, de morgan's law isn't enough. I need something like
    ]];
    CD [[
    | (x+y)~ = ~x + ~y
    ]];
    [[
    
    
    What about this?
    ]];
    CD [[
    |   (x+y)~ + -x~
    | = -y(x+y)~x~ 
    | = -(x+y)~x~y
    
    
    |   (x+y)~ + x~
    | = (x+y)~yx~ 
    
    -------------------------
    
    | = (x+y)~ + -x~
    | = (x+y)~xx~ + -x~(x+y)(x+y)~
    | = (x+y)~xx~ + -x~(x+y)(x+y)~
    | = [ xx~ + -x~(x+y) ](x+y)~
    | = [ x + -(x+y) ](x+y)~x~
    | = [ x + -x -y) ](x+y)~x~
    | = -y(x+y)~x~               
    
    |   x + y
    | = xyy~ + yxx~
    | = xy(y~ + x~)
    
    |   x~ + y~
    | = x~yy~ + y~xx~
    | = x~(yy~ + y~x)
    | = x~y~(y + x)
    
    |   x~ + y
    | = x~yy~ + yxx~
    | = yx~(y~ + x)
    
    |   x + y~
    | = xyy~ + y~xx~
    | = y~x(y + x)
    
    
    |   x~ + 0~
    | = x~0~(0 + x)
    ]];
    [[
    0h, 0~ is undefined...
    ]];
    CD [[
    |   (x+y)~
    | = xy(x~ + y~)~
    | = [x~y~(x~ + y~)]~
    | = [(x~x~y~ + x~y~y~)]~
    | = [(x~2y~ + x~y~2)]~
    | = [(x~2 + x~2)y~]~
    | = (x~2 + x~2)~y
    | = (2x~2)~y
    ]];
    [[

    So close, but this is false
    
    Let me try again:
    ]];
    CD [[
    |   (x+y)
    | = xy(x~ + y~)
    
    |   (x+y)~
    | = x~y~(x~ + y~)~
    
    |   (x+y)~
    | = x~y~(x~ + y~)~
    
    |   (x+y)~
    | = [ xy(x~ + y~) ]~
    | = [ xyx~ + xyy~ ]~
    
    |   (x+y)~
    | = [xy(x~ + y~)]~
    | = xy(x~ + y~)]
    
    
    |   1/(x+y) - 1/x               
    | = (x+y)~ + -x~                // (A)
    | = (x+y)~xx~ + -x~(x+y)(x+y)~
    | = (x+y)~xx~ + -x~(x+y)(x+y)~  // common: x~,(x+y)~
    | = [ xx~ + -x~(x+y) ](x+y)~
    | = [ x + -(x+y) ](x+y)~x~
    | = [ x + -x -y) ](x+y)~x~
    | = -y(x+y)~x~                 
    | = -(x+y)~x~y                 //  (B)
    ]];
    [[
    
    --------------
    
    Welp, this sucks, I feel like I'm going in circles.
    I should write and separate the equations that are shown to be true first.
    ]];
}

entry {
    date="2024-02-19";
    time="18:43";
    tags={"math"};
    CD [[
    | = [(x+y)~ + -x~]y~
    | = [(x+y)~-x~(x+y + -x)]y~
    | = (x+y)~-x~yy~
    | = -(x+y)~x~ 
    ]];
    [[
    
    Okay, I'm done here for now,  I don't think
    I could find anything further. On one hand,
    I now learned about the theorem  x + y = xy(x~ + y~),
    which is what I used to solve the equation above.
    But then, that theorem actually uses the notion
    of combining two fractions together, which I was
    trying to avoid. Oh well.
    
    Here's the list of theorems that I may find useful
    in my tedious journey of purely using exponential notations:
    
    ]];
    CD [[
    | xy       = (x~y~)~
    | x + y    = x(1 + x~y) = y(1 + xy~)
    | x + y    = xy(x~ + y~)
    | (x + y)~ = x~y~(x~ + y~)~ 
    | a(x+y)~  = [a~x+a~y]~
    ]];
    [[
    
    The last one very much looks like a function application rule
    that I've seen before.
    
    I will set aside that thought, and I will continue forth.
    Uhh, why am I writing like this? I have a bloody headache right now,
    mostly because of I ran out of coffee, and caffeine withdrawal
    gives me a really bad headache.
    ]];
}

entry {
    date="2024-02-20";
    time="10:51";
    tags={"math"};
    CD [[
    | (x + y)~ = x~y~(x~ + y~)~ 
    | x + y    = xy(x~ + y~)
    | x00~
    
    | (x^2)~  = x~2
    | x~^2    = x~2
    
    | x^(y~)
    | sqrt(x) = x^0.5 = x^2~
    | cbrt(x) = x^0.333.. = x^3~
    
    | (x^a)x~ = (x^a)(x^-1) =  x^(a-1)
    
    | (x^a)^b    = x^(ab)
    | (x^a)(x^b) = x^(a+b)
    
    | x^(n^-1)
    | x^(n^m) =? (x^n)^m
    | x^(2^3) =? (x^2)^3
    | x^8 =? (xx)^3
    | x^8 =? xx xx xx
    ]];
    [[
    
    Hmm, the operator ^ is also non-commutative,
    and non-associative, that's just as crippled
    as division.
    
    Oh well, for today's morning, I've thought
    about why 0~ is undefined. Wikipedia gives
    me a lot of answers, but for some reason
    it still doesn't sit right with me.
    I should continue on with the calculus book,
    anyway, until I find another equation
    that seems difficult to solve with exponential notation.
    
    I'll probably want to explore logarithms as well later.
    ]];
}

entry {
    date="2024-02-21";
    time="10:53";
    tags={"math"};
    [[
    I continued reading "calculus: an infinitesimal approach".
    I'm still following so far, but I don't quite get 
    the increment theorem. For starters, why would ∆y be
    infinitesimal? If the book is referring to ∆y in the equation
    
    ]];
    CD [[
    | ∆y = f(x+∆x) - f(x)
    ]];
    [[
    
    then I don't see how ∆y would be necessarily be infinitesimal.
    I could think of really weird curves where ∆y wouldn't be infinitesimal
    based on that equation.
    
    Of course, it's actually referring to a different(?) ∆y, the book
    is saying the ∆y in the equation
    
    ]];
    CD [[
    | ∆y = f'(x)∆x + ε∆x
    ]];
    [[
    
    is an infinitesimal. Or not. There's actually a proper definition
    and explanation in the following pages.
    
    What I've learned just now:
    ]];

    UL {
        LI [[tagential line
    defined as l(x) - b = f'(a)(x - a)
    which is a line that intersects the point(a,b) with slope f'(a)
    ]];

        LI [[change in y along the curve        = f(x + ∆x) - f(x)
    change in y along the tangent line = f'(a)∆x]];

        LI [[differential of y and differential of x]];
        LI [[the change in y along the tangent line is called the differential of y,
    and is notated as dy, as opposed to ∆y, which is the changed in y along the curve]];
        LI [[dx and ∆x is the same, but dx is also used for notation consistency it seems]];

    };
    [[
    
    
    Okay, I understood that much. But I don't still see yet where 
    incremental theorem comes in. Oh well, I'll come to this later
    and let it process in the back of my mind.
    ]];
}

entry {
    date="2024-02-21";
    time="12:24";
    tags={};
    [[
    There, I finished my shitty youtube UI. Basically, it's just
    a youtube player but with a countdown timer.
    The purpose of this is so I could listen to longer youtube
    videos without draining my phone battery.
    
    I always listen to youtube before going to sleep, it 
    really helps me fall asleep faster, it keeps me from
    thinking a bunch of things that keep me awake.
    ]];
}

entry {
    date="2024-02-21";
    time="15:37";
    tags={};
    [[
    This early afternoon, I gave the six younger puppies, 
    and the 2 adult puppies, a bath. Not much else to say
    about it, except that it's quite tiring to do,
    so I really should avoid doing it all at once.
    ]];
}

entry {
    date="2024-02-21";
    time="15:46";
    tags={"site"};
    [[
    Right now, I'm wondering if I should do some maintenance
    work on moon temple. Tasks like refactoring, cleaning up,
    add do some proper releases, that kind of stuffs.
    
    Or I could start a new project.
    I want to try html.lua with a golang backend,
    and webui as the frontend. Then try htmz for
    general frontend/backend interaction.
    
    Or not, I should invest more time creating stuffs
    with godot and blender.
    ]];
}

entry {
    date="2024-02-21";
    time="20:01";
    tags={"sn"};
    [[
    So I decided to try making a web application
    with go and the lua template. After all, that
    was the original reason why I made moon-temple:
    so I could have an alternative templating engine
    text/template that comes with golang.
    
    I've done some playing around with gopher-lua, and I managed
    to run html.lua. There's one problem though: I want
    the binaries self-contained as usual, so I needed to 
    use embed.FS. Naturally, gopher-lua doesn't know
    how to load files from my embedded filesystem,
    and skimming through the docs, it appears there's no
    built-in support for doing that.
    
    The first workaround I tried is to just extract the embedded
    files into the current directory if they are newer or doesn't exist.
    But strangely, running Stat() on the embedded files always return a 0 timestamp.
    
    The second workaround I'm considering is writing a custom package.loader
    for lua. I found an ]];
    A {
        href="https://mark1626.github.io/posts/2021/04/21/lua-module-loader/";
        "example";
    };
    [[

    that I could use. Crazy enough, that example shows how I could 
    even extend lua's syntax!? Imagine I could even go further with
    my DSL madness AHAHA. Or not, the editor LSP would start cussing
    at me if I did that. Pretty neat stuffs though.
    ]];
}

entry {
    date="2024-02-22";
    time="10:53";
    tags={"math"};
    [[
    lol, I didn't realize my computer crashed,
    all input was unresponsive, but 
    it was still playing the same tune 3
    second tune in a loop. Oddly enough, it
    still quite catchy, so I didn't notice
    until I tried moving my mouse.
    
    Anyway, I was on my notebook wondering
    what the geometric interpretation of negative
    exponents. n^m makes sense, it just multiplication.
    But what about n^-m, it's not apparent at first,
    but it's just equal division. What about n^(m^-1)?
    n^0.5 is square root, but what does that mean?
    Isn't that division as well? Maybe unequal division?
    
    As it turns out, I don't really understand the
    basic, fundamentals of math. But why stop at multiplication
    and division. Maybe there's a weird arithmetic operator
    that has useful properties. Base-2 has `xor`, `nand` and
    other operators.
    
    What if xor and others was generalized to arbitrary base?
    So instead of bit-wise pairing, on decimal,
    it would be digit pairing. What properties woud those
    operator have?
    
    Can I define some weird operators too?
    Programmers after all do that all the time,
    well, haskell programmers do at least.
    
    I will set aside these thoughts for now,
    I have a calculus book to read.
    ]];
}

entry {
    date="2024-02-22";
    time="11:37";
    tags={"math"};
    [[
    Oh, I see I what's going on here:
    
    ]];
    CD [[
    | l(x) - b = f'(a)(x - a)
    | l(x)     = f'(a)(x - a) + b
    ]];
    [[
    
    Is the book defining a function here?
    Or is it establishing an equation?
    This is actually quite confusing.
    In terms of programming, it would be like
    there's no separate syntax for defining
    functions from defining variables.
    You can't do that, is what I'm thinking,
    but math nerds are free to do what they want.
    But for my own clarity, I'll need to
    establish some conventions and a more rigid
    syntax when doing math.
    
    What I want: ]];

    UL {
        LI "scoping of variable for each functions";
        LI "dependent variables should be clear whose variable it's depending on";
        LI [[still have the freedom of doing algebraic
    manipulations (or equational reasoning? as the FP guys say)]];
    };
}

entry {
    date="2024-02-22";
    time="13:11";
    tags={"sn"};
    [[
    Worked on getting the lua environment to work with gopher-lua.
    The custom loader solution works fine, now I just to 
    figure out a way to structure the web application.
    For demostration purposes, I'll just create a simple
    HN clone.
    ]];
}

entry {
    date="2024-02-22";
    time="16:09";
    tags={"sn"};
    [[
    I was wondering why I keep getting a nil pointer dereference,
    as it turns out, I'm closing L.close() before I could
    even use L. Now my problem is why the __tostring metamethod
    isn't being called from the go code. I'm currently looking
    for code examples how to do that, or just examples how to 
    better use the gopher-lua API.
    ]];
}

entry {
    date="2024-02-22";
    time="20:08";
    tags={"sn"};
    [[
    There fixed the __tostring problem by using L.CallByParam.
    I also had to create my own version of dofile since
    the one provided by gopher-lua doesn't allow
    setting the chunk name, and seeing chunk name
    is important when debugging. 
    
    I considered using htmz, but since hacker news
    doesn't have a lot of UI interactivity, it's not
    needed for this toy project.
    ]];
}

entry {
    date="2024-02-23";
    time="11:00";
    tags={"math"};
    [[
    I wiped my most of my rocketbook pages,
    so I could have more space for weird symbols to scribble on.
    ]];
}

entry {
    date="2024-02-23";
    time="11:46";
    tags={"math"};
    [[
    Okay, I think I am infinitely close to understanding
    what the heck increment theorem is supposed to mean.
    ]];

    UL {
        LI "I have a shitty curve f(x)";
        LI "derivative of f(x) is f'(x), which just maps x to a slope";
        LI "I can use the slope f'(x) to create a straight ass linear curve l(x)";
    };
    BR;

    [[
    Then at point [x, f(x)] and another point [x+∆x, f(x+∆x)]
    The change in y (f(x+∆x) - f(x)) along the f(x) is called "increment of y"?,  notated as ∆y
    The change in y (l(x+∆x) - l(x)) along the l(x) is called "differential of y, notated as dy
    
    The increment theorem says that the distance between ∆y and dy is εΔx,
    not that it helps why that matters.
    
    Then somewhere in the book says that
    
    ]];
    CD [[
    ∆y/∆x ≈ f'(x) (squiggly equal lines) and
    dy/dx = f'(x)
    ]];
    [[
    
    and my confusion ensues even more.
    I literally established from first principles that ∆y/∆x = f'(x),
    and now it's telling me, oh no, ∆y/∆x is infinitely close to f'(x).
    The fuck.
    
    Well technically, any number x ≈ x since x-x = 0 + ε, so it could be 
    that both ∆y/∆x ≈ f'(x) and ∆y/∆x = f'(x) is true.
    
    Oh well, I may need to consult an alternative resource for a different explanation.
    At least for the increment theorem. I understood well what derivative and differential means.
    I should probably reviews the definitions for infinitesimal as well.
    ]];
}

entry {
    date="2024-02-23";
    time="19:56";
    tags={"site"};
    [[
    Worked on the website using the lua templating.
    On my filesystem, I tentatively named the project
    folder as goom-temple, which actually sounds
    inappropriate since goom jokingly refers something specific
    for a certain shark fanbase, but it doesn't matter,
    it's just a temporary name. For brevity, I'll refer
    to this project as SN (slacker news) for now.
    
    As expected, I haven't done much for today,
    most of which are scaffolding stuffs for the overall
    project structure. I also properly configured my
    neovim lsp this time, both for lua and go.
    ]];
}

entry {
    date="2024-02-26";
    time="11:17";
    tags={"math"};
    [[
    Aha, I think I understand now.
    ∆y/∆x ≈ f'(x) does actually makes sense.
    I had an imprecise definition of derivative in my head.
    More precisely, the derivative f'(x) is
    
    ]];
    CD [[
    | f'(x) = st(∆y/∆x)
    ]];
    [[
    
    where the function st removes all the infinitesimal.
    ∆y/∆x is infinitely close to f'(x),
    which is to say their difference is infinitesimal,
    because:
    
    ]];
    CD [[
    |   f'(x) - (∆y/∆x)
    | = st(∆y/∆x) - ∆y/∆x
    | = ε
    ]];
    [[
    
    With that, the proof of increment theorem would be:
    
    ]];
    CD [[
    | ∆y/∆x ≈ f'(x)
    | ∆y/∆x - f'(x) = ε     // by definition of infinitesimal
    | ∆y/∆x = f'(x) + ε      
    | ∆y    = f'(x)∆x + ε∆x     
    ]];
    [[
    
    I was previously wondering why ∆y would be an infinitesimal
    based on the increment theorem, but now it's clear
    that f'(x) is a real number, and based on the rules for
    infinitesimal arithmetic, f'(x)∆x + ε∆x  would be indeed
    an infinitesimal.
    
    I did consider and downloaded other books about infinitesimal calculus,
    but I didn't find any mention of the increment theorem. It would
    probably be better if I skim through at least one of them, to 
    further solidify my understanding. In the end the wikipedia
    page was enough to clear up my understanding. Or maybe, a weekend
    break, consisting of turning my brain off.
    
    I'll spend more time getting used to the notation shown on page 56,
    and I'll need to have a very intuitive understanding of increment theorem,
    because it seems important to gloss over.
    ]];
}

entry {
    date="2024-02-26";
    time="19:59";
    tags={"sn"};
    [[
    I decided to use the official HN api while 
    creating the frontend first. That way,
    it's easier to create a compatible backend
    later on.
    ]];
}

entry {
    date="2024-02-27";
    time="11:10";
    tags={"math"};
    [[
    I reviewed the notations for derivatives and differentials.
    I understand it now, but somehow I don't feel all too comfortable
    with it, maybe it's the concept or the notation. Perhaps
    I could think of an alternative notation for expressing
    differentials and derivatives, preferrably something close
    to a programming language syntax.
    
    Next time I'll be reading the rules for differentiating rational terms.
    These rules are what are usually taught in schools to be rote memorized
    I think.
    ]];
}

entry {
    date="2024-02-27";
    time="13:42";
    tags={"sn"};
    [[
    Wrote some code to handle concurrent http requests.
    It's never easy to write multi-threaded code,
    as I'm never sure if there's no deadlock lurking
    somewhere, or some unexpected race condition will happen.
    For now, it's working as expected, and it "looks" correct.
    ]];
}

entry {
    date="2024-02-27";
    time="16:19";
    tags={"sn"};
    [[
    I more or less now have a working basic HN frontend.
    I think I'll make the UI linear like lainchan/4chan,
    instead of the usual tree view like reddit and HN.
    Neovim's lspconfig with gopls is giving me some error though,
    pretty annoying, not even sure how to fix this.
    ]];
}

entry {
    date="2024-02-27";
    time="20:02";
    tags={"sn"};
    [[
    So I noticed that the posts have non-deterministing
    sorting. I thought, fuck concurrency, I'll just
    do it without any goroutines, it'll be one
    http request at a time.
    
    I tried rewriting it, and the code certainly looked
    simpler. But, it's so, slow. The heck, I thought
    it would only be a little bit slower, but no,
    it's about ten times slower on some HN threads.
    
    I undid the rewrite, and just used a map to sort
    posts by insert order.
    
    Seeing my changes also takes a couple of seconds,
    so I added some caching to filesystem too, to
    prevent execessive requests while testing.
    ]];
}

entry {
    date="2024-02-27";
    time="22:31";
    tags={"site"};
    [[
    https://news.ycombinator.com/item?id=39511714
    I should add some /now on my shitty personal site as well.
    Not sure about /ideas though, I sure don't have shortage
    of them, but they are mostly dumb or uninteresting.
    
    I've been wondering too if I should submit my site 
    to aboutideasnow.com, kagi or marginalia. I
    don't really have any interesting content though.
    Maybe some time in the future.
    ]];
}

entry {
    date="2024-02-28";
    time="12:14";
    tags={"math"};
    [[
    Did some "studying" on my rocketbook with
    calculus notations. I tried writing it in a lua
    notation so it would be clear what scope  each variable is,
    and are the dependent variables.
    
    One thing I did realize is that Δx is not locally scoped
    inside the derivative, and that ε isn't really an independent
    variable as the book suggests.
    
    So once I again, I will try to start from scratch, and 
    write all the functions and equations:
    
    ]];
    CD [[
    let ∆x be any infinitesimal
    let dx = ∆x
    let f: func(x: *R)
    
    let derivative = f => x => st{ [f(x + ∆x) - f(x)]∆x~ }
    let differential = f => x => derivative(f)(x) * dx
    
    let x be any infinitesimal
    let y = f(x)
    let slope = derivative(f)(x)
    let dy = differential(f)(x)
    ]];
    [[
    
    The book sometimes defines derivatives in terms of differentials,
    and differentials in terms of derivatives. I think it depends
    on which unknown variables are, or which side makes the computation easier.
    I don't know, I understand it in principle, but I'm not sure
    how to apply it in practice yet.
    
    I found an HN post linking to a page of cool stuffs that applies
    math with programming. In particular, there's ]]; 
    A {"Differential equations and calculus from scratch", href="https://matthias-research.github.io/pages/tenMinutePhysics/19-ODE.pdf"}; [[
    which is highly relevant to what I'm doing.
    ]];
}

entry {
    date="2024-02-28";
    time="16:48";
    tags={"sn"};
    [[
    Still mostly worked on making the UI look like *chan forum.
    I found a bug where some tags wouldn't close and end up like
    `<i>100%!&(MISSING)lt;/i>`. It doesn't happen with direct curl to HN API,
    so the problem is most likely my escaping function,
    or the json parser.
    ]];
}

entry {
    date="2024-02-28";
    time="19:15";
    tags={"sn"};
    [[
    Urgh, I can't believe I spent almost an hour
    finding out what's causing the ]];
    CODE "<i>100%!&(MISSING)lt;/i>"; [[ bug.
    I though encoding/json was escaping %, but no.
    I thought gopher-lua was doing some weird string escaping, no again.
    I thought gopher-luar was doing some weird string escaping, nope.
    
    Then I thought of printing the text right before writing the response back.
    Curl was showing the broken text, but the printed text shows the text properly.
    
    Aha, by process of elimination, the source of bug was the code writing the response back:
    
    ]]; CD "fmt.Fprintf(w, ret.String())"; [[
    
    Well of course, fmt uses % to format string, no shit.
    I feel so retarded now in hindsight.
    
    I tried googling for %!&(MISSING) but it shows me an FBI 
    kidnappings and missing person list, lots of kids too. Uh-oh.
    Damn, look at all the unresolved cases, some dating back
    all the way to 2010.
    
    I'm reminded that the world is a scary place, you'll never
    know what sick fuck is lurking around the corner.
    ]];
}

entry {
    date="2024-02-29";
    time="10:59";
    tags={"math"};
    [[
    I'm still reading the book "calculus: an infinitesimal approach".
    I'm on page 60, and briefly went over the rules for deriving
    rational functions. Nothing surprising so far, I can
    still follow along without problem. I should probably
    frequently go back to these pages and commit these rules into memory.
    
    My eye twitched a bit on the quotient rule though.
    Isn't division just multiplication with inverses (a/b = ab^-1)?
    So there shouldn't be a special rule for this, it's
    covered by the power rule, right?
    
    I'll check just to be sure.
    ]];
}

entry {
    date="2024-02-29";
    time="11:28";
    tags={"math"};
    [[
    Well, it's supposed to be covered by power rule 
    and the product rule, but I'll check tomorrow.
    Anyways, I found stuffs on HN that could also fun
    to learn: geometric algebra.
    
    This tutorial seems to be readable for me
    https://mattferraro.dev/posts/geometric-algebra
    only highschool algebra is required.
    
    I'm getting too distracted again though,
    the last thing I want to surfacely jump from
    one subject to another without actually
    ever learning anything. I wonder at
    what point I will stop reading the calculus
    book I'm reading right now. It's actually
    almost a thousand pages long. I could
    probably stop right until integral calculus,
    then maybe come to it later in the future.
    ]];
}

entry {
    date="2024-02-29";
    time="13:25";
    tags={"sn"};
    [[
    I unproductively tried to imitate the post popup on hover
    feature on 4chan. The popup works fine, except
    the positioning is quite tricky to get it right.
    ]];
}

entry {
    date="2024-02-29";
    time="16:38";
    tags={"sn"};
    [[
    Aha, I managed to almost copy the exact popup behaviour
    of 4chan. Well, almost, then I saw literal some edge case
    that needs fixing. Oh well, but for the most part,
    it's looking pretty good. I might actually
    use this custom HN frontend from now on.
    ]];
}

entry {
    date="2024-02-29";
    time="20:15";
    tags={"sn"};
    [[
    Argh, it's really quite difficult for me
    when it comes to mobile responsiveness.
    Things like making sure the text size is right,
    and all the words and spaces wrap properly.
    I should properly learn how to do this 
    the right way.
    
    For now, it works enough for me on the desktop.
    Not on the phone though, it's barely useable
    with a tiny screen.
    ]];
}

entry {
    date="2024-03-01";
    time="11:50";
    tags={"math"};
    [[
    So the book did actually and directly used
    product and power rule for the quotient rule.
    The approach I did was to start with y = uv~
    and get the derivative. But then I wondered,
    what variable is ∆u and ∆v dependent on?
    The book used the following notation:
    
    | y = uv
    | y + ∆y = (u + ∆u)(v + ∆v)
    
    If I let u = w~, how would that affect ∆u?
    Will it be ∆u~?
    
    Once again, I see and hated the implicit
    handwavy notations that mathematicians use.
    I tried explicity converting dependent variables
    to functions, but then I didn't do any better,
    it's actually more verbose:
    
    ]];
    CD [[
    | let Y(x) = U(x)V(x)
    | let ∆Y(x, ∆x) = U(x + ∆x)V(x + ∆x) - U(x)V(x)
    |               = [U(x) + U(∆x)][V(x) + V(∆x)] - U(x)V(x)
    |               = (u + ∆u)(v + ∆v) - uv
    |           where
    |             u = U(x)
    |             v = V(x)
    |            ∆u = U(∆x)
    |            ∆v = V(∆x)
    ]];
    [[
    
    It's way more verbose, but then, it's actually more clear.
    To answer my own question, the equation would then be:
    ]];
    CD [[
    | let Y(x)  = U(x)V(x)~
    | let ∆Y(x) = (u + ∆u)(v~ + ∆v~) - uv~
    ]];
    [[
    I'll come back to this later, not even sure if that's correct.
    Right now, I don't know if I should
    just get used to the traditional math notations and conventions,
    or just create my own, or something in between.
    I've heard of aphorisms like 
    "You don't learn math, you just get used to it".
    Maybe that's why math write formulas like this.
    ]];
}

entry {
    date="2024-03-01";
    time="13:16";
    tags={};
    [[
    Worked on SN, I fixed several bugs.
    I also found out that using a field mapped
    by gopher-luar as a table key causes several
    seconds of lag. I'm not really why is that,
    but it's a massive wtf. The fix is to
    cast the ID first to string before using
    it as an index.
    
    Also another blocker is the mouseover
    event. It seems that just moving my
    mouse inside an element causes the
    mouseout to emit repeatedly.
    
    Aha, nevermind, fixed it. The bug seems
    to happen when I nest small elem inside a link:
    | <a><small>...</small></a>
    Removing the small fixes the bug.
    Once again, not sure why would that be a bug
    in the first place.
    
    Oh well, this is one buggy friday.
    ]];
}

entry {
    date="2024-03-01";
    time="16:09";
    tags={"sn"};
    [[
    There, fixed bugs, and looking good.
    I want to finish on working on the mobile
    view so I could test it in the phone
    before the week ends.
    ]];
}

entry {
    date="2024-03-01";
    time="20:06";
    tags={"sn"};
    [[
    The hecking fuck, nothing's working.
    What arcane combination of symbols
    must I arrange to make media queries work on my phone.
    Sometime it works, but not actually.
    The documentation and articles made it sound
    easy, but the sample codes doesn't even work.
    Then again, maybe it's just my phone's
    outdated browser.
    
    I give up, doing calculus suddenly seemed
    way more easier when trying to make mobile
    responsive frontend.
    ]];
}

entry {
    date="2024-03-04";
    time="11:54";
    tags={"math"};
    [[
    Played around with the notebook,
    I could more or less get apply the division
    rule with power rule and product rule.
    Or really, I only ever need sum rule and product rule.
    But I can see why there are separate rules for each,
    since it's not always trivial or obvious, even a bit tedious, to
    get the directive directly from just the sum and product rule.
    
    But, I'm still not comfortable with the syntax.
    When it says differential of a dependent variable,
    it's talking about differential of a function, right?
    Then, it goes around adding functions together, which
    is essentially a type error. Likely, it's implied and
    goes without saying that it's the result of the function
    that's being added together, not the function themselves.
    
    Nope, my entire being rejects this convention. Where's
    the fully typed math syntax, I want it.
    ]];
}

entry {
    date="2024-03-04";
    time="20:26";
    tags={"sn"};
    [[
    Well, some way or the other, I managed to make
    the SN mobile friendly-ish, it's now useable at least. 
    The auto-adjusting font-size is pretty maddening though
    when on mobile.
    The rem unit is supposed to make the font-size relative
    to the root font-size, so why is some texts are still changing
    and appears smaller than the rest?
    
    As it turns out, there's an exception and I have to explicitly
    set `text-size-adjust: none` to disable this behaviour.
    Some say this isn't a CSS best practice, but screw that.
    
    This early afternoon, I also made some changes in the backend,
    fixed and simplified some problematic code that's causing
    race conditions. I also added an option to cache loaded lua modules,
    to speed things a little.
    ]];
}

entry {
    date="2024-03-05";
    time="12:03";
    tags={"math"};
    [[
    To fill my gaps in my intuition and understanding,
    I started reading another book called "Full frontal calculus"
    by Seth Braver. It's surprisingly amusing to read, 
    particularly the writing style of the author, where he
    uses religiuous analogies to describe the divide
    between limit-based calculus and infinitesimal calculus.
    It's certainly a refreshing way of explaining as opposed
    to the a bit overly dry prose from the other calculus book
    I was reading. I don't suppose to say that this is better
    pedagogically speaking, but it's certainly more entertaining.
    ]];
}

entry {
    date="2024-03-05";
    time="20:01";
    tags={"sn"};
    [[
    I did plenty of stuffs today with SN,
    I added showing the comment chain (post context)
    and top frequent participants in a thread.
    I also added some cache clearing every 30 minutes,
    that way, I will only be forced to revisit
    a thread after half an  hour, instead of
    compulsively checking and rechecking
    a thread every other minute.
    
    The messiest code is the UI lua/html code,
    which isn't really unexpected. On the positive side,
    it's quite easy to modify or add new changes.
    And it still performs relatively well, less or around 100ms per 100 comments.
    Sure, text/template might be way, way faster, but it's not as flexible,
    or even quite painful to use.
    
    The external http request are still by far the slowest though,
    the filesystem caching is required.
    ]];
}

entry {
    date="2024-03-06";
    time="11:29";
    tags={"math"};
    [[
    Played around with my rocketbook again.
    I tried answering my own question, how
    do I express multiplication and division with
    addition and subtraction.
    
    Multiplication of two numbers x and y is just
    ]];
    CD [[
    | xy = x + x + x ... + x
    ^ y times
    ]];
    [[
    or 
    
    ]];
    CD [[
    | xy = y + y + y ... + y
    ^ x times
    ]];
    [[
    
    But is there a more compact way of expressing 
    multiplication in terms of addition?
    As it happens, I previously found out that
    
    ]];
    CD [[
    | x + y = xy(x~ + y~)
    ]];
    [[
    
    or
    
    ]];
    CD [[
    | xy = (x + y)(x~ + y~)~
    | xy = (x + y) / (x~ + y~)
    ]];
    [[
    
    That's close and interesting.
    Multiplcation is the sum divided by the sum of inverses.
    But that's cheating since division is still multiplication.
    Is there another way?
    
    The sum of inverses sure do come up a lot,
    maybe there is another way of expressing it?
    What about
    
    ]];
    CD [[
    | 1 = 2~ + 2~
    ]];
    [[
    
    Does this generalize?
    
    ]];
    CD [[
    | 1 = 3~ + 3~ + 3~
    | 1 = 4~ + 4~ + 4~ + 4~
    | 1 = 5~ + 5~ + 5~ + 5~ + 5~
    ]];
    [[
    
    Hmm...
    ]];
    CD [[
    | x + y = xy(x~ + y~)
    | xy(x~ + y~) = x + y
    | x~ + y~ = (x + y)x~y~
    
    | 2~ + 2~ = (2 + 2)(2*2)~
    | 2~ + 2~ = 4(4)~
    
    ]];
    CD [[
    |   3~ + 3~ + 3~ 
    | = (3+3)(3~)(3~) + 3~
    | = (3+3)[(3)(3)]~ + 3~
    | = [(3+3)~(3)(3)]~ + 3~
    | = (_ + 3)[(_)*3]~
    | = ([(3+3)~(3)(3)] + 3)[[(3+3)~(3)(3)]*3]~
    ]];
    [[
    
    Bleh, what I am even doing, this is horrible
    
    What about expressing division in terms of addition or subtraction?
    
    ]];
    CD [[
    |   12 / 4
    | = 12 + -3 + -3 + -3
    | = 12 + -(3 + 3 + 3 + 3) + 3
    | = 12 + 3*4 - 3
    ]];
    [[
    
    This doesn't make sense though, I'm supposed
    to find what's 3, not use it here.
    
    ]];
    CD [[
    | 12(4~) = 3
    | 12(4~) = 3
    ]];
    [[
    
    Oh well, I'll come back to this later.
    ]];
}

entry {
    date="2024-03-06";
    time="12:35";
    tags={"math"};
    [[
    Read a bit of Full Frontal Calculus (FFC),
    I mostly read and didn't do the exercises.
    I would have probably been already lost by page 15,
    but good thing I already have a good intuition
    of what this all means, so it's easier to follow.
    Basically, a recap.
    ]];
}

entry {
    date="2024-03-06";
    time="19:34";
    tags={"sn"};
    [[
    Worked on SN, fixed some filesystem errors 
    when creating a release build. There's definitely
    a bunch of added complexity by having a self-contained
    binary with the assets embedded, not sure if this is worth it.
    For now, I managed to make it work, I fixed the errors
    by replacing direct calls to os.Stat with my own fsStat(fs, filename).
    
    I'm more or less almost done with the project, it's quite usable
    with its current state. I will be using this to read HN from
    now on.
    
    My original goal was to create an HN clone to test my lua
    templating library. But creating an HN frontend works as well.
    I'm convinced using lua as an alternative templating engine
    works quite well, I might actually use it for more
    web projects in the future.
    
    I'm still considering whether I should still try creating
    a full HN clone. It's not actually easy running a forum.
    For one, I don't have the (financial) resources to maintain it.
    Second, no one will use it but me.
    Third, it might get defaced or hacked quite easily.
    Despite all that, I feel like just doing it anyway.
    Try reduce server load, I could aggresively just cache
    everything, and just update the site for one or two
    times a day. Or not.
    
    For now, I think I'll continue watching that video titled
    "Godot 4 - Tiled Dungeon Environment From Scratch".
    ]];
}

entry {
    date="2024-03-06";
    time="19:55";
    tags={"sn"};
    [[
    Looking at my logs, it has been 14 days now since
    I started ]];
    A {href='/notes/index[date=2024-02-21].html#nt-52'; "working on SN"};
    [[ Err, the lua markdown library I'm using can't handle anchor # inside a link.
    Oh well.
    
    Look back further, it has been more than a month now since
    I started logging my daily activites. I think I'll review
    it this weekend to get an idea what I need to change or
    improve on. I wasn't actually consistent with logging
    what I did for a day. What was logged was mostly
    my time on the computer, and not much else
    outside that. Well, there's not much else to say
    when it comes to my daily routine. I live in a tiny hikikomori NEET world.
    ]];
}

entry {
    date="2024-03-07";
    time="12:01";
    tags={"math"};
    [[
    Continued reading FFC, or tried to read.
    On page 20, I see some very inadequate explanation 
    for finding the derivative for x², at least
    compared to Keisler's explanation. It's probably
    more simpler, but now I have more question than
    answers if this was my first calculus book.
    
    Well, to be fair, I'm not even reading intently
    that much, but at this point, I'm just looking
    for something to complain about. I'd be better
    off reviewing the earlier chapters of Keisler's
    book again.
    ]];
}

entry {
    date="2024-03-07";
    time="15:21";
    tags={};
    [[
    I left an opened pack of pocky sticks in my desk
    and when I came back just now my desk was filled
    with tiny itchy-bitey ants. I poured vineger and
    wiped them away, but they still managed to bite
    my hands, now it's all itchy. Well, nothing remarkable.
    ]];
}

entry {
    date="2024-03-07";
    time="16:16";
    tags={"sn"};
    [[
    Aha, I managed to deploy slacker news on fly.io
    surprisingly without much problem, now I can
    use it on my phone too. I have unused 500 fly.io credits
    that I got as a bonus for applying for a job at fly.io.
    Unfortunately, I got rejected, but at least I got
    free credits in return.
    
    I wonder how long those $500 credit will last with
    my shitty app though. More importantly, I hope
    it doesn't get ddos'ed and put me in a massive debt?
    I recently read something like that, I can't remember
    the HN thread specifically.
    ]];
}

entry {
    date="2024-03-07";
    time="20:12";
    tags={"sn"};
    [[
    I did some changes so that the lua code
    is compiled and preloaded. Supposedly
    this should reduce memory usage.
    And I think the average request time
    went down too, sort of.
    ]];
}

entry {
    date="2024-03-08";
    time="12:04";
    tags={"math"};
    [[
    Well, for some reason, now I'm trying to come
    up with my own division algorithm using only
    addition and multiplication. Partially,
    because I actually forgot how to do division
    by hand on paper, but also because of my
    curiosity to discover things for myself 
    from first principles. Nothing new with what
    I'm doing, I'm sure someone already thought
    of these things around a thousand years ago.
    ]];
}

entry {
    date="2024-03-11";
    time="19:22";
    tags={};
    [[
    So today is 11th of March, which means march
    is practically half-way over, and if I let
    myself carelessly blink a few more times, 
    it'd be April before I knew it. Time sure
    is bananas when it comes to flying so fast.
    I feel like listening again to the song "Heaven"
    from the game Persona.
    
    What have I been even doing this this March?
    I said I was going to review my logs this
    weekend, but I didn't feel like it, too
    lazy. Most notable I did for the weekend
    was trying to defeat the final-final boss
    on Ys, I always die at the last 1000 HP
    of the boss.
    I regret going for the hard difficulty,
    now I can't move on to the other games,
    and it's a bit stressful trying to push through.
    I feel I didn't even get to relax this weekend.
    
    As for today, I didn't do much,
    I've been scribbling away on my notebook
    like a madman, fixated on finding a way
    to do long division using my own method
    of multiplicative inverses. I wasn't 
    toiling on my own volition, I was actually
    enjoying doing bad arithmetic, I'd make
    the simplest mistakes that would make a 
    gradeschool teacher laugh. Maybe there's
    some dopamine hit when I rediscover some
    trivial mathematical properties on my own.
    I think to myself, huh so that's why, I
    can't believe I went through my adult life
    without knowing this basic fact.
    
    School taught me surface level knowledge how to 
    do arithmetic by mechanically applying algorithms.
    Or maybe they did teach the underlying insights,
    just that I wasn't paying attention. I was
    actually a very distracted student, 
    the world around me would just blur
    during classroom hours, my mind would wander
    to a distant fantasy land. To my surprise,
    I still managed to pass with an average grade
    on my highschool days. College is different though.
    
    Anyways, back on topic, what I was trying to do
    was to be able to do "long division" using just
    multiplicative inverses. So the idea would be:
    ]];
    CD [[
    |   12345 / 45
    | = (12345)45~
    | = (12345)9~5~
    ]];
    [[
    
    And from that, division is just a matter of "cancelling"
    out digits with their respective inverses. For instance, if
    I see a 4 and a 4~, then those two cancel out to be 1:
    ]];
    CD [[
    |   (4)(12)(3)(6)4~5~
    | = (4)(4~)(12)(3)(6)(5~)   reorder
    | = (1)(12)(3)(6)(5~)       substitute, 4*4~ = 1
    | = (12)(3)(6)(5~)          remove 1, since 1*x = x
    ]];
    [[
    
    Naively, I thought it was just that simple.
    Initially, I did
    ]];
    CD [[
    | = (12345)45~
    | = (123(4)(5)45~
    | = (123(4)(5)4~5~
    | = (123(4)(5)9~5~
    | = (123(4)9~
    ]];
    [[
    But that is very wrong, I can't just make the 5 disappear
    like that since 12345 is actually
    | 12345 = 10000 + 2000 + 300 + 40 + 5
    |       = 1*10^4 + 2*10^3 + 3*10^2 + 4*10^1 + 5*10^0
    In that form, I have to excruciatingly distribute 9~5~
    over each term, which is admittedly too tedious and
    error prone to be doing by hand.
    
    There has to be a better way. Applying division with inverses would
    be very easy if I could just have the form (x1)(x2)(x2)...
    As it turns out, that's called factoring, so my 
    task shifted to searching how to do factoring by hand.
    But to do factoring, I have to do division, so what then?
    I found myself asking a question similar to wondering if a chicken
    or egg came first. There is another way, which is by
    trial and error, guessing if a number evenly divides another number.
    
    Well, this log has gotten a bit too long, I'll
    continue this later. Time for a walk before supper.
    ]];
}

entry {
    date="2024-03-12";
    time="10:59";
    tags={"math"};
    [[
    To continue from yesterday, to find a way to do factoring
    and division, I have to ask, what does division mean anyway?
    What does evenly divisible mean? What's remainder?
    With some faint recollection of some wikipedia article,
    after some scribbling, I manage to come up with: 
    ]];

    CD "x = ab + c";
    [[
    
    This equation says that a number can be expressed as
    a product of two numbers a and b, plus another number c.
    Meaning, if a number can be perfectly described as
    as a product of two numbers, then c can be zero.
    So, c here is the remainder.
    
    Moving stuffs around: ]];

    CD [[
    | x      = ab + c   (1)
    | x - ab = c        (2)
    | xa~    = b + ca~  (3)
    ]];
    [[
    
    With (2), I could let c = 0 and find two numbers
    a and b that satisfies the equation. Not sure
    what to make of (3). If a is a factor of x,
    then c = 0, so
    ]];
    CD " xa~ = b";
    [[
    
    For example, I want to divide 65 by 2:
    ]];
    CD "65 = 2*x + c";
    [[
    
    What x could be here? Let me try some values:
    ]];
    CD [[
    Let x = 31
    | 65 = 2*31 + c
    | 65 = 62 + c
    | 65 - 62 = c
    | c = 3
    
    ]];
    [[

    So with x = 31, get a remainder of 3.
    
    What about if I let Let x = 32
    ]];
    CD [[
    | 65 = 2*32 + c
    | 65 = 64 + c
    | c = 1
    ]];
    [[
    
    With x = 33,  c = -1
    
    What does this all mean for me?
    What does a negative remainder mean, and why don't I
    see it in the wild? Setting that aside for now,
    from here it's clear that 65 cannot be evenly be divided
    by 2 (where c = 0). But if I want to divide by 2 anyway,
    I get 32 with a remainder of 1.
    
    Checking it in python:
    ]];
    CD [[
    | >>> 65/2
    | 32.5
    ]];
    [[
    
    Huh? Where's that 0.5 came from? Isn't the remainder 1?
    Of course, I would get 32.5 too if I did the division method
    taught in gradeschool, but why?
    Previously,
    ]];
    CD [[
    | xa~    = b + ca~  (3)
    ]];
    [[
    
    Plugging in the values:
    ]];
    CD [[
    | 65*2~ = 32 + 1*2~
    |       = 32 + 0.5
    |       = 32.5
    ]];
    [[
    Oh okay, that makes sense. Alternatively,
    ]];
    CD [[
    | 32.5 = 32 + 5*10~
    |      = 32 + 1*2~
    ]];
    [[
    
    And from that, I feel like I have a slightly deeper
    understanding of what division and decimal notation
    means. Sure, I could have saved myself the trouble
    of feeling retarded for not knowing these very
    basic things by looking it up, but it's a different
    rewarding experience to learn these things on my own.
    
    Then again, I still don't have a methodical approach
    of doing long division besides doing trial and error.
    On the other hand, I could now do fizzbuzz without
    using the modulo operator. Well, actually I already
    did that before using a weird alien ]];
    A {
        href="https://github.com/nvlled/awa-assembler/blob/main/fizzbuzz.awtsm";
        "assembly language";
    };
    [[, but still.]];

}

entry {
    date="2024-03-12";
    time="12:24";
    tags={"math"};
    [[
    And my quest to devise my own manual long division continues.
    I tried dividing and factoring several numbers numbers
    in my notebook, some small and some large-ish.
    Several observations:
    ]];

    UL {
        LI [[if I can't get rid of the ~, then it's (likely) not evenly divisible]];
        LI [[I can express larger numbers as a sum of exponential 10s
       such as: 123 = 1*10^2 + 2*10^1 + 3*10^0]];
        LI [[I should avoid distributing ~ over the sum, since it becomes
       even harder to solve]];
        LI [[Sometimes I have to add terms together to make them factorable]];
        LI {
            [[I can further factor these base exponentials to help see some factors:]];
            CD [[
            | 735 = 7*10^2 + 3*10^1 + 5
            | = 7*5*2*5*2 + 3*5*2 + 5
            | = 5(7*2*5*2 + 3*2 + 1)
            ]];
            [[ So here, I could see at a glance that 735 is evenly divisible by 5, without doing full division or factoring.]];
        };
        LI [[Going further, I could try converting base10 to another baseN
       to help see the factors at a glance (in theory, I haven't tried)]];
    };
    BR;

    [[
    
    With that, my division method would then be first to
    factor out the divisor and the dividend (prime factorization it's called it seems), 
    then cancel out any inverses. To some extent, it works.
    I managed to do division even for larger numbers like 12345.
    
    Sadly, this doesn't necessarily mean that if I don't see
    any obvious factors then it's a prime number. Naively
    I thought that was the case, I quickly ran into counterexamples,
    most damning of which is the quadruply nice number 469, 
    which is a product of two prime numbers 7 and 67!?!
    My supposed method broke down, all is lost, god is dead and/or mad,
    what am I even doing with my life again.
    
    Just kidding (maybe). I'm just missing some important detail. 
    ]];
    CD [[
    |   469
    | = (2^4)(5^2) + (2^2)(3)(5) + 3(3)
    ]];
    [[

    Here, there are no obvious factors in sight.
    In some cases, that actually does mean it's a prime number,
    but in this particular case, it's not, since it's factors are 7(67)
    ]];
    CD [[
    |   469
    | = 6(7)
    ]];
    [[
    
    Hmm, so my task is now to figure out how to go from 
    6(67) to (2^4)(5^2) + (2^2)(3)(5) + 3(3), or vise versa.
    If I could do that, then maybe I could observe some properties
    that could be generalized as a solution to finding the factors.
    
    Then a thought occured to me: what are real numbers?
    Do they even exist? Aren't they just an artifact of decimal notation?
    Of course, some math teacher would bonk me in the head,
    and point to irrational numbers. But no, what if I want
    to reject the concept of real numbers, out of uncalled spite,
    and that irrational numbers can be perfectly expressed as 
    a ratio of two numbers, with some slight tweak in the notation
    and the base axioms. Maybe these dumb irrationals belong
    on a separate number line.
    
    Okay, if I'm asking these crazy questions, it's time to 
    take a break. I'll probably answer and disprove my 
    own questions sooner or later as I go along.
    ]];
}

entry {
    date="2024-03-12";
    time="20:06";
    tags={"sn"};
    [[
    Worked on SN, I fixed the datetime so 
    that it server-renders the date with UTC format,
    then converts that to localtime on the client side.
    I also added some textbox to easily view HN URLs.
    
    I also looked at the fly logs why my cached json 
    arent' working, it seems that they get deleted
    before the scheduled time. The logs says it periodically
    shutdowns the machine when the server is inactive.
    The fix is to use actual fly.io volumes for persistent
    storage.
    ]];
}

entry {
    date="2024-03-21";
    time="19:00";
    tags={};
    [[
    Looking at my logs, I realized I haven't
    written much for almost ten days now.
    It has been mostly just screenshots, although
    looking at the screenshots is pretty
    amusing too. Sometimes I think, hey
    this anime screenshot actually looks kind of cool.
    I should probably add some proper attribution though.
    Alternatively, I'll try noting down when I finished
    watching a whole season for the anime I watched,
    maybe throw in some my thoughts whether I like it or meh.
    But if I finished watching the whole season, it's most
    likely I liked watching it. 
    
    Man, I think my keyboard accumulated too much dust and fur
    again, some key presses sometimes doesn't work.
    
    Anyways, last sunday I watched the movie
    Fantasic Mr. Fox. I rarely watch movie
    nowadays, but recently I read the
    short book with the same title 
    where the movie was based on. The book
    was short enough to finish in one or two
    sittings, and I read it before going to bed.
    It's not a profound book or anything that gives
    me new insight or teaches a new knowledge or skill.
    Still, it was a fun read, it gave me a sense of
    nostalgic adventure. I used to dig a lot of holes
    too when I was a kid. The biggest and deepest
    hole I dug even allowed me to burrow my whole body
    and peek my head out like a rabbit.
    ]];

    IMG {src="/screenshots/img-1710702748.jpg"};

    [[
    I'm slightly disappointed that the movie
    changed a lot of things from the book, it's
    almost a different story, save for the same set
    of characters. But no big deal, 
    it's still a fun watch too.
    ]];
}

entry {
    date="2024-03-21";
    time="19:30";
    tags={"math"};
    [[
    I was going to write what I have been
    doing for the past 10 days but my 
    mind got lost on fox digging holes.
    I mentioned Mr. Fox and digging holes
    because I thought it was an apt metaphor
    to what I've been doing.
    
    Basically, I've scribbling a lot on my
    notebook, and it's pretty much what
    has been on my mind, even on my deep slumber.
    Unlike Mr. Fox, I wasn't running away from danger.
    I was just digging out of curiosity.
    Sure, they were infinitely better and meaningful
    things to do, but my mind was fixated on 
    digging this hole. For my own detriment,
    it was almost the only thing I wanted to do
    for current time being. 
    
    My Digging was stupid and useless, and a complete
    waste of time. The only thing I would get out of this digging
    is to sink my life further. I was under
    no illusion that my digging would result
    into anything I would write home about
    (which is funny, because I'm always home).
    There's no glory here, it's all dirt, mud and worms.
    
    Past the initial curiosity, digging turns into
    obsession, then suffering and borderline insanity.
    One night awoke in cold sweat three times 
    to the same nightmare, believing I was almost 
    there but there was nothing but a dead end.
    
    In my mind, I was intoxicated with mad curiousity,
    thinking digging this part would reveal
    something, or would lead to something
    mankind has never ventured before.
    It was a dead end, but then I thought,
    what about this way, or that way.
    I could have consulted a pre-made
    map (by studying number theory),
    but no, I liked the feeling of
    ignorance and naivety, thinking
    there is more to what the eyes can see.
    
    And this is where I am now.
    Thankfully, my manic episodes has
    died down a bit, and now I'm ready
    to go back and do some other projects.
    I'd say, I can't believe I've just wasted
    almost ten days digging for no purpose, but then
    it's completely plausible and in-character
    for me to do such a thing.
    
    Of course, before I bury and cover up the hole,
    I should at least charter a map for
    the dungeons I've made. Which is to say,
    I should at least write down my
    own "self-discoveries", however trivial
    or unnew they are.
    ]];
}

entry {
    date="2024-03-22";
    time="15:11";
    tags={"math"};
    [[
    Despite what non-binding nonsense I said yesterday,
    I'm still stuck on my notebook, slowly chipping away
    more dirt and mud. Maybe the fun hasn't worn off yet,
    or maybe I'm just too lazy to do anything else.
    Mucking around seems quite easy in comparison.
    
    In any case, I should write down something.
    Not sure where to start, I should list down
    the seemingly useful formulas and equations that I 
    found or made:
    
    Firstly, I can decrement/increment any factors with any number
    ]];
    CD [[
    | For any number n:
    |  xy = (x+n)y - ny
    |  xy = (x-n)y + ny
    ]];
    [[
    
    for example:
    ]];
    CD [[
    |  3(5) = (3+7)5 - 7(5)
    ]];
    [[
    
    I haven't found any use for it, but I thought that was useless and interesting.
    
    Another is this one:
    ]];
    CD [[
    | x + y + ... = a(xa~ + ya~ + ...)
    |             = a~(xa + ya + ...)
    ]];
    [[

    This one is actually handy, it allows me (1) to "flip" the ~ inside
    the terms, as (2) well as "borrow" factors even if the terms
    can't be really factored. In this case, I also started
    wondering what does factoring really means. I'll get back to 
    this later.
    
    Another one is this:
    ]];
    CD [[
    | xy~ = 1 + (x-y)y~
    ]];
    [[

    This is also useful and helped me simplify some tricky
    equations.
    
    Also this:
    ]];
    CD [[
    |   ax + by + cz + ...
    | = (a + b + c + ...)(x + y + z + ...) - q
    ]];
    [[

    where q = ay + az + bx + bz + cx + cy + ...
    Basically, the sum of all possible combination of terms
    not in [ax, by, cz]
    What does this mean and why is this useful?
    I don't know, I haven't really found any use for this,
    but it's saying I could factor out any sum of terms
    as a sum of their factors, minus some other shit.
    
    Related to this is the following observation (but not yet proven):
    For (my favorite) example, I have 
    ]];
    CD [[
    | 469 = 7(67)
    |     = 4(10^2) + 6(10) + 9
    |     = 2(2*5)^2 + 2*3(2*5) + 3*3
    |       ^--a       ^--b       ^--c
    ]];
    [[

    I noticed that the factors can be expressed as
    the sum of some factors. Meaning a factor of 469
    can be expressed as any sum of factors from a, b, c.
    For instance, 7 = 2 + 2 + 3. This seems to hold
    for the examples I tried, then I thought, 
    maybe because it's trivially true and doesn't
    really mean anything. Then I found that 425
    doesn't hold for this conjecture. But 
    it is true for all the product of prime numbers I tested. 
    
    Is it useful? Initially, it thought it could be,
    but then, the search space is still quite large(r)
    when going for the brute force method of trying
    the all the different combination of factors.
    
    So I'm trying the different angle, by
    looking for alternative or (even more) general ways of factoring, such as
    ]];
    CD [[
    | ax + by + cz = (a + b + c)(x + y + z) - q
    ]];
    [[
    
    What's even my end goal here? Nothing grand,
    I just want to make my own long division algorithm.
    I want, at a glance, say hey this number is factorable
    by these numbers. I don't think I'm smart enough
    to wreak havoc and render any cryptogaphic algoritms
    useless or less effective. It's a nice fantasy,
    but really, I'm just having some fun learning
    exploring some numeric properties. Again,
    nothing new here that any number theorist
    haven't thought of.
    ]];
}

entry {
    date="2024-04-01";
    time="15:26";
    tags={};
    [[
    I haven't really been doing anything for the past 
    week. No, I didn't lost my way inside the notebook
    and neglected anything else. I've been doing
    literally nothing, bar playing games and
    watching, or other random things to keep
    myself from being alone with my thoughts,
    things to distract myself from the cruel reality.
    
    Jung unccrarq vf gung zl uhfxl qbt qvrq.
    Bs nyy gur guvatf gb qvfnccrne sebz guvf jbeyq,
    vg unq gb or fbzrbar ernyyl pybfr gb zr,
    zberfb guna zl snzvyl zrzoref. V'q engure
    abg guvax nobhg vg zber, abg abj ng yrnfg,
    juvyr gur cnvashy zrzbel vf fgvyy serfu. V
    gubhtug V unq n ernyyl fgebat fgbvp nezbe,
    anviryl guvaxvat gung abguvat pbhyq cbffvoyl
    uheg zr nalzber. Ohg ab, sngr naq tbq
    vf n ******* ******* *** ******  ***-******* ******.
    V pna'g rira oevat zlfrys gb or natel be fnq
    zber guna V pna, onq sbe zl urnygu. V rira unq n crefvfgrag
    purfg-cnva naq fubegarff bs oerngu sbe nyzbfg n jrrx.
    
    Fb V'z tbvat gb rdhvc na rira fgebatre fgbvp nezbe guvf gvzr.
    Va gur raq, abguvat znggref, rirelguvat naq rirelbar qvrf.
    Jung vf rira gur cbvag bs pelvat, urpx V jvfu V pbhyq
    onjy zl rlrf bhg naq pel hagvy ab zber. Ng zbfg, zl rlrf
    trg jngrel. Bayl zl vafvqrf ebgf naq qvrf rira zber.
    
    I'm not going to think about it.
    ]];
}

entry {
    date="2024-04-08";
    time="19:20";
    tags={};
    [[
    Well, another week has gone by. I'm slowly trying
    to build up my motivation and get back on my feet.
    Not even sure what to write right now, anything
    goes I guess. I should take note of positive things
    for a change.
    
    These days, it's been quite windy. It has also been
    quite hot, sometimes I'd be constantly sweating
    throughout the day, especially when I move around
    a lot. I should increase my usual water intake to
    avoid dehydration. I don't mind the heat and sweating though,
    it feels good in fact to have the wind blow and dry my sweat away.
    
    I also finally managed to beat the final-final boss on 
    Ys: Oath in Felghana. I even managed to beat it on first
    or second try, without too much effort. With 7 HP left,
    I did it. Maybe I was well-rested
    and relatively anxiety-free. Or let my mind take a break
    from something difficult and come back on it with a better
    insight or skill. 
    
    But most likely, it's because
    I lowered the graphics settings and improved the FPS.
    Suddenly, deflecting the dark energy ball wasn't
    so difficult. Maybe it's all of the above.
    
    No it's actually because I've been watching
    Shangri-La, an anime where the main character
    is an otaku who likes beating kusoge (diffult, shitty games).
    I think Ys games qualify as kusoge. I
    doubt a very attractive, big-breasted young woman
    is secretly into me, but it's quite easy to 
    imagine myself as a bird-brained freak who
    fixates on terribly wrong or challenging things.

    ]];
    IMG {src="/screenshots/img-1712401606.jpg"};
    [[


    It's been a while since I last saw this ending.
    I wonder if Adol ever went back to Felghana 
    to see Elena again. Looking it up, it doesn't
    look like she appeared anywhere in the later
    subsequent releases, so it's left for 
    the player's imagination. What I imagine
    is that Adol never ever came back, and Elena
    grew old, decreipt and desolate, 
    but still hopeful until the very end.
    
    I also started playing Ys: Origin next.
    With the blessings of bird-brained sunraku,
    I've been in girigiri (close-call) situations,
    where I defeated several bosses with barely HP
    left. I even defeated the centipede boss
    with 1 HP left while poisoined. That's almost
    like Sunraku, except with a serpent instead of
    a centipede.
    
    ]];
    IMG {src="/screenshots/img-1712516719.jpg"};
    IMG {src="/screenshots/img-1712081667.jpg"};
}

entry {
    date="2024-04-09";
    time="12:34";
    tags={"math"};
    [[
    Well, it's midday of an early week in a yet another
    blazing hot day, and I'm lethargic as fuck again.
    There's lots of things I could do, or rather,
    I feel like I should do, yet here I am staring
    blankly at my untrimmed toe. I'm even
    too lazy to play games.
    
    Maybe I should eat some chocolate. I had 
    a long good sleep last night, yet I feel
    extra tired when I woke up.
    
    Still, I should just do something,
    anything, however trivial or useless it is.
    Does typing all of this counts as doing something?
    
    Actually I'm still working on my notebook,
    on my futile goal of trying to find other ways 
    to factor a number.
    I do this before I start my day, while caffeine
    is still fresh in my biological systems.
    Why am still even working on it? Because
    I'm actually slowly making progress, I feel like
    I'm almost there. My gut feeling, could be wrong,
    is that there's no reason to resort to brute
    force when doing primality testing. What so special
    about prime numbers anyway?
    
    Mathematicians defined
    a restriction that the factors should be natural numbers,
    but without that restriction, prime numbers are nothing special.
    I could also also try changing the unit other than 1.
    Yes, in my hypothetical universe where people have digit fingers of 1+N~, 
    some (all?) primes become composite, and composite becomes prime.
    
    But that's cheating, a math nerd would say. Yeah, but
    if my delusions turned out to be true, then
    prime numbers are mere superficial constraints imposed
    by our current mathematical system.
    
    I have several algorithms that (at least appears to)
    work reliably well on small numbers. I could write
    programs to handle bigger numbers. It remains to
    be seen whether I could find (or prove) a general solution
    that works on any number. Or not,
    I'm just a lowly outsider to the art of mathematics.
    As always, I'm most likely just wasting my worthless time.
    No matter, my curiosity is fixated on doing this,
    I will keep on doing it, until I find something else to do.
    
    No, find a job you stupid hiki-NEET.
    ]];
}

entry {
    date="2024-04-10";
    time="16:21";
    tags={"site"};
    [[
    I have now implemented tagging on my personal site,
    and current I'm tediously adding tags to each log and image.
    I kind of wish I did this earlier. Oh well,
    it's not that bad, it's mostly a repetitive,
    mechanical work.
    ]];
}

entry {
    date="2024-04-10";
    time="19:46";
    tags={"site"};
    [[
    Fu, I actually have a thousand
    of images to tag, I can't believe
    I've accumulated that much screenshots already.
    I should limit the screenshots when I 
    watch anime. Also, lol I can't even
    remember for the life of me what
    the names of anime I watched.
    Even the catchy titles like Solo Leveling.
    ]];
}

entry {
    date="2024-04-10";
    time="20:34";
    tags={"site"};
    [[
    Aha, I managed to tag 800 images 
    in one sitting, for about a half an hour.
    I did with just keybindings using vim and the dolphin
    file manager. I should just write a script in the future though.
    
    Frieren, Dungeon Meshi and Shanri-la have the most picturesque screenshots.
    They really do have a good art, I could just take any random
    screenshots and it would likely look good.
    ]];
}

entry {
    date="2024-04-11";
    time="12:39";
    tags={"math"};
    [[
    I now have a roughly working algorithm for finding a 
    factor given a number, and by extension, testing
    whether a given number is prime. It doesn't involve
    testing against a (possibly large) set of numbers.
    It's largely a conjecture if it holds for all numbers.
    I'm still working through examples that I think
    could be a counter-example, and thus prove the
    conjecture wrong. Since I'm not a mathematician,
    it's a long way for me to be able to formulate
    a mathematical proof. For now, finding counter-examples
    is easier.
    
    The question is, will it be any better than the current
    algorithms? I don't know, depends on the complexity 
    of finding the common factors between a number.
    I think gcd is pretty fast. Fast or not, it doesn't matter,
    it would be cool enough to create my own algorithm.
    ]];
}

entry {
    date="2024-04-11";
    time="20:25";
    tags={"site"};
    [[
    Huh, the more features I add to my
    personal site, the slower the total build time.
    Adding the tagging feature increased the build time to
    around 10s. But who cares, I only build the site
    when I need to deploy, I don't need to build
    during development and testing.
    
    The codebase has gotten quite a mess though.
    Anyway, it's mostly temporary, throwaway code that
    it will change according to my ephemeral whims.
    ]];
}

entry {
    date="2024-04-19";
    time="12:48";
    tags={};
    [[
    My t440p laptop kept crashing, the exhaust fan
    was really hot even right after the initial boot.
    My wireless card also strangely kept failing.
    This seems to happen more during the middle
    of a hot day.
    I unscrewed my laptop open and saw that
    the exhaust was filled with thick dust.
    I quickly dusted it off and tapped
    in on wall to shake rest of the dust inside.
    That seems to have fixed the problem?
    Maybe I should replace the thermal paste
    too, the last one applied was 5 years ago.
    ]];
}

entry {
    date="2024-04-22";
    time="11:05";
    tags={"hidden"};
    [[
    Vg'f rneyl zbaqnl zbeavat ntnva, gvzr
    gb ernffrff zl pheerag yvsr genwrpgbel.
    Lrfgreqnl, zl zbgure znqr vg pyrne
    gung fur jba'g ab gnxr sbe na nafjre,
    gung fur jvyy tb gb ivrganz jvgu zr,
    naq V jvyy jbex gurer. Ure ernfbaf:
    fur qbrfa'g yvxr guvf cynpr nalzber,
    naq gurer'f na vapbzvat jne,
    naq zl fvfgre vf pheeragyl jbexvat
    nf n grnpure va ivrganz.
    Orpnhfr fur xrrcf jngpuvat gurfr tbqqnza srne-zbatrevat
    lbhghoref jub xrrcf fnlvat "jne, jne, JNE vf pbzvat,
    CYF yvxr naq FHOFPEVOR gb zl punaary!!?".
    
    Gurer'f fb zhpu jebat jvgu guvf
    V qba'g rira xabj jurer gb fgneg.
    Zbfg vzcbegnagyl, zl zbgure znqr vg
    pyrne gung V arire unq serrqbz
    va gur svefg cynpr. Fur ernyyl
    xabjf ubj gb qevir zr va gur pbeare,
    hagvy fur oraqf zr gb ure jvyy
    naq punatr zl zvaq.
    
    V jvyy cebir ure jebat.
    Guvf qnl, V qrpvqrq gb nffreg zl 
    zlfrys. V jvyy oernx gurfr
    punvaf bs pbageby qvfthvfrq
    nf cneragny pbapreaf. V jvyy 
    tb bhg bs gur ubhfr, yrnir 
    ubzr sbe tbbq, naq svaq nal wbo
    V pbhyq gnxr, fuvg cnl be abg.
    Gur bayl ernfba V chg hc jvgu
    gurfr yvivat pbaqvgvbaf hagvy abj
    vf gur fbpvny nakrgvl gung
    vf ceriragvat zr sebz vagrtengvat
    jvgu gur erfg bs fbpvrgl.
    
    Ohg zl nakvrgl sebz zl zbgure
    vf fgrnqvyl tebjvat, gb gur
    cbvag gung naljurer ryfr vf svar,
    naq tbvat bhgfvqr qbrf'g frrz
    nyy gbb njshy abj va pbzcnevfba.
    
    Vg'f gvzrf yvxr gurfr gung
    vfrxnv tvirf gung frafr bs 
    eryvrs. Ba gur qnex fvqr,
    vfrxnv zvtug or n zrgncube sbe qrngu be fhvpvqr.
    Ohg gur nygreangvir vagrecergngvba vf 
    fgnegvat n ubcrshyyl orggre yvsr narj, yrnir
    rirelguvat oruvaq. Vg zrnaf tbvat 
    gb n qvfgnag cynpr jurer rirelguvat
    vf fgenatr be hasnzvyvne.
    
    Jryy, gung'f gur cyna ng yrnfg.
    V'z abg tbvat bhg va gur fgerrgf
    ubyqvat n fvta "jvyy pbqr lbhe PEHQ sbe crnahgf",
    ng yrnfg abg vzzrqvngryl. Va gvzrf bs qrfcrengvba,
    V'yy whfg ntterffviryl fgneg nccylvat sbe
    nal penccl ybpny wbof V pbhyq svaq. Erzbgr
    jbex vfa'g ernyyl na bcgvba nalzber
    qhr gb n irel qvfehcgvir raivebazrag.
    Vg jbhyq or n fhccbfrqyl grzc wbo,
    hagvy V pbhyq fnir rabhtu gb zbir
    gb n yrff penccl wbo.
    ]];
}

entry {
    date="2024-04-22";
    time="11:41";
    tags={};
    [[
    I'm going to put on hold
    on working on the factoring
    algorithm. I want to create
    a tool or app that allows me
    to play around with grids
    of rectangles that 
    represent two numbers being
    multiplied. The purpose
    of this is to help me get
    a better intuition and insight,
    as well as develop or improve the algorithm
    more visually and playfully.
    
    Playing around with paper is fine at first,
    but it becomes tedious for grid of size
    greater than 5x5.
    ]];
}

entry {
    date="2024-04-22";
    time="19:19";
    tags={};
    [[
    For reasons or another, I'm starting
    job search again. Of course, when
    it comes to reaching out and contacting people,
    I first need to make myself not too
    much of an eyesore. And I just realized
    that my profile picture is already more
    than a year old. How time flies.
    
    So for tomorrow's agenda: ]];

    UL {
        LI "take a more recent picture of myself";
        LI "update my personal site";
        LI "write cover letters";
    };

}

entry {
    date="2024-04-23";
    time="19:45";
    tags={"site"};
    [[
    Well, so much for my plans for today,
    I mostly just did a bunch of changes
    on my personal site. I also managed to 
    cut down the build time from 10 seconds
    to two seconds by caching the filesystem reads.
    ]];
}

entry {
    date="2024-04-24";
    time="12:56";
    tags={};
    [[
    Huh, for some reason I'm itching to 
    implement some cellular automata like
    langton's ant, turmite, or even the 
    classic game of life. Not exactly
    on the topmost priority, all things
    considered. But, wouldn't it be cool
    if I could also create a cellular
    automaton algorithm myself, maybe
    something based on factoring or
    prime numbers.
    ]];
}

entry {
    date="2024-04-25";
    time="13:32";
    tags={"site"};
    [[
    Bah, I just spent an hour fixing
    bugs on my site. The strange thing is,
    it works fine on my machine, but when
    it builds on github's runner, a bunch
    of strange stuffs shows up.
    
    I thought it was because I was using
    a macOS runner, but same thing happens
    on ubuntu too. 
    
    Of course, the bugs are entirely my own fault,
    but it would have been ideal if I could reproduce
    the bugs on my local computer, instead of debugging
    on github's action logs.
    
    One of the reason I'm using [redbean](https://redbean.dev/) in the first place
    is that I'm hoping I could get that consistent behaviour
    across different systems without worrying about
    special quirks that I have to handle. Oh well,
    I can't have that too I guess.
    ]];
}

entry {
    date="2024-04-25";
    time="19:20";
    tags={"hidden"};
    [[
    Okay, time for a plan B. If I'm going to 
    take the same approach to job searching,
    by applying to job postings I come across,
    I'm not going to get anywhere, which
    
    There are two problems: ]];
    UL {LI "presentation (impressions)"; LI "proof of skill or competency"};
    [[
    
    I hate to admit it, but I'm not a very
    presentable person, even in the 
    generous interpretation of the word.
    I am disheveled, a mess, both in person and through work output.
    It takes quite an insurmountable effort for me to not 
    be chaotic and disorderly. It's a reflection of my current life, probably,
    too much interruptions, too little control.
    
    Maybe I could work on shaving my mustache and
    beard, and get a proper haircut. But what would that do?
    It would not contain the chaos that would inevitably
    escape from within, like painting white over a scattered debris.
    
    Yet, these could be mere excuses for my reluctance to change.
    Could be, but ideally, I'd live in a world where people are
    not judged by their facial hair, but no, that world might
    as well be in a different timeline now. In this world I live in,
    social signals are what matters. Or not, I lost my
    train of thought there, I don't even know where 
    I am going with this, I would probably conclude
    with more excuses why I failed in life. As
    amusing as it is to continue driving that trainwreck
    of a thought, that's not what I'm writing here.
    
    What I'm saying is, I should do the bare minimum of
    making myself presentable, but no more. Although,
    now that I think about it, I have an abstract notion
    of what presentable means, which is to say, I have
    no idea what it means beyond getting a haircut.
    I guess that's that, get a haircut. Heck no,
    I'm not going outside just to get a haircut,
    what a waste of time, effort and willpower,
    and money.
    
    Fuck, okay, let me try again. I wasn't planning
    to turn this log into a stream of consciousness,
    just write the notable bits.
    
    Just shave my beard, and either shave the mustachio,
    or trim it clean. I think my hair is still fine as it is.
    If I get HR filtered for having a stupid looking face, 
    then fine by me. I'm not even applying for a public
    facing job, why does that matter so much. I'm
    looking for a job where they throw me deep in a labrynith
    dungeon to work 8-6, where no ass-kissing and pretentious
    bullshitry can thrive. Just let me do the damn work,
    why does this have to be so hard.
    
    On second thought, I don't think I want to work.
    ]];
}

entry {
    date="2024-04-25";
    time="20:21";
    tags={"hidden"};
    [[
    So an epiphany just reoccured to me. I don't
    have a chance through regular hiring channels.
    Especially not when I have to compete with 
    more extroverted nontech LLM-copiloted people 
    with better pleasing personalities.
    
    No way I want to work as a glorified 
    button-color changer anyway, LLM people can take those jobs,
    fine with me.
    
    So what are my choices then?
    
    First, I'll look for a company that I absolutely
    want to work for. Then, I will scour their about page,
    find the section where they brag about their fully
    diverse nice-looking employees. Then I will take note
    each of their names, their social media accounts.
    I will then stalk their social media, each
    one and every of them, noting down their behaviour,
    likes and preferences, dislikes and peeves, their
    hobbies and everything, what makes them tick.
    
    Then the second phase would be to get into contact,
    first as an curious nobody, then to a familiar somebody,
    then to an distant acquaintance, to a friend, to 
    a family, to a blood-contracted bretheren. I'd
    then be part of the cult without going through
    the hazing rituals where I lose my sense of self,
    to which then I could coast through life and live happily ever after
    AHAHAHAHAH(???..?)
    
    What am I planning for again?
    
    Jokes aside, yeah, directly contacting the
    potiential coworkers seems like a more viable
    alternative. At least, they'd be a better
    judge on what kind of people that would be fit
    to do the job. Maybe. It's worth trying at least.
    ]];
}

entry {
    date="2024-04-30";
    time="19:59";
    tags={"ant"};
    [[
    So I started a small project recently,
    against my other plans and priorities,
    henceforth I will designate as the "ant" project.
    
    As the name implies, it has something to do with ants.
    Not literal ants though, but as a side note,
    I recently come across another mycmyrnae, no uh,
    mcmyrne, myrrnc... Myrmarachne is the word,
    which is a fancy name for spider-ant mimics,
    or spiders that pretends to be ants. It's either
    they are a rare bunch, or just hard to spot.
    In any case, ant mimics are a nice find
    when you see them.
    
    The ant project will be primarily be about ]];
    A {href="https://en.wikipedia.org/wiki/Langton%27s_ant"; "langton's ant"};
    [[
    Secondarily, the project will be anything related to cellular 
    automata. The side goal is for me to have a nice
    UI playground for moving around blocks, for purposes
    of further developing my factoring algorithm.
    
    Cellular automata are algorithmically
    straighforward to implement, but the question
    is which UI framework should I use. After some
    brief consideration, I just opted to use the
    web frontend (html+js), firstly because it's what I'm most
    familiar with, and second, because it's the
    easiest and cheapest stack to put things out there.
    
    Initially, since I used lua for my static site,
    I opted to try ]];
    A {href="https://github.com/fengari-lua/fengari"; "fengari lua VM"};
    [[
    so I could still have all of my codebase in lua.
    This was a mistake though, since after 400 lines of
    crappy lua code, the web UI would stutter and lag
    with a grid size of 20x20. That's barely acceptable
    for me, because cellular automata are better with 
    larger grids.
    
    I thought maybe I was doing something wrong
    with the canvas API that was causing the lag.
    But I'm mostly just drawing a bunch of rectangles,
    surely it can't be that. So my hunch is that
    fengari is the problem.
    
    I considered using p5js, but it was
    a large 1MB depedency, plus now I have
    to learn the p5js API, which would
    cause me to exceed the planned time budget.
    
    The easiest fix is to try rewriting the lua
    code directly into javascript. After some
    mild frustration translating lua eccentricities
    to javascript, I managed to get it working
    and fix any weird bugs.
    
    And the result: javascript code was way faster,
    even with 100x100 grids it performs smoothly.
    I guess the lesson of the day is that I should
    have tested how fengari would perform with
    hot loops.
    
    Oh well, that's that.
    ]];
}

entry {
    date="2024-05-01";
    time="12:39";
    tags={"ant"};
    [[
    I mostly planned how the UI will behave,
    I decided to copy somewhat the dolphin file browser
    behavior. As for cell insertion, I'll
    add a paint mode, where I can brush or fill
    new cells. I might consider adding some
    undo/redo feature too.
    
    The features I listed aren't exactly overscoping,
    they are at least necessary features for it 
    to be useable, still doable with LOC < 1K.
    
    I'm considering using typescript at this point though,
    to save me some time debugging or fixing type errors.
    ]];
}

entry {
    date="2024-05-01";
    time="20:41";
    tags={"ant"};
    [[
    Uhh, I got a bit distracted and spent way
    more time trying to scaffold a typescript
    project with ]];
    A {href="https://bun.sh"; "bun"};
    [[
    I wanted to use bun since it's really
    fast at compiling/bundling and it comes
    with all the nice stuffs that lets me
    skip the trouble of installing a bunch
    of node dependencies.
    
    The problem is that it doesn't have a built-in
    feature for hot reloading client code, like
    what ]];
    A {href="vitejs.dev"; "vitejs"};
    [[
    
    I really should have opted to go with vite,
    that kinds of defeat the purpose of using bun,
    since vite adds tons of dependencies and complexity
    that I don't need.
    
    What I just need is:]];

    UL {
        LI "bundle typescript code";
        LI "auto-page reload when any files are changed";
        LI "local development server";
    };
    [[
    
    Bun already provides the two, bundling and server,
    and bun already supports HMR, so I'm practically
    half-way there, I just need to write
    a bit of code to get the automatic page reloads.
    
    After some head-scratching and fumbling, I 
    managed to get the setup I want. Now I can
    go back and continue the ant project for real.
    ]];
}

entry {
    date="2024-05-02";
    time="15:57";
    tags={};
    [[
    Okay, I successfully rewrote the initial code
    to typescript, and I did some refactoring as well.
    Also, I managed to implement the cell selection
    and movement, somewhat similar to the dolphin file browser.
    I copied that behavior since it seems to 
    be more intuitive, and saves me the trouble
    of trying to define my UI interaction,
    which may end up being unintuitive.
    ]];
}

entry {
    date="2024-05-04";
    time="11:30";
    tags={"hidden"};
    [[
    TODO for this weekend:
    * relearn react (probably just try using it on the sidebar in the ant project)
    * try creating a react project from scratch or template
    
    * clean up browser, desktop, filesystem because wambo and martini
    will be giving a live coding test and I have to share my desktop
    * or just create a new temporary linux account
    
    * setup an unused webcam and test if it works
    
    x check out fpt-software company that my mother keeps bugging me about
    x port nature of code 2 examples to love2d
    x submit all other job applications
    ]];
}

entry {
    date="2024-05-07";
    time="20:00";
    tags={"mambo"; "hidden"};
    [[
    Fb 5 qnlf ntb, ba UA'f zbaguyl "Jub'f uvevat?" guernq  
    V fnj n wbo cbfg uggcf://arjf.lpbzovangbe.pbz/guernqf?vq=zu-zna:
    
    | zu-zna 5 qnlf ntb | cnerag | pbagrkg [–] | ba: Nfx UA: Serrynapre? Frrxvat serrynapre? (Znl 2024)
    | 
    | FRRXVAT SERRYNAPRE | Jro nccyvpngvbaf - Ernpg, Firygr, Abqr.wf
    | Shyyl erzbgr jbex. HGP+0 gb HGP+8 gvzr-mbarf bayl.
    | 
    | Obgu whavbe naq fravbe cbfvgvbaf ninvynoyr.
    | 
    | Cyrnfr pbagnpg znzobxvabxv ba Qvfpbeq (fraq n sevraq erdhrfg) JVGU lbhe Tvguho nppbhag.
    
    Url ybbx, svanyyl n wbo cbfg gung qbrfa'g nfx sbe n erfhzr,
    whfg n tvguho yvax. Arrqyrff gb fnl, V nccyvrq gb vg
    jvgubhg n frpbaq gubhtug. Na npg bs gnpgyrffarff be qrfcrengvba,
    jub xabjf.
    
    V frag n sevraq erdhrfg nybat jvgu zl tvguho yvax nf vafgehpgrq,
    naq Znzobxvabxv ercyvrq. Znzob gbyq zr gung gurer jvyy or n 
    guerr ubhe-ybat pbqvat grfg. V unir greevoyr nakvrgl
    jura vg pbzrf gb pbqvat grfgf, rfcrpvnyyl jvgu n snpr pnzren ba.
    Ohg V nterrq jvgu vg naljnl fvapr vg jnfa'g rknpgyl n yrrg pbqvat,
    whfg n fvzcyr jro ncc pbqvat fghssf, naq vg pbhyq or yrff guna
    guerr ubhef vs V svavfu rneyl.
    
    Ohg orsber gung, Znzob fnvq gurer jvyy or fbzrbar jub
    jvyy qb n cer-fperravat grfg jvgu zr.
    
    Ragre gur fprar: znegvaoevfx326
    
    Pnfhny grkg pung jvgu znegvao sbe 30 zvahgrf, V trg gb
    pubfr n cebwrpg bs zvar gb qvfphff. V pna qb gung,
    abguvat gbb uneq. V cvpxrq zbba-grzcyr fvapr
    vg'f fgvyy eryngviryl serfu va zl urnq.
    V oynoore ba nobhg, abg ernyyl fher vs V fubhyq
    jnvg sbe uvf ghea gb gnyx. Znegva gura ohggf va,
    nfxvat jung qbrf shapgvba _abqr qb? Va grezf bs vachgf
    naq bhgchgf.
    
    V gbbx n zragny abgr bs ubj ur hfrq vachgf naq bhgchgf.
    Vg'f abg n grez V rkcrpgrq va gur pbagrkg bs shapgvbaf.
    Jura V urne bs vachg/bhgchgf V guvax bs svyrf naq
    BF vagresnprf, uneqjner be rira fvqr rssrpgf. Ur cebonoyl zrnag
    cnenzrgref naq erghea inyhrf. V dhvpxyl crevfurq gur gubhtug
    gung guvf thl unf ab vqrn jung ur'f gnyxvat nobhg,
    orpnhfr, jryy ab jnl, V'z fher guvf thl vf yrtvg naq pbzcrgrag.
    
    Gura znegvao nfxf jung qbrf gung frgzrgngnoyr qb?
    Jryy, V'z abg rira fher ubj gb qrfpevor gung cerpvfryl
    jvgubhg ybbxvat vg hc. Ohg bu jryy, vg'f yvxr cebgbglcrf
    va wninfpevcg, vg nyybjf zr gb qb BBC frznagvpf.
    V'z abg rira fher vs gung znxrf frafr, ohg gunaxshyyl,
    znegvao fnvq "Tbbq, gung'f gur nafjre V jnf ybbxvat sbe".
    Zl gubhtug ntnva jrag, "uhu.. vf vg?" Gur jnl ur fnvq vg,
    vg frrzf yvxr ur jnf qbvat n cbc dhvm naq jnf rkcrpgvat
    svyy-va-gur-oynaxf nafjref. Ntnva, jrveq guvat, V srry
    yvxr ur qvqa'g qb n gubebhtu wbo nffrffvat zr. Be engure,
    znlor ur pna'g? Anu, ab jnl.
    
    Ohg bu jryy, pneel ba, vg frrzf V cnffrq gur cer-fperravat 
    grfg.
    
    Ur nfxrq zr gbb vs V unir nal xvaq bs bowrpgvba gb tnzoyvat.
    Gung'f nyernql n erq synt, be ng yrnfg qnex benatr-vfu,
    ohg V'yy cynl nybat. Vg'f abg yvxr V unir n ybg bs pubvprf.
    
    Gura znzob tnir zr n gvzr fybg orgjrra 3CZ gb 8CZ
    jura V jbhyq qb gur pbqvat grfg. Fvapr V nfxrq gurz gb tvir
    zr gvzr gb erivrj ernpgwf fvapr vg'f orra n juvyr fvapr
    V jebgr nal ernpg pbqr. Gurl nterrq, naq yrg zr qb
    gur grfg ba gur arkg zbaqnl, V unq gur jrrxraq gb
    oehfu hc ba ernpg pbqvat.
    ]];
}

entry {
    date="2024-05-08";
    time="10:39";
    tags={"mambo"; "ant"; "hidden"};
    [[
    Nf n erserfure, V qrpvqrq gb hfr ernpgwf ba zl
    nag cebwrpg. V ernq gur hcqngrq ernpgwf qbphzragngvba,
    juvpu ol gur jnl unf ernyyl vzcebirq, naq gura
    V fgnegrq jevgvat pbqr. 
    Nqzvggrqyl, V srry yvxr gur pbzcyrkvgl
    bs gur pbqr jrag hc n abgpu, cnegvnyyl orpnhfr
    V unq sha jevgvatf guvatf sebz fpengpu,
    ohg nyfb orpnhfr V unq gb flapuebavmr fgngr
    orgjrra gur ernpg pbqr naq gur pnainf.
    
    Gura pbzrf zbaqnl, gur nakvrgl unf ohvyg
    hc bire gur jrrxraq. Va zl zvaq, V nyernql
    snvyrq, fb zr whfg trg bire guvf.
    Znzob frag gur yvax,
    uggcf://zrrg.wvg.fv/96FbWAzJultslWY
    onfvpnyyl n ivqrb fperrafunevat fvgr.
    Gurl gbyq zr va nqinapr gung V jbhyq
    funer zl fperra juvyr qbvat gur grfg,
    fb V perngrq n arj yvahk nppbhag gb
    nppvqragnyyl nibvq fubjvat zl oebjfre uvfgbel 
    naq bgure jrro fghssf ba gur fperra.
    
    Gur pbqvat grfg jnf fvzcyr: gurl tvir
    zr n ceboyrz erdhverzragf/qrfpevcgvba 
    naq V jnf gb jevgr n pbqr gung fbyirf 
    naq fngvfsvrf gur erdhverzragf. Bar
    guvat gb abgr vf gung gurl cnfgrq
    gur jubyr grkg va n gval grkg pung ba wvg.fv.
    Jul jbhyq gurl chg vg gurer naq abg ba qvfpbeq?
    
    Naljnlf, gur erdhverzragf jnf gung V jnf
    gb zbqvsl gur (ernpg gvp-gnp-gbr](uggcf://ernpg.qri/yrnea/ghgbevny-gvp-gnp-gbr)
    ghgbevny gb znxr vg zhygvcynlre, hfvat
    rkcerffwf naq jrofbpxrgf. Gur fgngr naq ybtvp
    fubhyq or ba gur freire, vg fubhyq abg
    or cbffvoyr sbe gur pyvrag gb "unpx"
    naq zbir bhg bs ghea. Cerggl fvzcyr,
    rkprcg vg unf orra sberire fvapr V hfrq
    rkcerffwf naq jrofbpxrgf, naq V'z ehaavat
    ba yvzvgrq gvzr, guerr ubhef ng zbfg.
    
    V cebonoyl fcrag 1.5 ubhef be zber fpnssbyqvat naq
    frggvat hc gur cebwrpg, vapyhqvat ernqvat
    gur qbphzragngvba naq erfrnepuvat jung
    jrofbpxrg yvoenel gb hfr, fcrpvsvpnyyl
    yvoenevrf gung ner pbzcngvoyr jvgu rkcerffwf.
    Ybbxvat onpx, V fubhyq unir hfrq n cebwrpg
    rkcerffwf grzcyngr gung hfrf jrofbpxrgf,
    vafgrnq bs perngvat bar sebz fpengpu hfvat
    [oha](uggcf://oha.fu). 
    
    Gur npghny gnfx bs zbivat gur pyvrag ybtvp
    gb freire jnf eryngviryl fgenvtugsbejneq,
    V jnf fpenzoyvat gb whfg penax bhg pbqr,
    V qvqa'g unir gvzr gb guvax ubj gb betnavmr
    gur pbqr, V znqr dhvgr n ybg bs fghcvq 
    reebef naq zvffgrcf nybat gur jnl. 
    
    Sbeghangryl, va gur avpx bs gvzr, V 
    svavfurq gur gnfx orsber gur guerr crevbq
    jnf hc. Gurl nfxrq zr gb hcybnq gur
    svavfurq cebwrpg, fb V chfurq vg ba
    [tvguho](uggcf://tvguho.pbz/aiyyrq/gvp-gnp-gbr-zhygvcynlre).
    Gur pbqr vf n zrff gubhtu, fb V cebonoyl snvyrq.
    
    ...
    
    Gur arkg qnl, znegvao vasbezf zr gung V cnffrq, V guvax?
    Uvf rknpg jbeqf jrer:
    
    | Jryy qbar. Rirelguvat jbexf. Lbh unir ab vqrn ubj znal crbcyr snvy rira n onfvp ratvarrevat rkprepvfr yvxr guvf
    | Cyrnfr cvat zr jura lbh ner nebhaq
    
    Ubj ur jbeqrq guvf zrffntr vf fbzrguvat gb gnxr abgr.
    Gur rzcunfvf jnf ba gur cebwrpg jbexvat, abg gur
    cebprff bs ubj V jebgr gur pbqr, be rira gur
    dhnyvgl be znvagnvanovyvgl. Ab erznex be rira dhrfgvba
    jul V hfrq oha, be jul V pubfr gung yvoenel, be
    jul V fgberq gur jrofbpxrg vafgnaprf vafvqr gur obneq pynff (onq vqrn).
    Gung benatr synt va zl crevcureny ivfvba ybbxrq nyy gur zber oybbql erq,
    nf guvf jubyr guvat tbrf ba.
    
    Ohg jub pnerf, V cnffrq.
    
    Ragre gur fprar: ZntvpPunxenz
    
    Terng nabgure nabalzbhf crefba gung V unir ab vqrn
    jub vf be jung ebyr be cbfvgvba ur qbrf.
    
    Gurer ner abj sbhe crbcyr va gur qvfpbeq pung:
    znzob, znegvao, punxenz naq zr
    
    Fheryl, gurl jbhyq fgneg vagebqhpvat gurzfryirf
    nal gvzr fbba evtug? Jub gurl ner, jung gurl qb.
    Be ng yrnfg tvir zr gur 
    ovttre cvpgher bs jung V jbhyq qb be rkcrpg.
    Abcr, rira abj, V tbg abguvat, ab anzrf,
    vqragvgl, ybpngvba, be rira traqre.
    V pna bayl thrff onfrq ba gurve hfreanzrf
    naq cersreerq gvzrmbar gung gurl ner cebonoyl
    vaqvnaf.
    
    Znegvao gura nfxf vs punxenz pbhyq
    nqq zr gb gur grnzybttre. Fher guvat, punxenz
    pbasvezf. V gubhtug, jung pbhyq or gur ulcbgurgvpny ernfba 
    ur pbhyqa'g nqq zr?
    Naq jul vf ur gur bar qbvat vg? Jung'f n grnzybttre?
    
    V jnf vafgehpgrq gb qbjaybnq naq vafgnyy
    grnzybttre naq pbasvezrq gur grnzybttre vaivgr.
    Naq yvxr n fghcvq shpx V nz, V whfg pbzcyvrq
    jvgubhg guvaxvat ntnva. Rffragvnyyl, grnzybttre
    vf znyjner gung nyybjf rzcyblref gb fcl
    ba gurve rzcyblrrf, gb znxr fher gurl nera'g
    onfxvat va gurve jnvsh'f cerfrapr vafgrnq
    bs qbvat gurve wbof. Vg'f nyfb n gvzr genpxre
    sbe gur gnfxf, ohg V qbhog gung'f gur cevznel
    shapgvba.
    
    Ohg bu jryy, vs vg zrnaf trggvat cnvq,
    jul abg?
    
    Punxenz frag zr n qvfpbeq sevraq erdhrfg,
    naq tvirf zr n dhvpx eha qbja ba ubj gb
    hfr gur grnzybttre. V grfgrq gur grnzybttre
    ncc yvxr n D&N cerffvat nyy gur ohggbaf
    V pna gb frr jung vg qbrf. V nfx fghcvq
    boivbhf dhrfgvbaf whfg gb trg n pbairefgvba
    tbvat. Fbzrguvat oebxr, gur gnfx qvfnccrnef
    harkcrpgrqyl, bu lbh'er abg fhccbfrq gb
    cerff gung, fnlf punxenz. Vg'f n fvzcyr
    ncc: lbh chapu-va jura lbh fgneg jbexvat,
    lbh chapu-bhg jura lbh'er qbar sbe gur qnl.
    Gurer'f n cnhfr gvzre jura V arrq gb gnxr
    n penc be fbzrguvat. Cvff rnfl, rira
    n fhoergneq pna qb vg.
    
    Gura bhg bs abjurer, punxenz cvatf 
    znegvao naq fnlf "Ebanyq vf frg gb jbex.
    Qbrf ur unir nyy vf arrqrq gb fgneg sebz lbh?".
    Gur shpx, ab V'z abg, V fgvyy oneryl xabj 
    nalguvat.
    
    V fnvq ab, V'z fgvyy grfgvat gur znyjner ncc.
    V fcrag jnl ybatre guna V arrq gb rkcybevat
    naq grfgvat gur ncc, naq nfxvat zber dhrfgvbaf,
    V jnfa'g fher vs V fubhyq jnvg
    sbe gurz gb fnl nalguvat nobhg jung gb qb arkg.
    
    V bsgra vtabenagyl nfxrq jung fubhyq V qb arkg,
    orpnhfr gurl fher qvqa'g znqr vg pyrne jung arrqf
    gb or qbvat.
    
    Gura svanyyl V srry yvxr V fgnyyrq rabhtu, fb
    V fnvq "Jryy, gung'f rabhtu grfgvat. Jung qb V arkg?".
    
    Gura znegvao fnvq
    "V jvyy or jvgu lbh va 30 zva, qbrf gung fbhaq bx?"
    
    Jung qbrf gung rira zrna? Yvxr fgneg jbexvat?
    
    Gur pbairefngvba jrag ba fgenatryl nobhg:
    
    | znegvaoevfx326 : V jvyy or jvgu lbh va 30 zva, qbrf gung fbhaq bx?
    | ebanyq : Yvxr fgneg jbex?
    | znegvaoevfx326 : lrf, vf gung bx jvgu lbh?
    | znegvaoevfx326 : V jvyy tvir lbh fbzrguvat fvzcyr naq bcra fbhepr sbe lbhe svefg qnl 😄
    | ebanyq : Bu bxnl gura
    | znegvaoevfx326 :
    | Npghnyyl jr pna tb abj. Fbeel, sebz gur gvzr V jbxr hc gvyy abj guvf qnl jnf trggvat penmvre naq penmvre
    | znegvaoevfx326 :
    | @ebanyq fgvyy jvgu hf?
    | ebanyq : lrnu
    | ebanyq : Qb V chapu va abj?
    | ebanyq : Jung qb V jbex ba?
    | ebanyq : Fbeel, V srry yvxr V'z fgvyy zvffvat n ybg bs vasbezngvba
    | znegvaoevfx326 : Jryy V jnag gb gryy lbh gung, naq lrnu chapu va
    | ebanyq : chapurq va abj
    
    V jnf fb pbashfrq ng gung cbvag. Vs guvf jnf zl svefg wbo,
    V cebonoyl jbhyqa'g unir gubhtug nalguvat jrveq vf unccravat,
    naq guvf vf abezny sbe na bayvar jbex.
    
    | znegvaoevfx326 : V jvyy tvir lbh fbzrguvat fvzcyr naq bcra fbhepr sbe lbhe svefg qnl 😄
    V gubhtug, znlor V jnf tbvat gb qrirybc bcra fbhepr nccf. Pbby vs gung'f gur pnfr.
    
    | znegvaoevfx326 :
    | Npghnyyl jr pna tb abj. Fbeel, sebz gur gvzr V jbxr hc gvyy abj guvf qnl jnf trggvat penmvre naq penmvre
    Jul gur fhqqra punatr bs zvaq? Gur jnl gurl betnavmr naq pbbeqvangr
    vf nyy bire gur cynpr, hacebsrffvbany vf gb chg vg zvyqyl.
    
    | znegvaoevfx326 : @ebanyq fgvyy jvgu hf?
    Jul rira nfx guvf dhrfgvba, jung n fgenatr guvat gb nfx.
    V jnf yvgrenyyl fgvyy gurer punggvat jvgu uvz,
    jul gur hetrapl? V cersre zl cebtenzzvat gvzr ghearq-onfrq,
    abg erny-gvzr.
    
    | ebanyq : Qb V chapu va abj?
    | ebanyq : Jung qb V jbex ba?
    | ebanyq : Fbeel, V srry yvxr V'z fgvyy zvffvat n ybg bs vasbezngvba
    | znegvaoevfx326 : Jryy V jnag gb gryy lbh gung, naq lrnu chapu va
    Ng gung cbvag, vg jnfa'g gur pybpx gung V jnagrq gb chapu.
    V oneryl xabj nalguvat lrg, naq V jnf tbvat gb fgneg jbex nyernql.
    Jung'f gur pbzcnal anzr ng yrnfg. Ubj nobhg na vagebqhpgvba?
    Jub'f vf guvf znegvao naljnl naq jurer'f gur obff?
    
    Znegvao gura fraqf n tvguho yvax
    uggcf://tvguho.pbz/chyychfu-vb/haqryrgr
    
    Gur pung jrag ba nf sbyybjf:
    
    | znegvaoevfx326 :
    | Cyrnfr pybar guvf cebwrpg (vs V hfr purpxbhg, gung'f gur fnzr guvat, whfg n yrsgbire sebz ernyyl byq gvzrf)
    | znegvaoevfx326 : Gura V jbhyq yvxr lbh gb znxr abgrf ba ubj fhoerqqvgf ner unaqyrq
    | ebanyq : bxnl
    | znegvaoevfx326 : va cnegvphyne jr nccrne gb or  unaqyvat qryrgrq gbcvpf yvxr urer : uggcf://haqryrgr.chyychfu.vb/e/VaqvnFcrnxf/
    | znegvaoevfx326 : ohg abg vs gur fhoerqqvg vf onaarq: uggcf://haqryrgr.chyychfu.vb/e/onaarqfhoerqqvgf
    | znegvaoevfx326 : rira guebhtu gurer vf qngn va gur ncv : uggcf://ncv.chyychfu.vb/erqqvg/frnepu/fhozvffvba/?fhoerqqvg=onaarqfhoerqqvgf
    | znegvaoevfx326 : fb jbex bhg jul naq yzx
    | znegvaoevfx326 : qba'g qb nal pbqvat lrg, whfg rkcynangvba jvgu pbqr yvaxf
    | ebanyq : fb jung'f gur rkcrpgrq orunivbhe urer? unaqyr gur gbcvpf vs gurl ner qryrgrq naq abg onaarq?
    | znegvaoevfx326 : lrf, vg fubhyq qvfcynl nyy gbcvpf, ohg svefg gnfx vf whfg gb svaq bhg jul vg qbrf gung naq rkcynva vg gb zr
    | znegvaoevfx326 : guvf vf gb znxr fher lbh unir n tbbq zragny cebsvyr bs jung'f unccravat
    | ebanyq : bxnl
    
    ---
    
    | znegvaoevfx326 :
    | Cyrnfr pybar guvf cebwrpg (vs V hfr purpxbhg, gung'f gur fnzr guvat, whfg n yrsgbire sebz ernyyl byq gvzrf)
    Haqrefgnaqnoyr, byqre snegf unq fhoirefvba va lr byqra gvzrf. Jnvg, V oevrsyl
    hfrq fhoirefvba gbb orsber...
    
    | znegvaoevfx326 : va cnegvphyne jr nccrne gb or unaqyvat qryrgrq gbcvpf yvxr urer : uggcf://haqryrgr.chyychfu.vb/e/VaqvnFcrnxf/
    | znegvaoevfx326 : ohg abg vs gur fhoerqqvg vf onaarq: uggcf://haqryrgr.chyychfu.vb/e/onaarqfhoerqqvgf
    | znegvaoevfx326 : rira guebhtu gurer vf qngn va gur ncv : uggcf://ncv.chyychfu.vb/erqqvg/frnepu/fhozvffvba/?fhoerqqvg=onaarqfhoerqqvgf
    | znegvaoevfx326 : fb jbex bhg jul naq yzx
    Jung qbrf znegvao zrna ol "unaqyvat" urer? Vf ur qrfpevovat n oht
    be nfxvat zr gb rkcynva ubj gur pbqr jbexf? Jung'f gur rkcrpgrq orunivbhe?
    
    Fb nsgre cbxvat nebhaq gur pbqronfr,
    jung znegvao zrnag urer vf gung gur guernqf ner cebcreyl fubjvat hc va gur vagresnpr
    sbe /e/VaqvnFcrnxf, ohg abguvat vf fubjvat hc va gur /e/onaarqfhoerqqvgf.
    Zl vagrecergngvba vf gung, ur'f nfxvat zr gb svaq bhg jul abguvat
    vf fubjvat hc ba /e/onaarqfhoerqqvg.
    
    Vs fb, jul pna'g ur whfg fnl gung, jul qbrf ur unir gb rkcerff gur ceboyrz/oht
    va n bofpher dhnfv-grpuavpny jnl. Znegvao pbhyq jevgr yrtvoyr ratyvfu orsber,
    jul qbrf ur fhqqrayl fgnegf fcrnxvat yvxr n qehax fghqrag RFY.
    Vg frrzf V'z whfg orvat crggl naq avgcvpxl, ohg V jnfa'g guvaxvat bs gurfr ng gung gvzr.
    V bayl unq gurfr gubhtugf abj va uvaqfvtug jura V ernyvmrq jung jnf tbvat ba.
    Ng gung gvzr, V jnf fgvyy zbfgyl pbashfrq.
    
    | znegvaoevfx326 : vg vf arneyl vzcbffvoyr gb qb n znwbe sbbxhc urer, ohg fgvyy, V qba'g jnag lbh cbxvat enaqbz punatrf va gur pbqr jvgu gur ubcr gung vg jbexf 😄
    (sbbxhc == shpx hc)
    Uhu? Fbaanxirgpu, jung'f gung fhccbfrq gb zrna? Gur zrffntr vgfrys vf naablvat rabhtu,
    ohg punxenz ernpgvat jvgu n fjrng_fzvyr rzbwv qryviref gur svany oybj.
    
    Vg jnf gura V ernyvmrq gurl'er ybbxvat qbja ba zr naq guvax V'z fghcvq.
    Zl fghcvq snpr, zl fghcvq dhrfgvbaf naq ubj V fghcvqyl fpenzoyrq qhevat
    gur pbqvat grfg. Gurl ubarfgyl guvax V'z whfg enaqbzyl znxvat punatrf
    va gur pbqr jvgubhg xabjvat jul naq zvenphybhfyl ubcr gung vg jbexf.
    Vs gung'f gur pnfr, gurer'f ab jnl V pbhyq rira unir svavfurq gur pbqvat grfg,
    yrg nybar unys bs vg.
    
    Naq zl uhapu jnf evtug nyy nybat. Gurfr thlf qba'g xabj fuvg, gurl ner
    hagenvarq cbfrhef ybbxvat sbe arjovrf gb cerl hcba. Gurl unq ab novyvgl
    bs pbeerpgyl nffrffvat gur pbqvat grfg erfhyg, bgure jurgure vg frrzf
    gb or jbexvat pbeerpgyl. Gb gurve rlrf, V jnf whfg enaqbzyl znxvat
    punatrf naq ubcvat vg jbexf. Gur shpx. Vs gurl pna npghnyyl pbzcrgragyl pbqr
    gurzfryirf, gurl jbhyq xabj rknpgyl jung V'z qbvat. Gb or snve, V
    znqr n ybg bs fghcvq zvfgnxrf ba gur pbqvat grfg, ohg gung
    vf rirel qvssrerag sebz "znxvat enaqbz punatrf".
    
    V jnf ernyyl cvffrq ng gung cbvag, ohg V cebprrqrq jvgu gur gnfx naljnl.
    V pna'g oryvrir V zvffrq zl qnvyl 4:00 CZ anc sbe guvf.
    
    Nsgre n fbzr cbxvat nebhaq, V erfcbafqrq jvgu:
    
    | ebanyq : Fb urer'f jul gur onaarq fhoerqqvg qbrfa'g fubj nalguvat:
    | Onfvpnyyl, gur bssvpvny  erqqvg uggcf://bnhgu.erqqvg.pbz/ncv jba'g erghea onaarq guernqf.
    
    | N erdhrfg gb uggcf://ncv.chyychfu.vb/erqqvg/frnepu/fhozvffvba/?fhoerqqvg=onaarqfhoerqqvgf&cntr=1 ergheaf 16 ragevrf.
    
    | Gur sebagraq gura gnxrf gur vq bs gubfr ragevrf, naq cnffrf gurz gb 
    | uggcf://bnhgu.erqqvg.pbz/ncv/vasb?vq=g3_rwd3vl,g3_rp7uyk,g3_pt6b81,g3_oszie5,g3_8rvfew,g3_81963k,g3_67f45q,g3_45ig89,g3_4579h0,g3_43ti2x,g3_438fp1,g3_41arw1,g3_41279y,g3_40t8rh,g3_3je88f,g3_3jumsr,g3_3zzlnr
    | ebanyq : Ohg erqqvg ergheaf 0 ragevrf, urapr, gur cntr fubjf oynax.
    
    | Abj vs gur dhrfgvba vf jul qbrfa'g erghea nalguvat onpx, V pna bayl thrff gung vg qbrfa'g erghea onaarq guernqf, orpnhfr jryy gurl'er hu onaarq. 
    
    | ebanyq :
    | >>>V qba'g jnag lbh cbxvat enaqbz punatrf va gur pbqr jvgu gur ubcr gung vg jbexf
    | Vs lbh ner ersreevat gb zl pbqvat grfg, V jnf va gvzr cerffher gung gvzr. Cyhf, gur punatrf ner pnyphyngrq abg enaqbz, vg'f n cebprff bs ryvzvangvba gb svaq juvpu bar juvpu yvar bs pbqr vf pnhfvat vg.
    | ebanyq : V xabj rknpgyl jung punatrf V'z qbvat. Zvyqyl bssraqvat erznex, gb or ubarfg.
    
    
    Znegvao erycvrq:
    
    | znegvaoevfx326 : cyrnfr nqq n pbqr yvaxf gb lbhe cbvagf 🙂
    Jung ner gurfr pbqr yvaxf ur xrrcf gnyxvat nobhg? (Ur'f npghnyyl ersreevat gb tvguho creznyvaxf)
    
    | znegvaoevfx326 : Lrf, jr jvyy arrq gb erfgehpgher pbqr sebz gur fbhaq bs gung (naq jung V erzrzore)
    Huu, qvq znegvao rira ernq be haqrefgnaq nal bs jung V jebgr. Gurer'f ab pbqr erfgehpghevat
    arrqrq, gur "oht" vf va erqqvg'f bssvpvny NCV vgfrys. Erfgehpghevat vf nobhg gur shegurerfg
    guvat gb fhttrfg onfrq ba jung V fnvq. V pbafvqrerq gur cbffvoyvgl gung znegvao unf orra
    hfvat YYZ gb genafyngr ratyvfu gb uvf angvir ynathntr, jungrire vg vf.
    
    | >>>ebanyq: Vs lbh ner ersreevat gb zl pbqvat grfg, V jnf va gvzr cerffher gung gvzr. Cyhf, gur punatrf ner pnyphyngrq abg enaqbz, vg'f n cebprff bs ryvzvangvba gb svaq juvpu bar juvpu yvar bs pbqr vf pnhfvat vg.
    | >>>ebanyq : V xabj rknpgyl jung punatrf V'z qbvat. Zvyqyl bssraqvat erznex, gb or ubarfg.
    | znegvaoevfx326 : Ab ab ab. Guvf vf whfg trareny cebwrpg znantrzrag, naq vg jnf yvtug-urnegrq, V graq gb penpx wbxrf yvxr gung. Lbh qvq irel jryy, orggre guna 80% 🙂
    Bxnl snve rabhtu, V srry fghcvq sbe orvat natel abj.
    
    Naq fb gur abafrafvpny pbairefngvba jvgu znegvao qenttrq ba,
    naq nf vg pbagvahrf gb qent ba, gur zber V'z pbaivaprq znegvao
    unf ab vqrn jung ur'f gnyxvat nobhg. Abguvat nobhg jung
    ur fnlf nqqf hc, naq fbzrgvzrf fnlf guvatf gung ner
    pbzcyrgryl veeryrinag be unf abguvat gb qb jvgu
    nalguvat. V gubhtug, znlor ur unf n onq qnl naq
    gverq fb ur'f hfvat gur grezvabybtvrf nyy jebat.
    V onqyl jnagrq gb oryvrir gung guvf vf n yrtvg,
    aba-fpnz wbo.
    
    
    | znegvaoevfx326 : Ohg, bar abgr, V jbhyq nccerpvngr vs lbh sbyybj gur vafgehpgvbaf ba lbhe svefg qnl, gurer jvyy or cyragl bs gvzr sbe lbhe bja vavgvngvir.
    Jryy, fbeel nobhg gung. Vg frrzf gung vg'f nofbyhgryl vzcrengvir gung V 
    nqq pbqr yvaxf gb zl rkcynangvbaf. Jul? Jul vf guvf rira arprffnel?
    V'z yvgrenyyl qvfphffvat vg nyernql jvgu znegvao jung gur
    ceboyrzf ner naq ubj gb svk gurz. Jul qb V arrq gb jevgr
    n sbezny qrfpevcgvba bs gur ceboyrz, pbzcyrgr jvgu pbqr yvaxf,
    nf vs V'z svyvat n chyy erdhrfg be oht ercbeg ba gurve orunys?
    Jnvg... Vf gung jung'f unccravat urer?
    
    | znegvaoevfx326 : @ebanyq ubj ner lbh qbvat? V jnfa'g rkcrpgvat guvf gb gnxr  guvf ybat 🙂 V arrq yvaxf gb eryrinag pbqr cynprf (gung lbh zragvbarq) fb jr pna qvfphff jung gb qb gurer
    Oerngu qbja ba zl arpx jvyy ln? V sryg n fhqqra ehfu bs
    nakvrgl naq fubfegarff bs oerngu nf V sbeprq zlfrys 
    vagb jevgvat gur cebkl oht ercbeg.
    V fher qba'g jnag gb qb guvf, abg jvgu n znyjner va gur onpxtebhaq,
    abg jura gurl'er gelvat gb ehfu zr ba gur pybpx.
    
    Fb V erfraq zl zl ercbeg jvgu gur pbqr yvaxf, naq V abgrq
    ng gur raq gung "Ab cbffvoyr svk be jbexnebhaq va zl zvaq __lrg__."
    
    | znegvaoevfx326 : Bx, cvat zr jura lbh ner ernql. Naq rirelguvat vf cbffvoyr 😄
    | znegvaoevfx326 : "guvf pnaabg or qbar" ner snzbhf ynfg jbeqf va fgbsgjner qri 🙂
    V arire fnvq gung vg'f abg cbffvoyr...
    Htu, V srry fb gverq, V pna'g oryvrir V jnfgrq qnlf sbe guvf.
    Gung ynfg zrffntr sebz znegvao pbaivaprq zr sbe fher
    gung ur'f n cubal. Ur xabjf cebtenzzvat grezf, naq ohg nofbyhgryl
    pna'g cebtenz uvf jnl bhg bs n cncreont gb fnir uvf yvsr.
    
    Naq vg nyy znxrf frafr abj. Gur jnl gurfr thlf ner npgvat,
    gur jnl gurl fnl guvatf, vg'f orpnhfr gurve ner vyyrtnyyl
    fhopbagenpgvat zr, ohg vafgrnq bs qvfpybfvat vg, gurl
    ner cergraqvat gurl ner qbvat nyy gur jbex naq gnxr
    perqvg sbe vg. Gurl ner cebonoyl cynaavat gb cnl zr
    n gval cbegvba bs jung url ner rneavat, vs gurl
    ner rira cynaavat gb cnl zr.
    ]];
}

entry {
    date="2024-05-14";
    time="11:03";
    tags={"hidden"};
    [[
    TODO:
    * check out fpt-software company that my mother keeps bugging me about
    * port nature of code 2 examples to love2d
    * read immersive algebra
    * https://community.coops.tech/t/people-looking-for-jobs/94
    ]];
}

entry {
    date="2024-05-17";
    time="15:35";
    tags={"ant"};
    [[
    Okay, I've done enough progress on the 
    ant project to the point it's useable now
    for playing around with squares, specifically
    for improving the algorithm. Funny, I still haven't
    implemented the langton's ant, but it should
    be trivial to add later on since I'm more or less
    done with preparatory stuffs. 
    
    And so, after some playing around, I managed to find
    a slight tweak in the algorithm to reduces the
    number of steps by more than half. But, I don't know yet
    if that change is correct, since I think 
    it's possible to "overstep" and skip over
    the proper solution.
    ]];
}

entry {
    date="2024-05-17";
    time="19:27";
    tags={"ant"; "math"};
    [[
    So I started creating triangles
    in increasing size. For instance,
    I have three triangles T1, T2, and T3.
    T1 has 10 dots in it, T2 has 15, and T3 21.
    
    ]]; CD [[
    | 10    15     21
    |              .
    |       .      ..                              
    | .     ..     ...                                              
    | ..    ...    ....                                              
    | ...   ....   .....                                              
    | ....  .....  ......                                              
    |  T1    T2     T3
    ]]; [[
    
    Playing around with it, it looks like
    that I could fit the triangles, that
    they can be combined and fit together
    to create a rectangle. So if I 
    have two T2 triangles, I could flip
    the other one and they would snuggly 
    fit together to form a rectangle.
    
    The more interesting part is that
    I could create squares by combining
    two consecutive triangles. For instance,
    combining T1 and T2 creates a square,
    and combining T2 and T3 also creates a square.
    By induction, this should hold for triangles
    of any size.
    
    I wonder what other shapes I can create from
    rectangles.
    
    Not sure how I could use this for factoring,
    but it's an interesting self-discovery.
    The question now is, given a square number,
    say, 196 = 14*14, how do I get
    the pair of two consecutive triangle numbers 
    that add up to it. Well, aside from recursion.
    
    Aha, wikipedia cheat to the rescue:
    
    ]]; CD [[
    T1 + T2 = [(14**2)/2 + 14/2] + [(14**2)/2 - 14/2]
    = 105 + 91
    = 196
    ]]; [[
    ]];
}

entry {
    date="2024-05-19";
    time="12:29";
    tags={"godot"; "gamedev"};
    title="gamedev courses";
    [[
    Someone in this thread https://slacker-news.fly.dev/item?id=40401343
    linked to a udemy course, then I noticed udemy
    currently is offerring more than 80% discount on some 
    courses. The discount offer expires in 4 days.
    I still have some cash with me from the crappy upwork jobs
    I did a while back, and I want to purchases one or two 
    courses.
    
    Why courses though, I can just read a book.
    True, for programming, math or anything text-based,
    articles/books are better for the most part.
    But for visual, realtime interactive stuffs, watching
    a video is way better. Things like gamedev, blender,
    photoshop, and video editing.
    
    What about youtube videos though? Yeah, youtube has tons
    of content, but it also has a lot of half-baked, low-effort
    or shallow videos that have terrible pedagogical quality.
    
    Still, I'm not sure udemy would be any better, but it's  
    worth a shot. At the very least, the content is professionally
    made. Also, udemy offers certificate of completion, so 
    I could use that too when job searching.
    
    That all said, I'm going to try godot courses, since
    I had no luck finding a comprehensive, good resource
    for doing godot developement. And maybe some dart+flutter
    courses.
    
    ]];
}

entry {
    title="";
    date="2024-00-00";
    time="00:00";
    tags={};
    [[
    ]];
}
