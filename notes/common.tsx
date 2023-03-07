import { formatDateTime, Page, parseDateTime, SitemapEntry, util } from "cita";
import moment from "https://deno.land/x/momentjs@2.29.1-deno/mod.ts";
import { Dv, icons, Layout, Space } from "../components.tsx";
import { pageDir } from "../gen_sitemap.ts";
import { tw } from "$twind/css";

const pageSize = 15;

export function getAllNotes() {
  const allNotes = pageDir("notes/");

  allNotes.sort((a, b) => {
    if (a.created !== b.created) {
      const t1 = parseDateTime(a.created).getTime();
      const t2 = parseDateTime(b.created).getTime();
      return t1 - t2;
    }
    return a.title.localeCompare(b.title);
  });

  return allNotes.reverse();
}

export function createNoteFeedPage(
  pageNum: number,
  allRemaining = false
): Page {
  return {
    data: {
      title: `notes ${pageNum}`,
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
  const allNotes: SitemapEntry[] = getAllNotes();
  const start = pageNum * pageSize;
  const end = allRemaining ? allNotes.length : start + pageSize;
  const notes = allNotes.slice(start, end);
  const hasMore = end < allNotes.length;

  const nextLink = `notes/feed/page${pageNum + 1}.tsx`;

  return (
    <Layout title={`Notes ${pageNum}`}>
      <Dv tw="space-y-2">
        {notes.map((entry, i) => (
          <NoteFeed num={start + i + 1} page={entry} />
        ))}
      </Dv>
      {hasMore && (
        <Dv tw="ml-7 mt-3">
          <a href={nextLink}>More</a>
        </Dv>
      )}
    </Layout>
  );
}

export function NoteFeed({ num, page }: { num?: number; page: SitemapEntry }) {
  const date = parseDateTime(page.created);
  const fromNow = moment(date).fromNow();
  return (
    <Dv tw={"text-xl flex items-start"}>
      <Dv tw={"flex items-center"}>
        <Dv tw={"text-gray-500 text-sm text-right w-7"}>
          {num}.<Space />
        </Dv>
        <Dv>{icons.notes}</Dv>
      </Dv>
      <Space />
      <Dv>
        <Dv tw={"flex items-center "}>
          <a href={page.path} className={tw`text-gray-900 `}>
            {page.title}
          </a>
        </Dv>
        <Dv
          className={tw`
          flex
          items-start text-xs flex-col-reverse
          sm:(flex-row items-center text-sm divide(black x-1 dotted))
          break-words
          `}
        >
          <Dv tw="hidden sm:(pr-2 block)">
            {formatDateTime(date, "yyyy-MM-dd")}
          </Dv>
          <Dv tw="sm:px-2">{fromNow}</Dv>
          <Dv tw="sm:px-2">{page.desc}</Dv>
        </Dv>
      </Dv>
    </Dv>
  );
}
