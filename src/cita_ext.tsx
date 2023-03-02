import {
  internal,
  config,
  templates,
  util,
  LoadedPage,
  LinkeHTMLDocument,
} from "cita";
import { getStyleTag, virtualSheet } from "https://esm.sh/twind@0.16.16/sheets";

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

const styleSheet = virtualSheet();

// Uncomment the following code block if you want to use twind:
// https://twind.dev/handbook/styling-with-twind.html
//export { tw, apply, css } from "$twind/css";
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
});

internal.onRenderPage = (page: LoadedPage, dom: LinkeHTMLDocument) => {
  if (page.path.match(/old-site\//)) {
    // do not inject twind style on the old-site
    return;
  }
  const styleTag = getStyleTag(styleSheet);
  const styleNode = dom.createElement("style");
  styleNode.innerHTML = styleTag;
  dom.appendChild(styleNode);
  styleSheet.reset();
};
