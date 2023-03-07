import { PageData, PageRender } from "cita";
import { Layout, Post } from "components";
import { tw } from "$twind/css";
import { sitemap } from "../gen_sitemap.ts";

export const data: PageData = {
  title: "Imported old site",
  created: "2023-03-02 19:16:52",
};

export const render: PageRender = () => {
  return (
    <Layout>
      <Post data={data} icon="about">
        <a href={sitemap("old-site/index").path} className={tw`inline`}>
          <img
            src="/assets/old-site/images/spiral-green-sky.jpg"
            className={tw`w-32 float-left mr-3`}
          />
        </a>
        I imported and converted my{" "}
        <a href={sitemap("old-site/index").path}>old site</a> into my new static
        site generator. It was relatively straightforward, except the part where
        I had to fix all the missing closing tags of {"<p>"}. The missing{" "}
        {"</p>"} is an intentional omission though, since that was the
        recommended way of writing HTML in the old days. With JSX though, the
        omission made my editor go all squiggly red all over. Which is a good
        thing, since subtle and hard to spot errors gets immediately detected. I
        even noticed the improperly closed tags like {"<styled>...<styled>"}
        , almost a decade later.
        <Post.BR />I made a few color changes, but other than that, I left
        everything intact, just as it was, however cringey or stupid my writings
        were. Those days were my times of peak anxiety though, I sort of
        understand what prompted me to write such things. I'd like to believe
        I'm a better person now, but no, I still write dumb things.
        <Post.BR />
        Not sure if it was worth the effort of importing the old crappy site
        though. There wasn't even much content to begin with, much less quality
        ones.
      </Post>
    </Layout>
  );
};
