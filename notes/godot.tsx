import { PageData, PageRender } from "cita";
import { Layout, Post } from "components";

export const data: PageData = {
  title: "Godot's wait is over",
  created: "2023-03-02 11:22:55",
};

export const render: PageRender = () => {
  return (
    <Layout>
      <Post data={data}>
        <a href="https://godotengine.org/">Godot 4.0</a> has been released, I
        can't wait to try it out. I was planning on using{" "}
        <a href="https://github.com/hajimehoshi/ebiten">ebiten</a> with my
        coroutine library for some 2D games, but I guess I'll go with godot for
        the mean time. I'll still use ebiten for the utility projects I have in
        mind though. Ideally, I should wait for 4.1 or a little while more for
        the possible bugs to settle down, but that means more waiting. For
        starters, I'll just go over the documentation, and absorb whatever I
        can, and maybe follow the official tutorials.
        <Post.BR />
        I'm a hobby wannabe gamedev at best though, and the most complex thing
        I've made is a failed voxel level editor. Actually, most of them are
        failed or discontinued before they get even to a playable state.
        <Post.BR />
        Well, no, I've got bunch of other I need to do, particularly some
        part-time work so I could afford the bills and other personal needs.
        It's the start the month, I just realized, so new job ads will be
        posted. Now's the best time to start looking for new work. This is what
        I planned to do on February, but somehow I got distracted with other
        things. This time for real, I will dedicated my time looking for a job.
        And while I'm waiting for a response for my potential employers, I will
        work on godot or other things.
      </Post>
    </Layout>
  );
};
