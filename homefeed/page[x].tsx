import { PageData, PageEntry, PageRender, util } from "../cita.tsx";
import {
  enumerateScreenshots,
  ScreenShotPage,
  Screenshot,
} from "../screenshots/common.tsx";
import {
  createAllFeed,
  createHomeFeedPage,
  FeedPage,
  pageSize,
} from "./common.tsx";

export const data: PageData = {
  title: "screenshots",
  created: util.today(),
};

export function getPageEntries() {
  const result: PageEntry[] = [];

  const allFeed = createAllFeed();
  const numPages = Math.ceil(allFeed.length / pageSize);
  for (let i = 0; i < numPages; i++) {
    result.push({
      pathKey: i.toString(),
    });
  }

  return result;
}

export const render: PageRender = ({ data }: { data: PageData }) => {
  const key = data.pathKey ?? "0";
  const pageNum = parseInt(key, 10);
  if (!key) {
    throw new Error("pathKey is required");
  }
  return <FeedPage pageNum={pageNum} />;
};
