import denoConfig from "./deno.json" assert { type: "json" };
import { highlightText } from "$speed_highlight/dist/index.js";
import { Marked } from "markdown";
import { sleep } from "npm:deasync";

//import htmlLang from "$speed_highlight/dist/languages/html.js";

const speedHighlightDir = denoConfig.imports["$speed_highlight/"].replace(
  /^https?:\/\//,
  ""
);
export const highlightThemeCss = `/assets/${speedHighlightDir}dist/themes/visual-studio-dark.css`;

//Marked.options.highlight = (code: string, lang?: string) => {
//  return highlightText(code, lang);
//};

export async function codeBlock(lang: string, code: string) {
  return (
    <div
      className={" shj-lang-" + lang}
      dangerouslySetInnerHTML={{
        __html: await highlightText(code, lang),
      }}
    />
  );
}

export async function code(lang: string, code: string) {
  return (
    <code
      className={" shj-lang-" + lang}
      dangerouslySetInnerHTML={{
        __html: await highlightText(code, lang),
      }}
    />
  );
}
