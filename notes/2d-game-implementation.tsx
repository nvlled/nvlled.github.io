import { PageData, PageRender } from "cita";
import { HR, Layout, Post, PostLayout } from "components";
import { pagePath } from "../gen_sitemap.ts";

export const data: PageData = {
  title: "2D game implementation",
  created: "2023-03-10 19:00:00",
};

export const render: PageRender = () => {
  return (
    <PostLayout data={data}>
      <a href={pagePath("notes/2d-game-design")}>Yesterday</a>, I started with
      some plan on what to make, and ended up with some weird backstory. I went
      on with it anyways because the specifics are not that important.
      <Post.BR />I said I would do this in a day or two, but after starting with
      a blank Godot project, I was promptly flooded with questions as I stare
      blankly at the empty scene.
      <Post.BR />
      Questions like:
      <ul>
        {[
          "How do I do this thing again?",
          "Why did the tutorial used Area2D on the other root node, but a RigidBody2D on the other?",
          "I don't know how to make the view follow the player, do I use Camera2D or just code it myself?",
          "Camera2D seems to be working, but I need to add a background so I would know it's moving on the ground. How do I do that again?",
          "Well actually, I want to use TileMap instead because using one gigantic image for a possibly large level would be quite wasteful or ugly.",
          "TileSets, TileMaps, Terrains, Layers, Collision Masks, wait what?",
        ].map((e) => (
          <li>{e}</li>
        ))}
      </ul>
      <Post.BR />
      And it goes on. I started to doubt myself if I'm even ready to make games
      and I go deeper in the documentation. There was clearly still a lot to
      learn, what I learned to do in the <em>Getting started</em> chapter was
      just the tip of the iceberg. I clearly need to do some further reading if
      I want do something even slightly more complex than what the tutorial
      spoonfed to me.
      <Post.BR />
      At times, I felt the manual part of official documentation was just a
      massive infodump, and lacks specific directions and examples. Which is
      fine as a reference, but when I'm just starting out, it doesn't really
      help when I don't know what I'm doing yet.
      <Post.BR />
      With that, I considered just looking up a community-made tutorial since
      Godot's documentation is lacking further tutorials beyond the basic games.
      <Post.BR />
      And so I did. But then, it's mostly just video tutorials, and the lot of
      them are disorganized porridge of diverse topics. I hate youtube playlists
      sometimes, their reason for existence was lost to maximing user
      engagement. The worst part, the videos are pretty dated, since updating
      videos aren't as simple as updating text documents.
      <Post.BR />
      I'm hesitant to go over a full tutorial series like{" "}
      <a href="https://www.youtube.com/watch?v=mAbG8Oi-SvQ&list=PL9FzW-m48fn2SlrW0KoLT4n5egNdX-W9a&ab_channel=HeartBeast">
        Make an Action RPG in Godot
      </a>
      . On one hand, I would surely learn a lot from it. On the other hand, it
      would be a slog to go through a 12 hour video tutorial series. I will go
      back into it in the future when I decide to make RPG-like games, but for
      now, I just want something slightly more complicated than the Dodge the
      Creeps.
      <Post.BR />I don't know how many video tutorials I have watch before I
      could do the bare minimum of what I wanted, hopefully not a lot. For
      starters, I will go with this{" "}
      <a href="https://www.youtube.com/watch?v=HDf4EXQtumk&ab_channel=Chevifier">
        tutorial
      </a>{" "}
      on TileMaps. Or not, that was actually not a very good tutorial. It's more
      of a feature walkthrough than a specific tutorial how to do something.
      <Post.BR />
      Maybe this{" "}
      <a href="https://www.youtube.com/watch?v=Luf2Kr5s3BM&ab_channel=Chris%27Tutorials">
        one
      </a>
      . Okay, that was actually a pretty decent tutorial on how to get started
      with making top-down 2D games.
      <HR />
      To recap, the problem I had was that the player wasn't colliding with the
      tiles with physics layer. The tutorial used a CharacterBody2D for
      collisions. I was expecting to see how to do manual or more control on
      collisions, and the tutorial didn't go over that.
      <Post.BR />
      In the end, I just ended up reading more documentation. The answer I was
      looking for was in the Physics section. The tutorial still did help me
      navigate the uncertainties I had. CharacterBody2D covers my need for now.
    </PostLayout>
  );
};
