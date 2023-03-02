import { ComponentChild } from "preact";
import { config, formatDate, PageData, parseDate, SitemapEntry } from "cita";
import { sitemap } from "../gen_sitemap.ts";
import { tw } from "https://cdn.skypack.dev/twind";
import moment from "https://deno.land/x/momentjs@2.29.1-deno/mod.ts";
import { Dv, Space, icons } from "../components.tsx";

function getSiteTitle(pageTitle?: string) {
  if (pageTitle) {
    return `${pageTitle} - ${config.siteName}`;
  }
  return config.siteName;
}

export function Layout({
  title,
  children,
  hideMainNav,
}: {
  title: string;
  children: ComponentChild;
  hideMainNav?: boolean;
}) {
  return (
    <html lang="en">
      <head>
        <meta charSet="UTF-8" />

        <title>{getSiteTitle(title)}</title>
        <link rel="stylesheet" href="/assets/old-site/styles/site.css" />
        <script src="/assets/old-site/scripts/site.js"></script>
      </head>
      <body>
        <div id="wrapper">
          {!hideMainNav && <MainNav />}
          {children}
        </div>
      </body>
    </html>
  );
}

export function BlogLayout({
  page,
  children,
  isIndexPage,
}: {
  isIndexPage?: boolean;
  page: PageData;
  children: ComponentChild;
}) {
  return (
    <html lang="en">
      <head>
        <meta charSet="UTF-8" />

        <title>{getSiteTitle(page.title)}</title>
        <link rel="stylesheet" href="/assets/old-site/styles/site.css" />
        <script src="/assets/old-site/scripts/site.js"></script>
      </head>
      <body>
        <div id="wrapper">
          <header id="blog">
            <h2>
              <a href={sitemap("old-site/blog/index").path}>Blog</a>
              {isIndexPage ? "" : `« ${page.title}`}
            </h2>
          </header>

          {children}
          <p>on {page.created}</p>
          <MainNav />
        </div>
      </body>
    </html>
  );
}

export function MainNav() {
  return (
    <nav id="main">
      <ul>
        <li>
          <a href={sitemap("old-site/index").path}>home</a>
        </li>
        <li>
          <a href={sitemap("old-site/mysides").path}>code</a>
        </li>
        <li>
          <a href={sitemap("old-site/fiction/index").path}>fiction</a>
        </li>
        <li>
          <a href={sitemap("old-site/blog/index").path}>blog</a>
        </li>
      </ul>
    </nav>
  );
}

export function UpdateFeed({
  num,
  page,
}: {
  num?: number;
  page: SitemapEntry;
}) {
  const date = parseDate(page.created);
  const fromNow = moment(date).fromNow();
  return (
    <Dv tw={"text-xl flex items-start"}>
      <Dv tw={"flex items-center"}>
        <Dv tw={"text-gray-500 text-sm text-right w-7"}>
          {num}.<Space />
        </Dv>
        <Dv>{icons.about}</Dv>
      </Dv>
      <Space />
      <Dv>
        <Dv tw={"flex items-center "}>
          <a href={page.path} className={tw`text-gray-500 `}>
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
          <Dv tw="hidden sm:(pr-2 block)">{formatDate(date, "yyyy-MM-dd")}</Dv>
          <Dv tw="sm:px-2">{fromNow}</Dv>
          <Dv tw="sm:px-2">{page.desc}</Dv>
        </Dv>
      </Dv>
    </Dv>
  );
}
