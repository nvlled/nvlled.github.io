import { PageData, PageRender } from "cita";
import { sitemap } from "../gen_sitemap.ts";
import { Layout } from "./layout.tsx";

export const data: PageData = {
  title: "Home",
  created: "2016-08-16 00:00:00",
};

export const render: PageRender = () => {
  return (
    <Layout title={data.title} hideMainNav>
      <div id="home">
        <p>
          Greetings. This is an eternally work-in-progress personal site. I'm
          not sure what I should put here, but I guess a{" "}
          <a href={sitemap("old-site/blog/index").path}>blog</a> would do, as
          well as some{" "}
          <a href={sitemap("old-site/mysides").path}>
            javascript games and utilities.
          </a>
        </p>
        <br />

        <nav id="main" class="index">
          <ul>
            <li>
              <a href={sitemap("old-site/index").path}>home</a>
            </li>
            <li>
              <a href={sitemap("old-site/mysides").path}>code</a>
            </li>
            <li>
              <a href={sitemap("old-site/fiction/index").path}>fiction</a>
            </li>
            <li>
              <a href={sitemap("old-site/blog/index").path}>blog</a>
            </li>
          </ul>
        </nav>

        <br />
        <div style={{ textAlign: "center", fontStyle: "italic" }}>
          What's this place? This is my old site. To view the updated one,{" "}
          <a href={sitemap("index").path}>go here</a>.
        </div>
        <br />
      </div>
    </Layout>
  );
};
