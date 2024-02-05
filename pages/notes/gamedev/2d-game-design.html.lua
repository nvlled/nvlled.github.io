PAGE_TITLE = "2D game design #1";
PAGE_DATE = "2023-03-09 15:48:46";

return LAYOUT {
  P [[
      Following up from ]] / A { href = "notes/getting-start-with-godot.tsx", "before" } / [[,
      here I will think of and design a simple 2D game, for purposes of applying what I just
      learned.
  ]],
  H1 "Requirements",
  P "To avoid overscoping, here are the constraints:",
  UL {
    LI "should be doable in one or two days",
    LI {
      "uses roughly the same game mechanic as the Dodge the creeps",
      --{footnote.c(
      --  "Dodge the creeps is the sample game that was created in the Godot documentation"
      --)}
      "but with some variations so it isn't just a mere clone",
    },
    LI "uses any random assets, free and preferrably shitty"
  },
  HR,
  H1 "Game mechanics",
  UL {
    LI "top-down movement",
    LI "uses a 2D camera for a larger map",
    LI "creeps/monsters follows players non-linearly",
    LI "player can fire a projectile in 8 directions",
    LI "player and creeps can move in 8 directions",
  },
  HR,
  H1 "Backstory",
  P [[
      To make things more interesting, I will come up with a story. For what,
      you say? Stories help drive the motivations and goals of the main
      character, which in turn shapes what the game mechanics will be.
    ]],
  P "It goes something like this ...",
  P "In short, waifus.",
  P [[
      It's the year 20XX, climate have drastically changed and the sea level
      significantly rose, resulting to more than 35% of the land being sunk
      under the sea. Due to decreased available land, crop yields dropped and
      population experienced hunger throughout. World economy is at the tipping
      point. In these times of crisis, people closed their bloodteared eyes from
      the bitter truth, and immersed themselves in escapism and fantasies.

  ]],
  P [[

      It's the year 20XX + 1, everyone is now a weeb. To be divorced from a
      waifu is equivalent to having no soul and purpose in life. Waifuism
      restored world order: people are free from worldy troubles and anxiety.
    ]],
  P [[

      World population stabilized, neither decreasing or increasing. Procreation
      is mandated, often forced, by law for the healthy younger population.
      Crime-rate dropped almost to zero, police and soldiers went out of work.
      Military budget was cut, and was instead allocated on better
      infrastructure and more funding on local enterprises.
    ]],
  P "Humanity overcame hardship and suffering. Is this the happy ending?",
  P [[
      It's the year 20XX + N. A new breed of mankind surfaced from the very
      depths of the society. Peace once again was threatened. Order was
      destabilized. This subset of population was then referred to as the
      destabilized generation, or the d-gens.

    ]],
  P [[
      Waifus are considered natural wonders of the world, they are ruled by law
      not be owned by any person or legal entities. They are spiritual treasures
      that aren't owned by anyone, but at the same time are possessed by every
      heart of living human being.

    ]],
  P [[
      The d-gens rejects this idea of omnipresent love. The d-gens states that
      treasures are meant to be claimed and owned by rightful owners. They want
      to claim the waifus for themselves and deprive everyone else of their
      blessings. D-gen were relentless as there were no police or military to
      stop them.

    ]],
  P [[
      D-gens' primary operation is to kidnap waifus, and lock up in their own
      altar basement, where they will worship and adore their beloved waifu all
      for themselves.
    ]],
  P [[
      This is where the player, steps in. As the part of the secret force that
      vows to re-stabilize the society once again, your goal is to defeat the
      d-gens and save the waifus entrapped from the weird altars, and bring them
      back safely to their homes.
    ]],
  HR,
  P [[
      Uh... that backstory came out weird. Oh well, who cares, at least it
      establishes the premises clearly, and I have a good idea what shitty game
      to make.
    ]]
}
