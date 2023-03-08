import { PageData, PageRender } from "cita";
import { Layout } from "components";

export const data: PageData = {
  title: "Test",
  created: "2023-03-02 12:50:11",
};

export const render: PageRender = () => {
  return <Layout>hello world</Layout>;
};