import { config, templates, util } from "cita";

config.buildDir = "../";
config.assets = [];

templates.newPage = (filename: string) =>
  `
import { PageData, PageRender } from "cita";
import { Layout } from "components";

export const data: PageData = {
  title: "${util.formatTitle(filename)}",
  created: "${util.today()}",
};

export const render: PageRender = () => {
  return <Layout>hello world</Layout>;
};
    `.trim();
