PAGE_TITLE = "2D game progress";
PAGE_DATE = "2023-03-14 12:06:19";


return LAYOUT {
  P [[Tadah, after an extended period of i-have-idea-what-im-doing game
      development, I finally managed to ]] / S 'puke' / [[ create something:
   ]],

  IMG { src = "/notes/images/dgen.gif" },
  P [[
      And it's barely even a game. And it looks like shit. But, it's a good
      start, I think? That sure took way more effort that I expected. For the
      temporary(?) art, I used ]]
  / A { href = "https://sanderfrenken.github.io/Universal-LPC-Spritesheet-Character-Generator/",
    "LPC spritesheet generator" }
  / " for the ugly looking player goblin, and the "
  / A { href = "https://cupnooble.itch.io/sprout-lands-asset-pack?download", "this one" }
  / " for the tilemap."
  ,


  P "The following are my rough recollections of some minor issues I had.",

  H1 "Tile mapping",
  P [[
      Tilemap editing workflow isn't as efficient as I expected. To be clear,
      it's way more efficient compared to manually doing it by code on a plain
      text file. But it's still rough around the edges, and still have to do a
      lot of manual work to do the bare minimum. Maybe I'm still just getting
      used to it, until I just do it automatically without thinking about it.
  ]],

  H1 "State transitions and Coroutines",
  P [[
    I tried a coroutine-like approach
    first for state transitions using ,, but it
    turned about to behave unpredictably. For now, I just used objects to
    represent state, transitions are done by swapping out these objects. A
    little verbose, but oh well.
  ]],
  H1 [[Synchronizing animations]],
  P [[
      In the gif above, the spritesheet I used has quite a delay from start
      animation until the part where it's about to fire the arrow. So from the
      input event, I can't just spawn the banana immediately, it has to wait for
      a bit until the right animation frame, otherwise it wouldn'T look right.
    ]],

  P [[
      One way to solve this is to just hardcode the delay. The problem with this
      is that I have to update this delay everytime I change the art or the FPS
      of each animation.
    ]],
  P [[
      Maybe there's a better way to do this so that the art is perfectly
      synchronized with the player state automatically? Maybe, but I'm not going
      to spend the next week thinking about it. This is gamedev, shit code with
      results is better than theoretically elegant code that was abandoned.
    ]],
  P [[
      So yeah, fuck it, I'll just hardcode some values to make the art
      synchronized with state. But instead of delay, I just hardcode the frame
      index, which is slightly better than the delay, but still would break if I
      change the art later on.
    ]],
  HR,
  H1 [[Additions/Revisions to game design]],
  P [[
      On a whim, I used bananas as the projectile of the crossbow. While
      playtesting, I thought maybe I could just create some shitty farm-themed
      game instead, where humans invade the player goblin's thriving farm
      because he failed to secure a legal permit, and because he's too ugly to
      be left alive. Wait, I hear another backstory coming in...
    ]],
  H1 [[Backstory 2]],
  P [[
      The player plays as the goblin who was vanished from his own kingdom.
      After travelling aimlessly, he found an abandoned ranch where he settled
      down. After a while, he made a place for himself. He restored the farm, he
      fixed the fences, tilled the soil, and planted crops and trees.
    ]],
  P [[
      The villagers took notice of the ranch that mysteriously came back to
      life. Without restraint, they pillaged the crops, and hunted the animals
      for each their own necessities.
    ]],
  P [[
      Seeing his life once again desperately holding on to a thin thread of
      fate, this time the goblin chose to assert himself and defend what's
      important to him. The goblin fought back and attacked the villagers. So
      the story goes, and the war beings...!?
    ]],
  H1 [[Farm defence mechanics]],
  UL {
    LI [[Villagers attack during the day]],
    LI [[Trees and plants produces fruits]],
    LI [[The player will pick this fruits and use them as bullets]],
    LI [[
        Other things that can also be used as bullets: chickens, cows, wounded
        villagers
      ]],
    LI [[Invaders drop loots: seed, food, gold]],
    LI [[The player must defend the farm from villagers]],
    LI [[The gold can be used to bribe the villagers away for a day.]],
    LI [[
        The villagers can attack the player, the plants, trees, and your house.
      ]],
    LI [[The game ends when the player dies or the house goes down.]],
    LI [[Player has limited inventory/slots for projectiles.]],
    LI [[
        One level only for now, fixed map layout, with increasing waves of
        difficulty
      ]],
    LI [[
        To make things PG, the villagers don't die. They just flee in the forest
        when they take enough damage.
      ]],
  },
  BR,
  H1 [[Village assault mechanics]],
  UL {
    LI [[Night-time is for rest, farming or village assault]],
    LI [[
        Night-time is for break-time. It's designed for players like me who has
        difficult time playing intensively at long intervals. The assault for
        instance
      ]],
    LI [[Farming mechanics is only available at night.]],
    LI [[The player must plant the seeds]],
    LI [[The player must water the plants to keep them alive]],
  },
  H1 [[Other notes]],
  UL {
    LI [[day-night cycle should be longer (maybe 30min)]],
  },
  HR,
  P [[
      This may seem like I'm biting more than I can chew and scope, but for now
      I only plan on doing the farm defence first, iteratively adding each game
      mechanic so that the game is always in a playable state. If I lost
      interest midway because it became too tedious to continue or the game
      turned out to be not fun, then at least there was a tangible result in the
      end, and I can just quit anytime and move on to something else.
    ]],
}
