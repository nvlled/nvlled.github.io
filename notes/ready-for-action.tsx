import { PageData, PageRender } from "cita";
import { Layout, Post } from "components";

export const data: PageData = {
  title: "Ready for action",
  created: "2023-02-28 20:00:52",
};

export const render: PageRender = () => {
  return (
    <Layout>
      <Post data={data}>
        This time for real, I'm ready to start writing!?
        <Post.BR />
        Just kidding, I didn't actually create a SSG so I could create a blog or
        my own personal website. It's the other way around really. Writing or
        creating content is just the side effect. I made a new updated personal
        website so I could try out cita.tsx. I don't have anything worthwhile to
        write about.
        <Post.BR />
        Well, that's the excuse at least I tell myself. Taking something too
        seriously is sure way for me not to get anything done. This is my
        personal shithole, I am free to write any crap I want.
        <Post.BR />I have no idea how to even conclude this piece. It's probably
        because my brain is still in programming mode. In other days, I just
        barf out words without much effort. For starters, I'm going to dig out
        some of my old writings and import them here, so at least this place
        wouldn't be too empty.
      </Post>
    </Layout>
  );
};
