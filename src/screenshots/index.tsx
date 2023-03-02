import { PageData, PageRender, SitemapEntry } from "../cita.tsx";
import * as path from "$std/path/mod.ts";
import { Dv, HR, Layout, Space } from "../components.tsx";
import captions from "./captions.ts";
import { Screenshot, ThumbnailLink } from "./common.tsx";
import listing from "./listing.ts";
import { pageDir } from "sitemap";
import { tw } from "$twind/css";

export const data: PageData = {
  title: "Screenshots",
  created: "2023-02-21 00:00:00",
};

export const render: PageRender = () => {
  const sm = pageDir("screenshots/");
  return (
    <Layout title={data.title}>
      <h1 className={tw`text-2xl font-bold`}>Screenshots</h1>
      <br />
      <h2 className={tw`font-bold text-lg`}>What are these?</h2>
      <p>
        These are screenshots that were automatically taken while I use my
        computer. The screenshots are taken 3-4 times per hour, all day long, so
        to save me some disk space, I only select a few and crop them. I only
        started screenshots not too long ago so there isn't much here yet.
      </p>
      <h2 className={tw`font-bold text-lg`}>What for?</h2>
      <p>
        I don't know, for some content. I guess it would be amusing to look back
        and see what was I doing in a particular time.
      </p>
      <br />
      {sm.map((p) => {
        const name = path.basename(p.path ?? "", ".tsx");
        const entries = (listing as Record<string, Screenshot[]>)[name];
        if (name === "index") return null;
        return (
          <Dv tw="mb-10">
            <Dv tw="flex items-end">
              <h1 className={tw`text-2xl font-bold`}>{name}</h1>
              <Space />
              <a href={p.path}>[view all]</a>
            </Dv>
            <Dv tw="flex flex-wrap">
              {entries?.slice(0, 6).map((image) => (
                <ThumbnailLink
                  image={image}
                  className={tw`mr-1 mb-1`}
                  caption={captions[image.path]}
                />
              ))}
            </Dv>
          </Dv>
        );
      })}
    </Layout>
  );
};

// TODO:
// generateScreenShotPages():
//   screenshots/index.tsx
//   screenshots/code.tsx
//   screenshots/gaming.tsx
// I was thinking of generating a page for each image,
// but I'm not sure that's a good idea. As I accumulate more images,
// the source directory could easily become bloated.
// Alternatively, I could only generate the html pages,
// but adding another rule to page generation makes thing more complicated.
// Having 1
// Instead, just create a page for each screenshot dir.
// It would be a lot more efficient if I just create a client script
// for listing all the images, but oh well, I'm trying
// to see how far I could go without client scripts.
// Just dump all the thumbnails in one page, the browser
// should be smart enough to decide which to load first.
//
/*
screenshots/code.tsx
import {createScreenshotPage} from "screenshot"
const {data, render} = createScreenshotPage("code")
export {data, render};

 
*/
