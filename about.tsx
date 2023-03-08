import { md, PageData, PageRender } from "./cita.tsx";
import { HR, icons, Layout, Post } from "./components.tsx";
import { pageDir, sitemap } from "sitemap";
import { tw } from "$twind/css";

export const data: PageData = {
  title: "About",
  created: "2023-02-21 00:00:00",
};

export const render: PageRender = () => {
  const { Text, Header, BR } = Post;
  return (
    <Layout>
      <Post icon={"about"} data={{ title: "About" }}>
        <Text>
          This is just a personal website that is still in construction, nothing
          much too see here.
          <BR />
        </Text>
        <Header>Tech stack details</Header>
        <Text>
          I used my own static site generator{" "}
          <a href="https://github.com/nvlled/cita.tsx">cita.tsx</a> to create
          this site. As the file extension suggest, I write the pages using the
          JSX paired with typescript. It uses the deno runtime to run the
          scripts.
        </Text>
        <BR />
        <Header>Updates</Header>
        <ul className={tw`ml-5 list-disc`}>
          {pageDir("updates/").map((e) => (
            <li>
              {e.created} - <a href={e.path}>{e.title}</a>
            </li>
          ))}
        </ul>
        <HR />
        <Header>Planned changes</Header>I wouldn't probably bother implementing
        these for now, but I'll just list them just in case.
        <ul className={tw`ml-5 list-disc`}>
          <li>project page</li>
          <li>image tagging</li>
          <li>RSS feed</li>
        </ul>
      </Post>
    </Layout>
  );
};
