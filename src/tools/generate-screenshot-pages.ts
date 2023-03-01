/** @jsx h */
import { util } from "../cita.tsx";
import * as path from "$std/path/mod.ts";

import {
  screenshotsListingFile,
  screenshotsPageDir,
  ScreenshotListing,
  enumerateScreenshots,
} from "../screenshots/common.tsx";

const pageTemplate = (name: string) =>
  `
/* This is a generated file, any manual changes may be overwritten. */
/** @jsx h */
import { h, PageData, PageRender } from "cita";
import {ScreenShotPage} from "./common.tsx";
import listing from "./listing.ts";

export const data: PageData = {
  title: "${name} screenshots",
  created: "${util.today()}",
  $lastModified: "${util.today()}",
};

export const render: PageRender = () => {
  return <ScreenShotPage data={data} images={listing["${name}"] ?? []} />
};`.trim();

const listingTemplate = (listing: ScreenshotListing) => `
/* This is a generated file, any manual changes may be overwritten. */
export default ${JSON.stringify(listing, null, 4)}
`;

export async function generateScreenShotPages() {
  const listing = await enumerateScreenshots();
  await Deno.writeTextFile(screenshotsListingFile, listingTemplate(listing));

  for (const [name, _] of Object.entries(listing)) {
    const pageFilename = path.join(screenshotsPageDir, name + ".tsx");
    await Deno.writeTextFile(pageFilename, pageTemplate(name));
  }
}

if (import.meta.main) generateScreenShotPages();
