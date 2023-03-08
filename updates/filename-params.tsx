import { PageData, PageRender } from "cita";
import { Layout, Markdown, Post } from "components";

export const data: PageData = {
  title: "Filename params",
  created: "2023-03-07 19:58:40",
};

export const render: PageRender = () => {
  return (
    <Layout>
      <Post data={data}>
        <Markdown
          text={`
          Changed so that filenames now have a parameter that generates
          to multiple pages. Before, I had a list of files like:
          - page0.tsx
          - page1.tsx
          - page2.tsx

          Now, I just have one file **page[x].tsx** which outputs the files:

          - page0.html
          - page1.html
          - page2.html
          
          For simplicity, the **[x]** is fixed, and any other name like [y]
          won't work. This way, at least, it's easy to recognizes pages
          that generates multiple HTML files. This is unlike other SSGs
          where filenames can take any arbitrary parameters like **some-file[param1]-[param2].tsx**.

          I wasn't planning on doing this, but I went and did it anyway.
          If I were to trace my train of thought that went off rails, it started
          with me adding new screenshots, then upon which I made a few changes to the generation thumbnail
          to make it less tedious to use. While I was at it, I started refactoring other parts
          that looked particularly wrong or inefficient, and before I knew here I am.
          
          Way before this, I was thinking of what simple 2D game to make with Godot.
          Way, way before that I was writing emails for job applications.
          Twenty years before that I was chilling up in a mango tree in mid-afternoon, eating 
          ripe tasty mangos, pondering what would my life be like when I grow up.
          Sorry kiddo, I don't think I have any exciting answers for you.
          `}
        />
      </Post>
    </Layout>
  );
};
