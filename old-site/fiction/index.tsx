import { PageData, PageRender } from "cita";
import { pageDir, sitemap } from "../../gen_sitemap.ts";
import { Layout, MainNav } from "../layout.tsx";

export const data: PageData = {
  title: "Fiction",
  created: "2016-08-21 00:00:00",
};

export const render: PageRender = () => {
  const entries = pageDir("old-site/fiction/").filter(
    (p) => !p.path?.endsWith("index.tsx")
  );

  return (
    <Layout title={data.title}>
      <p>
        As usual, I'm chanting a magical barrier called excuses/disclaimers
        before I cast a spell called expressing myself. I have to properly set
        up a fortified defense because, after all, I'm weak and insecure.
      </p>

      <p>
        <em>"...imnotanativeenglishspeaker...sorryformybadenglish..."</em>
      </p>

      <h3>Entries</h3>
      <ul>
        {entries.map((p) => (
          <li>
            <a href={p.path}>{p.title}</a>
          </li>
        ))}
      </ul>

      <p>
        Long time ago, before I didn't know any better, I aspired of being a
        writer--a novelist in particular. I sometimes received compliments of
        being good at english (writing). Although being compared to people who
        were barely fluent in english, it's not saying much.
      </p>

      <p>
        Still, my self-assessment says that I'm sort of good when it comes to
        creative writing. Then I tried creating a novel, and then failed really
        hard. I obssessed too much in formulating a really original plot, one
        that hasn't been conceived by anyone yet. I gave up without even writing
        a single paragraph.
      </p>

      <p>
        I guess I interpreted my self-directives literally. I didn't have to be
        too original--just original enough to keep myself from being filed
        charges relating to intellectual property theft.
      </p>

      <p>
        If I ever did succeed in creating an extremely original novel, it would
        make use of no existing human knowledge, not even english. It would be
        akin to reading a new math proof where the words fuck you are written in
        precise greek dialect.
      </p>

      <p>
        Now, after being exposed to programming and other formalisms, I feel
        more mentally equipped when it comes to writing. I'm not saying (yet)
        that I plan on shifting my goals again and reconsider writing as my
        calling.
      </p>

      <p>
        I'm just declaring writing as one of my hobby, in addition to
        programming and learning a bunch of other things.
      </p>

      <p>
        I'll write out of interest, gratification or
        <a href={sitemap("old-site/blog/justwrite").path}>frustration</a>, and
        put them here to... to backup some of my files in case my disk goes
        poof.
      </p>
    </Layout>
  );
};
