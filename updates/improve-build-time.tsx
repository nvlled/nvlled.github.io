import { PageData, PageRender } from "cita";
import { Layout, Post } from "components";

export const data: PageData = {
  title: "Improve build time",
  created: "2023-02-27 00:00:00",
};

export const render: PageRender = () => {
  return (
    <Layout>
      <Post data={data} icon="about">
        I made the build time for cita.tsx faster. What I did was move heavier
        dependencies to the tools directory. I use imagescript to generate
        thumbnails, and just by including it, the build time increases to about
        a half-second. I moved this to an external script in the tools/
        directory, so it doesn't get imported every build.
        <Post.BR />
        The other thing I did was to avoid too many dynamic imports. Dynamic
        imports takes about ~20ms, so for ten pages, that would about 200ms. I
        made a lot of test pages, so the build time noticeably got slower.
        Instead of dynamic imports, I just generate a file that imports all the
        page files, which is an idea I got while trying out deno-fresh.
        <Post.BR />
        Finally, I made changes to the local dev server so that it only rebuilds
        the .tsx that corresponds to the last viewed page.
        <Post.BR />
        Overall, I was able to cut the full build time from 1.5s to 500ms. For a
        partial rebuild of one or two files, it only now takes 100ms, which is
        plenty fast for iterative development.
      </Post>
    </Layout>
  );
};
