import {
  ComponentChildren,
  config,
  SitemapEntry,
  parseDateTime,
  md,
} from "./cita.tsx";
import { sitemap } from "sitemap";
import moment from "moment";
import { tw, apply, css } from "$twind/css";
import { highlightThemeCss } from "./syntax_highlighter.tsx";

export const icons = {
  notes: "⛾",
  screenshots: "֎",
  projects: "⌬",
  about: "⌭",
};

function getSiteTitle(pageTitle?: string) {
  if (pageTitle) {
    return `${pageTitle} - ${config.siteName}`;
  }
  return config.siteName;
}

export function Space({ className }: { className?: string }) {
  return <span className={className}>&nbsp;</span>;
}

function MainNav() {
  const links = [
    { title: "notes", path: sitemap("notes").path, icon: icons.notes },
    {
      title: "screenshots",
      path: sitemap("screenshots/index").path,
      icon: icons.screenshots,
    },
    { title: "projects", path: sitemap("projects").path, icon: icons.projects },
  ];

  return (
    <div className={tw`flex items-center divide-x-1 divide-dotted`}>
      {links.map((item) => (
        <div className={tw`p-2 md:p-3 text-center whitespace-nowrap`}>
          <a title={item.title} href={item.path} className={tw`flex`}>
            <span>{item.icon}</span>
            <Space />
            <span className={tw`hidden sm:block`}>{item.title}</span>
          </a>
        </div>
      ))}
    </div>
  );
}

function Header() {
  return (
    <Dv tw={"flex bg-gray-700 text-blue-100 h-10 items-center"}>
      <Dv tw={"m-1 p-1 border border-blue-100"}>
        <a href={sitemap("index").path}>⌨</a>
      </Dv>
      <Space />
      <Dv tw="leading-tight md:block hidden whitespace-pre">
        <a href={sitemap("index").path}>{config.siteName}</a>
      </Dv>
      <Space className={tw`hidden sm:block md:w-10`} />
      <MainNav />
      <Dv tw="flex-grow-1 text-right mr-3">
        <a className={tw`flex justify-end`} href={sitemap("about").path}>
          <span>{icons.about}</span>
          <Space />
          <span className={tw`hidden sm:block`}>about</span>
        </a>
      </Dv>
    </Dv>
  );
}

export type LayoutProps = {
  title?: string;
  children: ComponentChildren;
};

export function Layout({ title, children }: LayoutProps) {
  return (
    <html>
      <head>
        <title>{getSiteTitle(title)}</title>
        <link rel="stylesheet" href="assets/style.css" />
        <link rel="stylesheet" href={highlightThemeCss} />
      </head>
      <body className={tw`lg:w-4/5 m-auto bg-gray-50`}>
        <Header />
        <div className={tw`bg-gray-200 p-2 shadow-xl drop-shadow-xl`}>
          {children}
        </div>
        <footer className={tw`w-full h-0.5 bg-gray-500`} />
        <br />
      </body>
    </html>
  );
}

const postTextStyle = css`
  ${apply`my-2`};
  a {
    ${apply`text-underline text-blue-900`};
    &:visited {
      ${apply`text-blue-800`}
    }
  }
  h1,
  h2,
  h3,
  h4,
  h5 {
    ${apply`font-bold`};
  }
  h1 {
    ${apply`text-xl`}
  }
  h2 {
    ${apply`text-lg`}
  }
  h3 {
    ${apply`text-base`}
  }
  h3 {
    ${apply`text-base`}
  }

  ul {
    ${apply`ml-5`};
    li {
      ${apply`list-disc`}
    }
  }

  p {
    ${apply`my-2`}
  }
`;
export function Post({
  num,
  data,
  children,
  icon,
}: {
  icon?: keyof typeof icons;
  num?: number;
  data: Partial<SitemapEntry>;
  children?: ComponentChildren;
}) {
  const date = moment(data.created && parseDateTime(data.created ?? ""));
  return (
    <Dv tw="text-xl flex items-start">
      <Dv tw={"flex"}>
        {num !== undefined && <Dv tw={"text-gray-500"}>{num}.</Dv>}
        <Dv>{icon ? icons[icon] : "⛾"}</Dv>
      </Dv>
      <Space />
      <Dv>
        <Dv tw={"flex items-center"}>
          <a href={data.path} className={tw`text-gray-900 `}>
            {data.title}
          </a>
        </Dv>
        <Dv
          className={tw`flex items-center text-base divide(black x-1 dotted)`}
        >
          <Dv tw="pr-2">{data.created}</Dv>
          <Dv tw="px-2">{data.created && date.fromNow()}</Dv>
          <Dv tw="px-2">{data.desc}</Dv>
        </Dv>
        {(data.created || data.desc) && <Dv tw="mb-4" />}
        <Dv className={tw`text-base max-w-4xl mr-5 ${postTextStyle}`}>
          {children}
        </Dv>
      </Dv>
    </Dv>
  );
}

Post.BR = function () {
  return <Dv tw={"my-3"} />;
};

Post.Header = function ({ children }: { children: ComponentChildren }) {
  return (
    <div>
      <h1 className={tw`font-bold`}>{children}</h1>
      <Dv tw={"h-1"} />
    </div>
  );
};

Post.Text = function ({ children }: { children: ComponentChildren }) {
  return <p className={tw``}>{children}</p>;
};

export function HR() {
  return (
    <hr
      className={tw`w-full h-0.5  my-3 bg-gray-500 border-0 rounded dark:bg-gray-700`}
    />
  );
}

export function Dv({
  title,
  tw: twArg,
  className,
  children,
}: {
  title?: string;
  tw?: string;
  className?: string;
  children?: ComponentChildren;
}) {
  return (
    <div
      title={title}
      className={(twArg ? tw(twArg) : "") + " " + className ?? ""}
    >
      {children}
    </div>
  );
}

export function Link({
  tw: twArg,
  className,
  href,
  children,
}: {
  href: string;
  className?: string;
  tw?: string;
  children: ComponentChildren;
}) {
  return (
    <a className={tw`${twArg ?? ""} ${className ?? ""}`} href={href}>
      {children}
    </a>
  );
}

export function Markdown({ text }: { text: string }) {
  text = text
    .split("\n")
    .map((line) => line.trim())
    .join("\n");
  return <div dangerouslySetInnerHTML={{ __html: md(text) }} />;
}

export function cache<T>(fn: () => T): () => T {
  let result: T | undefined;
  return function () {
    if (!result) {
      result = fn();
    }
    return result;
  };
}
