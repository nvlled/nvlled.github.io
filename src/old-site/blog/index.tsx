import { PageData, PageRender } from "cita";
import { pageDir, sitemap } from "../../gen_sitemap.ts";
import { BlogLayout, Layout, MainNav } from "../layout.tsx";

export const data: PageData = {
  title: "Blog",
  created: "2016-06-18 00:00:00",
};

export const render: PageRender = () => {
  const entries = pageDir("old-site/blog/").filter(
    (p) => !p.path?.endsWith("index.tsx")
  );

  return (
    <BlogLayout page={data} isIndexPage>
      <h3>Entries</h3>
      <ul>
        {entries.map((p) => (
          <li>
            <a href={p.path}>{p.title}</a>
          </li>
        ))}
      </ul>
      <h3>On Blogging</h3>
      <p>
        I don't think myself of a blogger, nor do I think I am qualified to be
        one. I don't even dream of maintaining one. Despite what I've just said,
        here I am and my written thoughts sadly contained in a blog.
      </p>
      <p>
        I don't know if it's just mozart's quartet no. 14 playing in the
        background that's causing me to be at lost for words right now, or if
        it's just that I really have this natural difficulty of serializing my
        thoughts with ease and comfort.
      </p>
      <p>
        Well, I could increase verbosity of my text by including random,
        somewhat tangential texts, thus thereby deluding myself that what I have
        written represents (even in approximation) what I really have in my
        mind. It could work if I'm writing a fiction or I'm trying convince
        myself that I rendered productive work.
      </p>
      <p>
        I don't know. Maybe, I am being too pathological again when it comes to
        definitions. What is blogging? It's diary that is put on the web, like
        what girlies do when they are keen and young. Although theirs are kept
        hidden in dark, men with scruffy beard put their diaries on the web,
        because they are sad misunderstood creatures that grew tired of talking
        to rocks. I'm an amateur historian by the way, I just gave you the most
        inaccurate account of how blogging came to be.
      </p>
      <p>
        Blogging doesn't require precision of thought, I don't know where did I
        get that. Informally, a blog is just a written series of a person's
        daily life, for purposes of existential preservation, informative
        content and/or entertainment.
      </p>
      <p>
        But by writing in public, I am making myself vulnerable by creating an
        attack surface for people of different sorts to scritinize (scrutinize
        and criticize), such as my grammar, writing style, and reasoning. I will
        prepare my excuse in advance, and they will be readily available (in
        different formats, if desired) for anyone who felt naseaous while
        reading my writings.
      </p>
      <p>
        If I am being too defensive, it is only because I'm just applying a
        degree of caution--a programmer mindset where I try to consider and
        handle ugly corner cases. I think this{" "}
        <a href="https://pchiusano.github.io/2014-10-11/defensive-writing.html">
          {" "}
          guy describes it more eloquently
        </a>
        .
      </p>
      <p>
        At one time, I felt too down to do anything. I couldn't play games, read
        books or program. It was then I decided to start
        <a href={""}>Operation: Just Write</a>. I will be conforming to that
        principle while blogging.
      </p>
      <p>
        In shorter words, blogging is just writing for the heck of it.
        Hopefully, I'll do my part well as a heckofit-writer. As mozart's piece
        about to end, I should too (I mean this piece of writing of course).
      </p>
      <p>
        Oh yeah, I am using my own
        <a href='{{urlfor "gost"}}'>static site generator</a>. It's still
        lacking in features, but it works for me for the mean time.
      </p>
    </BlogLayout>
  );
};
