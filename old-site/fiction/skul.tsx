import { PageData, PageRender } from "cita";
import { pageDir } from "../../gen_sitemap.ts";
import { Layout, MainNav } from "../layout.tsx";

export const data: PageData = {
  title: "Skul",
  created: "2017-03-17 00:00:00",
};

export const render: PageRender = () => {
  return (
    <Layout title={data.title}>
      <p class="x">
        <a href="http://nvlled.neocities.org">
          <img src="/assets/old-site/images/skul.png" />
        </a>
      </p>
      <h4>
        <a href="http://nvlled.neocities.org">skul</a>
      </h4>

      <p>
        I wrote this one out boredom or misery (or both). It was for a end term
        requirement, which required me to create a personal website using only
        html. I started writing it in the middle of the night, and finished it
        around morning.
      </p>

      <style>
        {`
.x, h4 { text-align: center}
`}
      </style>
    </Layout>
  );
};
