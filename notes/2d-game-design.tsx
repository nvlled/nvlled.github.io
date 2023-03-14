import { PageData, PageRender } from "cita";
import { createFootnoter, HR, Layout, Post, PostLayout } from "components";
import { pagePath } from "../gen_sitemap.ts";

export const data: PageData = {
  title: "2D game design",
  created: "2023-03-09 15:48:46",
};

export const render: PageRender = () => {
  const footnote = createFootnoter();
  return (
    <PostLayout data={data}>
      Following up from{" "}
      <a href={pagePath("notes/getting-start-with-godot")}>before</a>, here I
      will think of and design a simple 2D game, for purposes of applying what I
      just learned.
      <Post.BR />
      <Post.Header>Requirements</Post.Header>
      To avoid overscoping, here are the constraints:
      <ul>
        <li>should be doable in one or two days</li>
        <li>
          uses roughly the same game mechanic as the Dodge the creeps
          {footnote.C(
            "Dodge the creeps is the sample game that was created in the Godot documentation"
          )}
          , <br />
          but with some variations so it isn't just a mere clone
        </li>
        <li>uses any random assets, free and preferrably shitty</li>
      </ul>
      <HR />
      <Post.Header>Game mechanics</Post.Header>
      <ul>
        <li>top-down movement</li>
        <li>uses a 2D camera for a larger map</li>
        <li>creeps/monsters follows players non-linearly</li>
        <li>player can fire a projectile in 8 directions</li>
        <li>player and creeps can move in 8 directions</li>
      </ul>
      <HR />
      <Post.Header>Backstory</Post.Header>
      To make things more interesting, I will come up with a story. For what,
      you say? Stories help drive the motivations and goals of the main
      character, which in turn shapes what the game mechanics will be.
      <Post.BR />
      It goes something like this...
      <Post.BR />
      It's the year 20XX, climate have drastically changed and the sea level
      significantly rose, resulting to more than 35% of the land being sunk
      under the sea. Due to decreased available land, crop yields dropped and
      population experienced hunger throughout. World economy is at the tipping
      point. In these times of crisis, people closed their bloodteared eyes from
      the bitter truth, and immersed themselves in escapism and fantasies.
      <Post.BR />
      In short, waifus.
      <Post.BR />
      God is dead, people no longer read bibles. Religion is nothing but an
      antiquated practice of dating back medieval times. Waifuism is the
      neo-religion. To have a waifu is to overcome material suffering, and
      transcend higher state of being by means of religious fixation on waifus.
      To love and be loved by a waifu amounts to experiencing happiness that is
      no longer sated by vapid physical relationships, which has been reduced to
      nothing but coordinated meatgrinding and moaning.
      <Post.BR />
      It's the year 20XX + 1, everyone is now a weeb. To be divorced from a
      waifu is equivalent to having no soul and purpose in life. Waifuism
      restored world order: people are free from worldy troubles and anxiety.
      <Post.BR />
      World population stabilized, neither decreasing or increasing. Procreation
      is mandated, often forced, by law for the healthy younger population.
      Crime-rate dropped almost to zero, police and soldiers went out of work.
      Military budget was cut, and was instead allocated on better
      infrastructure and more funding on local enterprises.
      <Post.BR />
      Humanity overcame hardship and suffering. Is this the happy ending?
      <Post.BR />
      It's the year 20XX + N. A new breed of mankind surfaced from the very
      depths of the society. Peace once again was threatened. Order was
      destabilized. This subset of population was then referred to as the
      destabilized generation, or the d-gens.
      <Post.BR />
      Waifus are considered natural wonders of the world, they are ruled by law
      not be owned by any person or legal entities. They are spiritual treasures
      that aren't owned by anyone, but at the same time are possessed by every
      heart of living human being.
      <Post.BR />
      The d-gens rejects this idea of omnipresent love. The d-gens states that
      treasures are meant to be claimed and owned by rightful owners. They want
      to claim the waifus for themselves and deprive everyone else of their
      blessings. D-gen were relentless as there were no police or military to
      stop them.
      <Post.BR />
      D-gens' primary operation is to kidnap waifus, and lock up in their own
      altar basement, where they will worship and adore their beloved waifu all
      for themselves.
      <Post.BR />
      This is where the player, steps in. As the part of the secret force that
      vows to re-stabilize the society once again, your goal is to defeat the
      d-gens and save the waifus entrapped from the weird altars, and bring them
      back safely to their homes.
      <HR />
      Uh... that backstory came out weird. Oh well, who cares, at least it
      establishes the premises clearly, and I have a good idea what shitty game
      to make.
      <Post.BR />
      <HR />
      <Post.Header>Other notes</Post.Header>
      None yet.
      <HR />
      {footnote.render()}
    </PostLayout>
  );
};
