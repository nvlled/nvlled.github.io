import {
  dateTimeFormatStr,
  formatDate,
  formatDateTime,
  PageData,
  parseDate,
  parseDateTime,
  util,
} from "../cita.tsx";
import { tw } from "$twind/css";

import moment from "moment";
import * as path from "$std/path/mod.ts";
import { sortBy } from "$std/collections/sort_by.ts";
import { Dv, Layout, Space, icons } from "../components.tsx";
import screenshotCaptions from "./captions.ts";
import { expandGlob, expandGlobSync } from "$std/fs/expand_glob.ts";

export const screenshotsThumbnailDir = "./assets/thumbnails";
export const screenshotsImageDir = "./assets/screenshots";
export const screenshotsPageDir = "./screenshots/";
export const screenshotsListingFile = "./screenshots/listing.ts";

export type ScreenshotListing = Record<string, Screenshot[]>;

export interface Screenshot {
  path: string;
  date: string;
}

export function ThumbnailLink({
  image,
  caption,
  className,
}: {
  className?: string;
  image: Screenshot;
  caption?: string;
}) {
  return (
    <Dv
      tw="relative bg-gray-800 text-white w-28 sm:h-28 flex items-center overflow-hidden"
      className={className}
    >
      <a
        title={caption}
        href={path.join(screenshotsImageDir, image.path)}
        className={tw`block w-full`}
      >
        <img
          src={path.join(screenshotsThumbnailDir, image.path)}
          className={tw`w-full block`}
        />
      </a>
      <Dv tw="w-full text-xs absolute top-0 bg-opacity-50 bg-gray-900 text-white p-1">
        {moment(parseDate(image.date)).fromNow()}
      </Dv>
      {caption && (
        <Dv
          title={caption}
          tw="absolute right-0 bottom-0 py-1 px-3 cursor-pointer bg-gray-900 bg-opacity-30"
        >
          🖹
        </Dv>
      )}
    </Dv>
  );
}

export function ScreenShotFeed({
  num,
  date,
  images,
}: {
  num?: number;
  date: string;
  images: Screenshot[];
}) {
  const numImages = 30;
  const weekNum = Math.floor(parseDate(date).getDate() / 8);
  return (
    <Dv tw={"text-xl flex items-start  w-full 2xl:w-1/2"}>
      <Dv tw={"flex items-center"}>
        {num !== undefined && (
          <Dv tw={"text-gray-500 text-sm text-right w-7"}>
            {num}.<Space />
          </Dv>
        )}
        <Dv>{icons.screenshots}</Dv>
      </Dv>
      <Space />
      <Dv>
        <Dv tw="text-lg">
          screenshots on {moment(date).format("MMMM YYYY")} Week {weekNum + 1}
        </Dv>
        <Dv tw="flex flex-wrap">
          {images.slice(0, numImages).map((image) => {
            const caption = screenshotCaptions[image.path];
            return (
              <Dv tw="w-14 h-10 overflow-hidden bg-gray-700 flex items-center relative mr-0.5 mb-0.5">
                <a
                  className={tw`relative`}
                  href={screenshotsImageDir + "/" + image.path}
                  title={caption ?? image.path}
                >
                  <img
                    className={tw``}
                    src={screenshotsThumbnailDir + "/" + image.path}
                  />
                  {caption && (
                    <Dv
                      title={screenshotCaptions[image.path]}
                      tw="absolute bottom-0 right-0 bg-black bg-opacity-80 text-white text-xs"
                    >
                      🖹
                    </Dv>
                  )}
                </a>
              </Dv>
            );
          })}
        </Dv>
      </Dv>
    </Dv>
  );
}

export function ScreenShotPage({
  data,
  images,
}: {
  data: PageData;
  images: Screenshot[];
}) {
  return (
    <Layout>
      <h1 className={tw`text-2xl font-bold`}>{data.title}</h1>
      <Dv tw="flex items-center flex-wrap">
        {images.map((image, i) => (
          <ThumbnailLink
            className={tw`mr-1 mb-1`}
            image={image}
            caption={screenshotCaptions[image.path]}
          />
        ))}
      </Dv>
    </Layout>
  );
}

export function groupListingByWeek(
  listing: ScreenshotListing
): Record<string, Screenshot[]> {
  const result: Record<string, Screenshot[]> = {};
  for (const images of Object.values(listing)) {
    for (const image of images) {
      const date = parseDate(image.date);
      const week = Math.floor(date.getDate() / 8) * 7 + 1;
      const k =
        formatDate(date, "yyyy-MM") + "-" + (week < 10 ? "0" + week : week);
      if (!result[k]) result[k] = [];
      result[k].push(image);
    }
  }

  for (const [yearMonth, images] of Object.entries(result)) {
    result[yearMonth] = sortBy(images, (image) =>
      parseDate(image.date).getTime()
    ).reverse();
  }

  return result;
}

function cache<T>(fn: () => T): () => T {
  let result: T | undefined;
  return function () {
    if (!result) {
      result = fn();
    }
    return result;
  };
}

export const enumerateScreenshots = cache(() => {
  const dirs: string[] = [];
  for (const file of Deno.readDirSync(screenshotsImageDir)) {
    if (file.isDirectory) {
      dirs.push(file.name);
    }
  }
  const result: ScreenshotListing = {};
  for (const dir of dirs) {
    let images: Screenshot[] = [];
    for (const file of expandGlobSync(
      path.join(screenshotsImageDir, dir, "*.png")
    )) {
      const re = file.name.match(/\d\d\d\d-\d\d-\d\d/);
      const date = re?.[0] ?? util.today();
      if (!date) throw `huh ${file.name}, ${date}`;
      console.log({ date });
      images.push({
        path: path.join(dir, file.name),
        date,
      });
    }
    images = sortBy(images, (img) => {
      return parseDateTime(img.date, "yyyy-MM-dd").getTime();
    });
    result[dir] = images.reverse();
  }

  return result;
});
