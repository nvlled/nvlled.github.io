PAGE_TITLE = "Habit builder";
PAGE_DATE = "2023-04-25 16:10:03";

return LAYOUT {
  H1 "First product idea: catchsup",
  H2 "Context",
  P [[
    I found a book called "Tiny Habits" by B.J. Fogg. As the title suggests,
    it's about overcoming the lack of discipline and motitation by means of
    tiny habits. I couldn't bring myself to finish it and read it thoroughly,
    because I actually don't like how it started like one big marketing
    pamphlet, promising how it could change my life. That doesn't mean the
    message is invalid, just I don't like how it's written. I do think the
    idea of tiny habits has a truth in it, based on my own assessment. I've
    also read some comments online vetting for it's effectiveness, not the
    book necessarily, but the practice of tiny habits.
  ]],
  H1 "Problem",
  P [[
    I'm a wreck, I have no motivation and no discipline, but I want I learn
    things or do more creative work. ]],

  H2 "Solution",
  P [[A software tool that helps me builds habit.]],

  H2 "Who is this for?",
  P [[
    Primarily for hobbyists and autodidacts that find it hard to allocate some
    time for personal pursuits. ]],

  H2 "Workflow",
  P "Basically, it goes something like this:",

  OL {
    LI "The app asks what do I want to learn or achieve",
    LI 'I put "I want to be a potato"',
    LI [[
      Then the app prompts what ideal time to practice being a potato. The
      choices would be: each morning, afternoon or evening. Day time practice
      takes priority and should be preferred to increase chances of being
      done. I put "each morning". ]],
    LI [[
      The app confirms my deliberation on my journey to become a one true
      potato. ]],
    LI [[
      On the following morning, my mind goes on full autopilot to browse
      HN/reddit and watch youtube while anxiously sipping a boiling cup of
      sugarless coffee and nibbling on some deep fried bananas. ]],
    LI [[
      The app, on it's own, slaps me in the metaphorical face, by playing an
      annoying sound or spamming with notifications, or by vibrating loudly
      like yo mama's secret lawnmower. The app would go like "Bro, what about
      your dreams of being the one true potato bro". ]],
    LI [[
      In my mind, "Oh yeah, that, maybe later.", and proceed wasting my life
      anyways. ]],
    LI [[
      The sound and notifications became unbearable, so I bring the malware to
      foregroud so I could close it and purge it from this universe. ]],
    LI [[
      The app then gives encourages my dream, "You got this bro". So despite
      my overwhelming resitance,
      I resigned to my fate, and try it anyways. ]],
    LI [[
      On the app, it shows the list of habits I want to build. I select the
      option "I want to be a potato", and press a button to confirm. ]],
    LI [[
      The app now goes silent, and indicates that I'm now ready to proceed.
      There's is no option to stop. The app also doesn't show a timer. It just
      shows something like a spinner. The app reminds me that it's only about
      15 minutes. The app also shows some random quotes that low-key gaslights
      me into action. I say to myself, what the heck, I might as well try it. ]],
    LI [[
      I begin my patatamorphosis through half-meditation, emptying my mind of
      any human concerns as I gaze blankly into the sky. In a immobile state,
      I chemosynthesize the particles in the air that mostly consists of urban
      pollution. ]],
    LI [[
      Before I realized it, 15 minutes was over, and the app shows a single
      notification and a non-disruptive sound to let me know. ]],
    LI [[
      I thought 15 minutes was too short, and I was just getting started,
      maybe I could extend a bit. But there was no option or button to extend
      time. The app politely reminded that "Tiny habits bro, baby steps bro.
      You've done well enough for the day. Good job. Now go look at anime tits
      or something as a reward. Bro" ]],
    LI [[
      I think to myself, fair enough, don't want speedrun myself to giving up
      sooner. The app would gradually and automatically adjust the duration
      length. For instance, if I skip practice for several days, the duration
      gradually decreases back to 15 minutes. But I consistently practice each
      day, the duration gradually increases to set maximum duration. ]],
    LI [[
      The following morning, there's still some mental resistance, but I
      proceeded to practice anyways without complaints. ]],
    LI [[
      Day 30, I do patatamorphosize automatically, even without the app
      telling me to. ]],
    LI "Day 300, am true potato.",
  },

  H2 "Discussion",
  PP [[
    The essential parts of a tiny habit are prompt, action, and reward. The
    prompt is like a trigger that primes the user to immediately get into the
    mindset, and is shown or played before each practice. Maybe use a
    different sound or message for each goal. Not sure if this would have
    practical effects, but hey, I think the prompt-action-reward cycle is
    basically how people train animals.

    The action is what the user does during the session. THis could be reading
    a book, watching a tutorial, playing an instrument, drawing something,
    etc. What's preventing the user though from not doing anything? Nothing,
    the app isn't some fulltime nanny. The user has to do his own part. The
    app is just there to get one leg ahead, the user has to lift the other
    leg.

    Finally, the reward, which for now just a motivational message and some
    sound. In the future, I might allow the user to configure this to do some
    other things, like play video, show an image, or order a pizza
    automatically. Again, I'm not sure if this would have any material
    effects, but I just have to take Fogg's word for it.

    I should list the most absolutely essential app features and functions,
    the bare minimum to get started testing it daily. If I work at leisurely,
    non-stressful pace, would the week be enough to get an MVP working? What
    techstack would I use? Ideally, something that can export to PC and mobile
    (I want to test on phone too). Adding user settings does make thing more
    complex, so avoid doing this unless it's essential part of the app. What
    about syncing between phone and PC?

    An attentive reader might notice the similarities to the pomodoro
    technique, and indeed they are almost alike, with the key difference is
    the intent of how they used. Pomodoro is to help with short-term tasks
    that are difficult to start or maintain attention with. I could say that
    catchsup is just long-term pomodoro for creating habits, plus with some
    wisdom & blessings of B.Fogg. What about scheduling though? What if I want
    to build several habits at the same time. Say, I want to
  ]],

  OL {
    LI "learn how to sketch",
    LI "read one specific book",
    LI "learn to use blender",
  },

  PP [[
    I'll do (1) and (2) every morning, and optionally do (3) in the evening.

    What if a practice is due but I have more important things to do? What if
    there are times I randomly just want to do practice? Well, I guess that's
    good because the habit is starting to form. But how would the app cover
    that case? It doesn't, the important part is I allocate a bare minimum of
    time for each practice. It doesn't matter if I want to do some more, as
    long I meet the minimum.

    Suppose, I start the day, and log in on my laptop. I am prompted to either
    sketch or read a book. I chose sketch. After 15 minutes, I get notified
    but I feel like doing a bit more, so I extend. I can extend up to set
    maximum allocated time. I only do this for up to 30 minutes, and the press
    done. I hear the done sound, and some shitty supposed-to-be inspirational
    quote.

    Huh, I'm not really seeing it though. I'm thinking of imposing some strict
    rules to make it more effective, but that may just backfire when it comes
    to useability.

    Keep it simple. In the end, what do I want for a habit building app? I
    want to be reminded and prompt for action for certains times of the day.
    If I want to extend or do it later on, I could do that, but the app
    doesn't have to know about that.

    I don't know, I feel like it doesn't have a very good grounding as a
    useable product. This might be a flop. I just can't get a good coherent
    vision of it. Maybe I should put this aside for now, and go with the next
    idea.

    Oh well, I'm overthinking it. Just implement it, it's not that hard. It
    seems like a terrible idea, but at least I have to try it first.
    ]] / HR / [[
    Okay, after some fumbling, I think maybe a simple spaced frequency makes
    more sense? Like, I want to do goal A every day in the evening. For goal
    B, I want to do it once a week on morning. For goal C, twice a month. Then
    add an option to automatically adjust the spacing for each training done
    or skipped. Skipped happens when a a day has passed since the scheduled
    training. Yeah, this will work. At least this is easier to implement too. ]],

  H1 "Further discussion after initial/partial implementation",

  H2 "Behaviour and specifications",
  PP [[None]],

  H2 "Techstack",
  PP [[
    I was thinking of just using tauri or electron, and avoid any stack that I
    have to learn how to use. I'm considering using godot though since I've
    already spent a month learning it.

    I tried C# and gtksharp, but I didn't get very far. For one, glade was
    easily the most tedious RAD tool I've used. It's also no longer
    maintained. I would be better off not using glade. It also has bugs where
    the designer view is different from the actual view when the program is
    run.

    For now, I'm just going to use neutralinojs instead. It has all I need,
    and it cross-compiles binaries for windows, mac and linux. Good enough for
    an MVP.

    Also, I wanted to try out SolidJS, but after reading the tutorial, I
    realized that it has its fair share of footguns to look out for.
    Specifically, I hate how there are special rules and functions for
    handling props, otherwise it breaks reactivity. Then there's the solidjs
    store, which seems to have an weird or untuitive API. I haven't finished
    going through the tutorial, but I feel like there are more gotchas
    lurking. Maybe solidjs is better than react, but right now I don't have
    the time to learn all the gotchas.

    I wasn't really sure if investing that time for a new framework is worth
    it, if only for performance purposes.

    It's funny right after saying that I will stick to a techstack I already,
    I impulsive tried some new shiny old stuffs to play with.

    I could have just used wailsjs or ebiten... ]],

  H2 "Terms and definitions",
  UL {
    LI "Objective",
    LI "Training",
  },

  H2 "Limitations and scope",
  UL {
    LI "it's not a time tracker ",
    LI "it's not a tool to use for every tasks ",
    LI "it's not a task manager",
  },

  H2 "User-configurable settings",
  H3 "Per goal settings",
  UL {
    LI "sound to remind the user",
    LI "message and sound before starting (prompt)",
    LI "sound to notify when session has ended",
    LI "message and sound when the practice is done (reward)",
    LI "max duration for each session",
    LI "time to practice ",
  },

  H2 "Doubts and criticisms",
  OL {
    LI [[
      Do I really an app for this? Sure, why not, if people are fine with a
      pomodoro app, why not this? ]],

    LI [[
      Aren't there tons of apps like this already? Probably, but I haven't
      heard about them so the market may not yet be saturated. ]],

    LI [[
      But surely there are already apps that covers the use case of building
      tiny habits? Not only that they exist, but the task management app
      market is super saturated. The problem with those apps is that they are
      huge, and try to cover all use cases even mildly related to tasks
      management. Having all these fancy features clutters the mind and
      negates the efficacy of building a habit. ]],
  },

  H2 "Sync PC and phone data",
  PP [[
    I won't be implementing this any time soon, but just a thought. There
    would some option like "Freeze and export data" where the app would be not
    available for use until data is imported back. Then the data is imported.
    to elsewhere, like phone. Then reverse the process when done. But why?
    Because synchronizing needs a server, and a reliable connection for each
    device. Alternatively, the PC app can show a QR code, and let the phone
    scan it to synchronize with the PC. PC and phone must be one same local
    network.
  ]]
}
