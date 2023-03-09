import denoConfig from "./deno.json" assert { type: "json" };
import { highlightText } from "$speed_highlight/dist/index.js";

const speedHighlightDir = denoConfig.imports["$speed_highlight/"].replace(
  /^https?:\/\//,
  ""
);
export const highlightThemeCss = `/assets/${speedHighlightDir}dist/themes/visual-studio-dark.css`;

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
