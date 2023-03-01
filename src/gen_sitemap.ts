/* This is a generated file, any manual changes may be overwritten.
 */
import { SitemapEntry } from "./cita.tsx";

export const sitemapPages: SitemapEntry[] = [
  {
    "title": "notes 0",
    "created": "2023-03-01 15:40:14",
    "path": "notes.tsx"
  },
  {
    "title": "Home",
    "created": "2023-03-01 15:40:13",
    "path": "index.tsx"
  },
  {
    "title": "Screenshots",
    "created": "2023-02-21 00:00:00",
    "path": "screenshots/index.tsx"
  },
  {
    "title": "code screenshots",
    "created": "2023-02-23 00:00:00",
    "path": "screenshots/code.tsx"
  },
  {
    "title": "gaming screenshots",
    "created": "2023-02-23 00:00:00",
    "path": "screenshots/gaming.tsx"
  },
  {
    "title": "random screenshots",
    "created": "2023-02-23 00:00:00",
    "path": "screenshots/random.tsx"
  },
  {
    "title": "watch screenshots",
    "created": "2023-02-23 00:00:00",
    "path": "screenshots/watch.tsx"
  },
  {
    "title": "Refactor and cleanup",
    "created": "2023-02-28 19:00:07",
    "path": "updates/refactor-and-cleanup.tsx"
  },
  {
    "title": "Improve build time",
    "created": "2023-02-27 00:00:00",
    "path": "updates/improve-build-time.tsx"
  },
  {
    "title": "Personal site update",
    "created": "2023-02-23 00:00:00",
    "desc": "used cita.tsx",
    "path": "notes/site.tsx"
  },
  {
    "title": "Ready for action",
    "created": "2023-02-28 20:00:52",
    "path": "notes/ready-for-action.tsx"
  },
  {
    "title": "Previous writings",
    "created": "2023-03-01 13:31:54",
    "path": "notes/previous-writings.tsx"
  },
  {
    "title": "Static site generator",
    "created": "2023-02-20 00:00:00",
    "desc": "created a deno-based SSG",
    "path": "notes/ssg.tsx"
  },
  {
    "title": "notes 2",
    "created": "2023-03-01 15:40:14",
    "path": "notes/feed/page2.tsx"
  },
  {
    "title": "notes 3",
    "created": "2023-03-01 15:40:14",
    "path": "notes/feed/page3.tsx"
  },
  {
    "title": "notes 0",
    "created": "2023-03-01 15:40:14",
    "path": "notes/feed/page0.tsx"
  },
  {
    "title": "notes 4",
    "created": "2023-03-01 15:40:14",
    "path": "notes/feed/page4.tsx"
  },
  {
    "title": "notes 1",
    "created": "2023-03-01 15:40:14",
    "path": "notes/feed/page1.tsx"
  },
  {
    "title": "About",
    "created": "2023-02-21 00:00:00",
    "path": "about.tsx"
  },
  {
    "title": "Home 21",
    "created": "2023-03-01 15:40:13",
    "path": "homefeed/page2.tsx"
  },
  {
    "title": "Home 31",
    "created": "2023-03-01 15:40:13",
    "path": "homefeed/page3.tsx"
  },
  {
    "title": "Home",
    "created": "2023-03-01 15:40:13",
    "path": "homefeed/page0.tsx"
  },
  {
    "title": "Home 41",
    "created": "2023-03-01 15:40:13",
    "path": "homefeed/page4.tsx"
  },
  {
    "title": "Home 11",
    "created": "2023-03-01 15:40:13",
    "path": "homefeed/page1.tsx"
  },
  {
    "title": "Projects",
    "created": "2023-02-24 00:00:00",
    "path": "projects.tsx"
  }
];

export const sitemapDirs = {"screenshots/":[2,3,4,5,6],"updates/":[7,8],"notes/":[9,10,11,12],"notes/feed/":[13,14,15,16,17],"homefeed/":[19,20,21,22,23]} as const;

export type PagePath = 
  | "notes"
  | "index"
  | "screenshots/index"
  | "screenshots/code"
  | "screenshots/gaming"
  | "screenshots/random"
  | "screenshots/watch"
  | "updates/refactor-and-cleanup"
  | "updates/improve-build-time"
  | "notes/site"
  | "notes/ready-for-action"
  | "notes/previous-writings"
  | "notes/ssg"
  | "notes/feed/page2"
  | "notes/feed/page3"
  | "notes/feed/page0"
  | "notes/feed/page4"
  | "notes/feed/page1"
  | "about"
  | "homefeed/page2"
  | "homefeed/page3"
  | "homefeed/page0"
  | "homefeed/page4"
  | "homefeed/page1"
  | "projects";

export type PageDir = keyof (typeof sitemapDirs);

const sitemapCache: Record<string, SitemapEntry> = {};
export function sitemap(pagePath: PagePath): SitemapEntry {
  if (!pagePath.endsWith(".tsx")) {
    pagePath += ".tsx";
  }

  let entry = sitemapCache[pagePath];
  if (!entry) {
    entry = sitemapPages.find((p) => p.path === (pagePath as string)) ?? {
      title: "-",
      path: "-",
      created: "-",
    };
  }

  return entry;
}

export function pagePath(pagePath: PagePath): string {
  if (pagePath.endsWith(".tsx")) {
    return pagePath;
  }
  return pagePath + ".tsx";
}

export function pageDir(dir: PageDir): SitemapEntry[] {
  const entries = sitemapDirs[dir];
  if (!entries) return [];

  return entries.map((i) => sitemapPages[i]);
}