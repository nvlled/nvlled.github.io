import { sortBy } from "$std/collections/sort_by.ts";
import { Page, PageData, SitemapEntry, util } from "cita";
import { Layout, Dv } from "components";
import { getAllNotes, NoteFeed } from "../notes/common.tsx";
import {
  groupListingByMonth,
  Screenshot,
  ScreenShotFeed,
} from "../screenshots/common.tsx";
import listing from "../screenshots/listing.ts";

const pageSize = 15;

type HomeFeed =
  | { type: "notes"; data: PageData }
  | { type: "screenshots"; data: { date: string; images: Screenshot[] } };

function createAllFeed(): HomeFeed[] {
  const allNotes: SitemapEntry[] = getAllNotes();
  let result: HomeFeed[] = [];
  result.push(
    ...allNotes.map((note: PageData) => {
      const entry: HomeFeed = {
        type: "notes",
        data: note,
      };
      return entry;
    })
  );
  for (const [yearDate, images] of Object.entries(
    groupListingByMonth(listing)
  )) {
    result.push({
      type: "screenshots",
      data: {
        date: yearDate + "-01",
        images,
      },
    } as HomeFeed);
  }

  result = sortBy(result, (entry: HomeFeed) =>
    entry.type === "notes" ? entry.data.created : entry.data.date
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
