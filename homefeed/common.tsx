import { sortBy } from "$std/collections/sort_by.ts";
import { Page, PageData, SitemapEntry, util } from "cita";
import { Layout, Dv } from "components";
import { pageDir } from "../gen_sitemap.ts";
import { getAllNotes, NoteFeed } from "../notes/common.tsx";
import { UpdateFeed } from "../old-site/layout.tsx";
import {
  enumerateScreenshots,
  groupListingByWeek,
  Screenshot,
  ScreenShotFeed,
} from "../screenshots/common.tsx";

const pageSize = 15;

type HomeFeed =
  | { type: "notes"; data: PageData }
  | { type: "updates"; data: PageData }
  | { type: "screenshots"; data: { date: string; images: Screenshot[] } };

function getUpdates() {
  const allNotes = pageDir("notes/");
}

function createAllFeed(): HomeFeed[] {
  let result: HomeFeed[] = [];
  result.push(
    ...pageDir("updates/").map((note: PageData) => {
      const entry: HomeFeed = {
        type: "updates",
        data: note,
      };
      return entry;
    })
  );
  result.push(
    ...pageDir("notes/").map((note: PageData) => {
      const entry: HomeFeed = {
        type: "notes",
        data: note,
      };
      return entry;
    })
  );

  const listing = enumerateScreenshots();
  for (const [date, images] of Object.entries(groupListingByWeek(listing))) {
    result.push({
      type: "screenshots",
      data: {
        date,
        images,
      },
    } as HomeFeed);
  }

  result = sortBy(result, (entry: HomeFeed) =>
    entry.type !== "screenshots" ? entry.data.created : entry.data.date
  ).reverse();

  return result;
}

export function createHomeFeedPage(
  pageNum: number,
  allRemaining = false
): Page {
  return {
    data: {
      title: `Home${pageNum > 0 ? " " + pageNum + 1 : ""}`,
      created: util.today(),
    },
    render: () => {
      return <FeedPage pageNum={pageNum} allRemaining={allRemaining} />;
    },
  } as Page;
}

export function FeedPage({
  pageNum,
  allRemaining,
}: {
  pageNum: number;
  allRemaining?: boolean;
}) {
  const allFeed = createAllFeed();
  const start = pageNum * pageSize;
  const end = allRemaining ? allFeed.length : start + pageSize;
  const feed = allFeed.slice(start, end);
  const hasMore = end < allFeed.length;
  const nextLink = `homefeed/page${pageNum + 1}.tsx`;

  return (
    <Layout>
      <Dv tw="space-y-2">
        {feed.map((entry, i) =>
          entry.type === "notes" ? (
            <NoteFeed num={i + 1} page={entry.data} />
          ) : entry.type === "updates" ? (
            <UpdateFeed num={i + 1} page={entry.data} />
          ) : (
            <ScreenShotFeed
              num={i + 1}
              date={entry.data.date}
              images={entry.data.images}
            />
          )
        )}
      </Dv>
      {hasMore && (
        <Dv tw="ml-7 mt-3">
          <a href={nextLink}>More</a>
        </Dv>
      )}
    </Layout>
  );
}
