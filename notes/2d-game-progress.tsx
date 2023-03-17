import { PageData, PageRender } from "cita";
import { HR, Layout, Post, PostLayout } from "components";
import { codeBlock } from "../syntax_highlighter.tsx";

export const data: PageData = {
  title: "2D game progress",
  created: "2023-03-14 12:06:19",
};

export const render: PageRender = () => {
  return (
    <PostLayout data={data}>
      Tadah, after an extended period of i-have-idea-what-im-doing game
      development, I finally managed to <s>puke</s> create something:
      <img src="/assets/notes/dgen.gif" />
      <Post.BR />
      And it's barely even a game. And it looks like shit. But, it's a good
      start, I think? That sure took way more effort that I expected. For the
      temporary(?) art, I used{" "}
      <a href="https://sanderfrenken.github.io/Universal-LPC-Spritesheet-Character-Generator/">
        LPC spritesheet generator
      </a>{" "}
      for the ugly looking player goblin, and the{" "}
      <a href="https://cupnooble.itch.io/sprout-lands-asset-pack?download">
        this one
      </a>{" "}
      for the tilemap.
      <Post.BR />
      The following are my rough recollections of some minor issues I had.
      <Post.BR />
      <Post.Header>Tile mapping</Post.Header>
      Tilemap editing workflow isn't as efficient as I expected. To be clear,
      it's way more efficient compared to manually doing it by code on a plain
      text file. But it's still rough around the edges, and still have to do a
      lot of manual work to do the bare minimum. Maybe I'm still just getting
      used to it, until I just do it automatically without thinking about it.
      <Post.BR />
      <Post.Header>State transitions and Coroutines</Post.Header>I tried a
      coroutine-like approach first for state transitions using{" "}
      <code>await ToSignal(...)</code>, but it turned about to behave
      unpredictably. For now, I just used objects to represent state,
      transitions are done by swapping out these objects. A little verbose, but
      oh well.
      <Post.BR />
      <Post.Header>Synchronizing animations</Post.Header>
      In the gif above, the spritesheet I used has quite a delay from start
      animation until the part where it's about to fire the arrow. So from the
      input event, I can't just spawn the banana immediately, it has to wait for
      a bit until the right animation frame, otherwise it wouldn'T look right.
      <Post.BR />
      One way to solve this is to just hardcode the delay. The problem with this
      is that I have to update this delay everytime I change the art or the FPS
      of each animation.
      <Post.BR />
      Maybe there's a better way to do this so that the art is perfectly
      synchronized with the player state automatically? Maybe, but I'm not going
      to spend the next week thinking about it. This is gamedev, shit code with
      results is better than theoretically elegant code that was abandoned.
      <Post.BR />
      So yeah, fuck it, I'll just hardcode some values to make the art
      synchronized with state. But instead of delay, I just hardcode the frame
      index, which is slightly better than the delay, but still would break if I
      change the art later on.
      <HR />
      <Post.BR />
      <Post.Header>Additions/Revisions to game design</Post.Header>
      On a whim, I used bananas as the projectile of the crossbow. While
      playtesting, I thought maybe I could just create some shitty farm-themed
      game instead, where humans invade the player goblin's thriving farm
      because he failed to secure a legal permit, and because he's too ugly to
      be left alive. Wait, I hear another backstory coming in...
      <Post.BR />
      <Post.Header>Backstory 2</Post.Header>
      The player plays as the goblin who was vanished from his own kingdom.
      After travelling aimlessly, he found an abandoned ranch where he settled
      down. After a while, he made a place for himself. He restored the farm, he
      fixed the fences, tilled the soil, and planted crops and trees.
      <Post.BR />
      The villagers took notice of the ranch that mysteriously came back to
      life. Without restraint, they pillaged the crops, and hunted the animals
      for each their own necessities.
      <Post.BR />
      Seeing his life once again desperately holding on to a thin thread of
      fate, this time the goblin chose to assert himself and defend what's
      important to him. The goblin fought back and attacked the villagers. So
      the story goes, and the war beings...!?
      <Post.BR />
      <Post.Header>Farm defence mechanics</Post.Header>
      <ul>
        <li>Villagers attack during the day</li>
        <li>Trees and plants produces fruits</li>
        <li>The player will pick this fruits and use them as bullets</li>
        <li>
          Other things that can also be used as bullets: chickens, cows, wounded
          villagers
        </li>
        <li>Invaders drop loots: seed, food, gold</li>
        <li>The player must defend the farm from villagers</li>
        <li>The gold can be used to bribe the villagers away for a day.</li>
        <li>
          The villagers can attack the player, the plants, trees, and your
          house.
        </li>
        <li>The game ends when the player dies or the house goes down.</li>
        <li>Player has limited inventory/slots for projectiles.</li>
        <li>
          One level only for now, fixed map layout, with increasing waves of
          difficulty
        </li>
        <li>
          To make things PG, the villagers don't die. They just flee in the
          forest when they take enough damage.
        </li>
      </ul>
      <Post.BR />
      <Post.Header>Village assault mechanics</Post.Header>
      <ul>
        <li>Night-time is for rest, farming or village assault</li>
        <li>
          Night-time is for break-time. It's designed for players like me who
          has difficult time playing intensively at long intervals. The assault
          for instance
        </li>
        <li>Farming mechanics is only available at night.</li>
        <li>The player must plant the seeds</li>
        <li>The player must water the plants to keep them alive</li>
      </ul>
      <Post.Header>Other notes</Post.Header>
      <ul>
        <li>day-night cycle should be longer (maybe 30min)</li>
      </ul>
      <HR />
      This may seem like I'm biting more than I can chew and scope, but for now
      I only plan on doing the farm defence first, iteratively adding each game
      mechanic so that the game is always in a playable state. If I lost
      interest midway because it became too tedious to continue or the game
      turned out to be not fun, then at least there was a tangible result in the
      end, and I can just quit anytime and move on to something else.
      <HR />
      TODO:
      <ul>
        <li>go over https://www.gdquest.com/tutorial/godot/2d</li>
        <li>try coroutines again with scenetree.signalname.processframe</li>
        <li>
          trees and houses nodes
          <ul>
            <li>
              read
              https://docs.godotengine.org/en/stable/tutorials/2d/particle_systems_2d.html
            </li>
            <li>house cracks and fires</li>
            <li>house debris after it's destroyed</li>
            <li>tree fires</li>
          </ul>
        </li>
        <li>inventory, show in HUD one row of items on the bottom</li>
        <li>
          manually create separate nodes for each bullets/items, since they will
          have each their own collision shape, health and damage.
        </li>
        <li>Show current projectile to fire in the players head</li>
        <li>loot pickup</li>
        <li>villager nodes</li>
        <li>
          basic farm map, should have at least: trees, one house, some plants
          also some animals
        </li>
        <li>pathfinding and simple AI for villagers and animals</li>
      </ul>
    </PostLayout>
  );
};
