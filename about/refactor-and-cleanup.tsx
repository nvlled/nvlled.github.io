import { PageData, PageRender } from "cita";
import { Layout, Post, PostLayout } from "components";
import { tw } from "$twind/css";

export const data: PageData = {
  title: "Refactor and cleanup",
  created: "2023-02-28 19:00:07",
};

export const render: PageRender = () => {
  return (
      <PostLayout data={data} icon="about">
        I did lots of refactoring and cleanup today. I lost track of what I did,
        but some of the things I remember:
        <ul className={tw`list-disc ml-5 space-y-3`}>
          <li>
            <strong>add time to page date format</strong>
            <br /> this fixes the messy feed ordering
          </li>
          <li>
            <strong>improve sitemap and page imports generation</strong>
            <br /> I spent almost a whole working day getting this one right.
            The most important part is that sitemap and page imports generation
            shows the build error, and that any error shouldn't prevent it from
            building anymore. Due to cyclic dependecies, this was quite tricky
            to get right.
          </li>
          <li>
            <strong>move other code that generate stuffs to tools/</strong>
          </li>
          <li>
            <strong>use import maps properly</strong>
            <br />I didn't do this properly to avoid or reduce configuration,
            but it turned out to a be a pain to maintain. With import maps, I
            don't need to hardcode versions, and just do it like this instead:
            <br />
            <pre className={tw`whitespace-pre-line`}>
              {`
                import * as path std from "$std/path/mod.ts"; 
                import * as fs std from "$std/path/fs.ts";
             `}
            </pre>
          </li>
        </ul>
        <Post.BR />
        <Post.Text>
          And other things. One thing I realized is that a messy codebase makes
          it harder to iterate new changes. Not just because of possible unused
          or half-broken code lingering about. There's also the added cognitive
          burden when keeping track of what change I'm doing. I tend to
          habitually keep making little changes until they add up or I'm hit
          with a tricky bug. It definitely pays to do some cleaning every now
          and then.
        </Post.Text>
      </PostLayout>
  );
};
