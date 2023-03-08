import { PageData, PageRender } from "cita";
import { pageDir, sitemap } from "../../gen_sitemap.ts";
import { BlogLayout, Layout, MainNav } from "../layout.tsx";

export const data: PageData = {
  title: "Gost",
  created: "2023-08-16 00:00:00",
};

export const render: PageRender = () => {
  return (
    <BlogLayout page={data}>
      <p>
        I wrote my own
        <a href="https://github.com/nvlled/gost">static site generator</a> many
        moons ago, and it's only now that I decided to use it. I can't remember
        exactly what the reason is for writing my own, but most likely reason is
        that I fell ill and showed severe signs of
        <a href="https://en.wikipedia.org/wiki/Not_invented_here">
          NIH syndrome
        </a>
        for several days.
      </p>
      <p>
        In addition to NIH illness, I felt strongly that writing things from
        scratch is an instructive experience. I wouldn't know how to write a
        compiler just by using a compiler. Sadly, my compulsive tendency to
        write things from scratch quite often deviated me from pursuing my
        original goals.
      </p>
      <p>
        I wanted to start my own blog, so I wrote my own blog engine. Oh wait, I
        could generalize by writing a static site generator.
      </p>
      <p>
        My priority list apparently is poorly implemented and is riddled with
        bugs. It could've been worse though. At least I didn't start from
        writing my own http server or building my own universe.
      </p>
      <p>
        So about a hundred commits later, I had roughly working static site
        generator. Of course(?), by then I lost interest with this whole
        blogging activity. For some reason, the site generator felt tedious to
        use. I felt I didn't generalize enough abstractions. The templating
        syntax annoyed me and I wished for an embedded lisp interpreter instead.
      </p>
      <p>
        So, as usual, I lost interest, felt like I wasted my time, what have I
        been doing with my life, and so on. It was a period of downtime after
        that, I probably just played games all day long.
      </p>
      <p>
        Many, many depressing days later, here I am digging up an old, abandoned
        ruins for an artifact that I disposed. The code is not perfect, but it
        is still written sufficiently well that I am not attacked by a{" "}
        <a href="https://en.wikipedia.org/wiki/Spaghetti_code">
          sphagetti monster
        </a>{" "}
        when I need to add some features (not immediately at least).
      </p>
      <p>
        The reason why I decided to use it now is because I need a static site
        generator. And I need a static site generator because I have some
        content that I{" "}
        <a href={sitemap("old-site/blog/justwrite").path}>wrote</a>
        at <a href={sitemap("old-site/blog/gost").path}>whim</a>, and several
        other projects.
      </p>
    </BlogLayout>
  );
};
