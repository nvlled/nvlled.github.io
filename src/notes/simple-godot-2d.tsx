import { PageData, PageRender } from "cita";
import { Layout, Markdown, Post } from "components";

export const data: PageData = {
  title: "Simple Godot 2D game",
  created: "2023-03-06 19:53:57",
};

export const render: PageRender = () => {
  return (
    <Layout>
      <Post data={data}>
        <Markdown
          text={`
          I just finished reading most of the **Getting started** chapter of
          Godot documentation, from **Introduction** to the **Your first 2D Game**.
          I started with GDscript, then converted each script to C#.
          Before proceeding to the 3D tutorial, I thought I should try to at least
          make a simple 2D game based on what I just learned, to help reinforce
          how to use the framework and the godot API.  
          

        `}
        />
      </Post>
    </Layout>
  );
};
