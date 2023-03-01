import { PageData, PageRender, tw } from "cita";
import { Dv, Layout, Post } from "components";

export const data: PageData = {
  title: "Personal site update",
  created: "2023-02-23 00:00:00",
  desc: "used cita.tsx",
};

export const render: PageRender = () => {
  return (
    <Layout title={data.title}>
      <Post data={data}>
        <Post.Header>Ready for action</Post.Header>
        Finally, after some endless yak shavings and bikesheds, my setup is now
        (almost) complete, I'm now ready to add some content for my new personal
        website.
        <Post.BR />
        <Dv tw="italic font-bold">...</Dv>
        <Post.BR />
        Or not. I'm not exactly in the mood to write now. Rather, I feel like
        just coding some more. Well, not much coding really, just more tweaking
        some minor stuffs so that little irrelevant details look right, where
        right never looks quite right. I feel like there's something missing, to
        make it look or feel right. Do I need to add a shadow here? Maybe it
        needs some cool features. But no, none of that matters. What am I even
        doing in the first place and what have I been doing in the past few
        days.
        <Post.BR />
        <Post.Header>Stuffs I did</Post.Header>
        So if I recall correctly, here are the list of things I did:
        <ul className={tw`list-disc pl-5`}>
          <li>curate and crop screenshots</li>
          <li>thumbnail generator</li>
          <li>shitty website design</li>
          <li>puppeeterjs setup for auto browser reload</li>
          <li>feed generation, basically to make it like HN</li>
          <li>bug fixes and other QOL coding stuffs</li>
          <li>image captions</li>
        </ul>
        <br />
        And I feel like I'm not quite done yet. But I will resist the urge to
        keep adding or modifying things and be done with it. To be fair, I'm
        quite satisfied with the setup right now. It doesn't look too terrible,
        and I can add any type of new content without much fuss. All that is
        left to do now is to write or create stuffs.
        <Post.BR />
        <Dv tw="italic font-bold">...</Dv>
        <Post.BR />
        But is that all work worth it?
        <Post.BR />
        <Post.Header>Rationalization</Post.Header>
        I mean, regardless of actual value, I did enjoy doing it, so much I was
        so occupied that a whole week went by real fast. Is creating my own
        static site generator worth it? Who cares, I scratched an technical
        itch, and was relieved in the end. I like this setup, I'm positively
        sure it will help and encourage me to create more content.
        <Post.BR />
        But again, is it worth it?
        <Post.BR />
        If not my own SSG, what alternative would I have have?
        <ul className={tw`list-decimal pl-5`}>
          <li>raw HTML</li>
          <li>cat+bash</li>
          <li>PHP</li>
          <li>existing SSG</li>
        </ul>
        <Post.BR />
        I'm not masochistic to do (1), despite some people brandishing it as a
        badge of pride and honor. It only works for the simplest kind of site,
        where at most you have two types of pages: the index, and post page. But
        even then, there's already a problem of too much duplicated layout code.
        Anything more than 5 pages, it becomes a write-only website. Sure, a
        tool like sed can be used to modify common parts, at that point, why not
        use something like (2) or a build tool with a proper programming
        language. The most annoying part is the snark from raw HTML people who
        likes to pretend their use case is the only thing valid, that raw HTML
        is all ever needed, and anything more is unnecessary complexity.`
        <Post.BR />
        On to the next points, (2) and (3) can go a long way, but they are not
        fun to write or use. I've written enough crappy bash and PHP code to
        know that I wouldn't want to write too much of it without being paid to
        do so. Sure, they get the job done, but there are plenty of other
        options.
        <Post.BR />
        Is typescript fun to write? There are surely way more exciting
        programming languges that I've been wanting to use. Like haskell, F#,
        reason, clojure, rust and zig to name a few. But I went with typescript
        anyway because I don't want to spend too much time on this (which I
        already have) as I have other priorities to attend to. More importantly,
        typescript with jsx is indeed pretty fun to write in.
      </Post>
    </Layout>
  );
};
