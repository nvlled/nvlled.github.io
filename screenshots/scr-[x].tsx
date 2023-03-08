import { PageEntry, PageData, PageRender } from "cita";
import { pageDir, pagePath, sitemap } from "../gen_sitemap.ts";
import { enumerateScreenshots, Screenshot, ScreenShotPage } from "./common.tsx";
import * as path from "$std/path/mod.ts";

export const data: PageData = {
  title: "screenshots",
  created: "2023-02-23 00:00:00",
};

export function getPageEntries() {
  const screenshots = Object.keys(enumerateScreenshots());

  const result: PageEntry[] = [];
  for (const name of screenshots) {
    result.push({
      title: `${name} screenshots`,
      pathKey: name,
    });
  }

  return result;
}

export const render: PageRender = ({ data }: { data: PageData }) => {
  const listing = enumerateScreenshots();
  const key = data.pathKey;
  if (!key) {
    throw new Error("pathKey is required");
  }
  return (
    <ScreenShotPage
      data={data}
      images={(listing as Record<string, Screenshot[]>)[key] ?? []}
    />
  );
};

// TODO: use on feed too
// TODO: do not generate listing, just use enumerateScreenshots (but cache it once)
