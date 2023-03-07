import { PageData, PageRender } from "cita";
import { Layout, Post } from "components";

export const data: PageData = {
  title: "Previous writings",
  created: "2023-03-01 13:31:54",
};

export const render: PageRender = () => {
  return (
    <Layout>
      <Post data={data}>
        I needed to add content on this website, so I started digging for my
        older writings that goes back to around 2016. I've read my old
        discontinued blogs, I've read my random notes stored in plain texts that
        were scattered in my Documents/ directory. They were kind of amusing to
        read, but some of them are down-right depressing, especially the logs I
        wrote while being obsessed with a vtuber.
        <Post.BR />
        I'm now having second thoughts whether I should put them here. Maybe I
        could curate some of the interesting ones, but then again, the context
        could get lost. I'm now also feeling lethargic, and don't feel like
        doing anything. It's either because my own past writings is too
        terrible, or I just ate something funny.
      </Post>
    </Layout>
  );
};
