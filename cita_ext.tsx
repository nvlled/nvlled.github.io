import {
  internal,
  config,
  templates,
  util,
  LoadedPage,
  LinkeHTMLDocument,
} from "cita";
import { getStyleTag, virtualSheet } from "https://esm.sh/twind@0.16.16/sheets";

config.buildDir = "_build";
config.assets = ["assets"];

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

const styleSheet = virtualSheet();

import { setup as setupTwind } from "twind";
import * as twColors from "$twind/colors";

setupTwind({
  theme: {
    fontFamily: {
      sans: ["Helvetica", "sans-serif"],
      serif: ["Times", "serif"],
    },
    extend: {
      colors: {
        ...twColors,

        gray: twColors.trueGray,
      },
    },
  },
  sheet: styleSheet,
  mode: "strict",
});

internal.onRenderPage = (page: LoadedPage, dom: LinkeHTMLDocument) => {
  if (page.path.match(/old-site\//)) {
    // do not inject twind style on the old-site
    return;
  }
  const styleTag = getStyleTag(styleSheet);
  const styleNode = dom.createElement("style");
  styleNode.innerHTML = styleTag;
  (dom.querySelector("head") ?? dom.body).appendChild(styleNode as any);
  styleSheet.reset();
};
