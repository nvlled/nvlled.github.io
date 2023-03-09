#!/usr/bin/env -S deno run -A
export const version = "0.5.0";

//  ▄████▄   ██▓▄▄▄█████▓ ▄▄▄           ▄▄▄█████▓  ██████ ▒██   ██▒
// ▒██▀ ▀█  ▓██▒▓  ██▒ ▓▒▒████▄         ▓  ██▒ ▓▒▒██    ▒ ▒▒ █ █ ▒░
// ▒▓█    ▄ ▒██▒▒ ▓██░ ▒░▒██  ▀█▄       ▒ ▓██░ ▒░░ ▓██▄   ░░  █   ░
// ▒▓▓▄ ▄██▒░██░░ ▓██▓ ░ ░██▄▄▄▄██      ░ ▓██▓ ░   ▒   ██▒ ░ █ █ ▒
// ▒ ▓███▀ ░░██░  ▒██▒ ░  ▓█   ▓██▒ ██▓   ▒██▒ ░ ▒██████▒▒▒██▒ ▒██▒
// ░ ░▒ ▒  ░░▓    ▒ ░░    ▒▒   ▓▒█░ ▒▓▒   ▒ ░░   ▒ ▒▓▒ ▒ ░▒▒ ░ ░▓ ░
//   ░  ▒    ▒ ░    ░      ▒   ▒▒ ░ ░▒      ░    ░ ░▒  ░ ░░░   ░▒ ░
// ░         ▒ ░  ░        ░   ▒    ░     ░      ░  ░  ░   ░    ░
// ░ ░       ░                 ░  ░  ░                 ░   ░    ░
// ░                          [xstatic]
//
// Text art generated by figlet.js

export const documentation = {
  $what_is_this: [
    "cita.tsx is a single-file static site generator based on deno.",
    "It aims are to be able to create type-safe pages",
    "with typescript and jsx with minimal setup.",
    "(Minimal if you already have vscode and deno setup)",
  ].join("\n"),

  $doclink:
    "[demo/documentation](https://nvlled.github.io/cita.tsx/index.html)",

  $demoImage: "![](assets/demo.gif)",

  $target_users: [
    "Ideally, this tool would be used by people ",
    "who knows how to use the commandline, and is comfortable",
    "and likes working with typescript and jsx/tsx DSL.",
    "This is purely a html build tool,",
    "client-side scripts are not supported.",
  ].join("\n"),

  $getting_started: {
    [1]: "install and setup deno (see below)",
    [2]: [
      `create a new directory`,
      "```",
      "$ mkdir my-new-site",
      "$ cd my-new-site",
      "```",
    ].join("\n"),
    [3]: "setup cita.tsx (see blow)",
    [4]: `create a page: \`$ ./cita.tsx new homepage.tsx\` `,
    [5]: `build output: \`$ ./cita.tsx build\` `,

    NOTE: "> If you are using vscode, run do `Deno: Initialize Workspace Configuration`",

    $$setup_dino: {
      [1]: "[install deno](https://deno.land/manual@v1.30.3/getting_started/installation)",
      [2]: "If you are using vscode, [install extension](https://marketplace.visualstudio.com/items?itemName=denoland.vscode-deno)",
    },

    $$setup_cita: {
      [1]: "Copy or download `cita.tsx` into a directory where your static site is",
      [2]: "Inspect and read this file before running",
      [3]: "Make sure it's running correctly: `$ deno run cita.tsx -h`",
      [4]: "`$ chmod +x cita.tsx`",
      NOTE: "> this uses deno -A for convenience. You can remove this or, just run do deno run cita.tsx and manually set the permissions.",
    },
  },

  $development_and_work_flow: {
    [1]: "`./cita.tsx new posts/new-page.tsx`",
    [2]: "`./cita.tsx dev`",
    [3]: "open page in browser `http://localhost:8000` or whatever url is shown",
    [4]: "edit any page, for example `some-page.tsx`, then save changes",
    [5]: "refresh browser",
    [6]: "goto step 4 or 1",

    mapping: [
      "Each `.tsx` files maps to `.html`",
      "For example, to view `index.tsx` open http://localhost:8000/index.html,",
      "or to view `posts/hello.tsx` open http://localhost:8000/posts/hello.html",
    ].join("\n"),

    NOTE: "> If you create new pages or directory, rerun `./cita.tsx dev`",
  },

  $building: [
    "To build and output the HTML files:",
    "```",
    "$ ./cita.tsx build",
    "```",
    "Your static site should be in _build, or whatever is in config.buildDir.",
  ].join("\n"),

  $configuring_and_extension: [
    "You are free to modify and make changes to `cita.tsx` as you see fit.",
    "On the minimum, you can change or add entries in the `config` variable below.",
    "As the site gets more complex, you can add modules and split the ",
    "larger pages into files.",
  ].join("\n"),

  getSteps(obj: Record<string, unknown>) {
    const result: string[] = [];
    for (const [k, v] of Object.entries(obj)) {
      const i = parseInt(k, 10);
      if (typeof v === "string" && !isNaN(i)) {
        result[i] = Marked.parse(v).content;
      }
    }
    return result;
  },
} as const;

// --------------------------------------------------------------------------------
//  ▄████▄   ▒█████   ███▄    █   █████▒██▓  ▄████
// ▒██▀ ▀█  ▒██▒  ██▒ ██ ▀█   █ ▓██   ▒▓██▒ ██▒ ▀█▒
// ▒▓█    ▄ ▒██░  ██▒▓██  ▀█ ██▒▒████ ░▒██▒▒██░▄▄▄░
// ▒▓▓▄ ▄██▒▒██   ██░▓██▒  ▐▌██▒░▓█▒  ░░██░░▓█  ██▓
// ▒ ▓███▀ ░░ ████▓▒░▒██░   ▓██░░▒█░   ░██░░▒▓███▀▒
// ░ ░▒ ▒  ░░ ▒░▒░▒░ ░ ▒░   ▒ ▒  ▒ ░   ░▓   ░▒   ▒
//   ░  ▒     ░ ▒ ▒░ ░ ░░   ░ ▒░ ░      ▒ ░  ░   ░
// ░        ░ ░ ░ ▒     ░   ░ ░  ░ ░    ▒ ░░ ░   ░
// ░ ░          ░ ░           ░         ░        ░
// ░
export const config = {
  // The site title, to be used on your layout or pages
  siteName: "logs and notes",
  // You add can more entries here

  // Where the html output will be placed
  buildDir: "./_build",

  // ignore these files or directories when searching for .tsx
  ignore: [".git", "_dump", "neocities"],

  // These files are copied to the build output
  assets: ["favicon.ico", "./assets"],
};

config.assets = config.assets.map((filename) => path.normalize(filename));

// --------------------------------------------------------------------------------
// ▓█████ ▒██   ██▒ ██▓███   ▒█████   ██▀███  ▄▄▄█████▓  ██████
// ▓█   ▀ ▒▒ █ █ ▒░▓██░  ██▒▒██▒  ██▒▓██ ▒ ██▒▓  ██▒ ▓▒▒██    ▒
// ▒███   ░░  █   ░▓██░ ██▓▒▒██░  ██▒▓██ ░▄█ ▒▒ ▓██░ ▒░░ ▓██▄
// ▒▓█  ▄  ░ █ █ ▒ ▒██▄█▓▒ ▒▒██   ██░▒██▀▀█▄  ░ ▓██▓ ░   ▒   ██▒
// ░▒████▒▒██▒ ▒██▒▒██▒ ░  ░░ ████▓▒░░██▓ ▒██▒  ▒██▒ ░ ▒██████▒▒
// ░░ ▒░ ░▒▒ ░ ░▓ ░▒▓▒░ ░  ░░ ▒░▒░▒░ ░ ▒▓ ░▒▓░  ▒ ░░   ▒ ▒▓▒ ▒ ░
//  ░ ░  ░░░   ░▒ ░░▒ ░       ░ ▒ ▒░   ░▒ ░ ▒░    ░    ░ ░▒  ░ ░
//    ░    ░    ░  ░░       ░ ░ ░ ▒    ░░   ░   ░      ░  ░  ░
//    ░  ░ ░    ░               ░ ░     ░                    ░
//
export interface PageData {
  title: string;
  desc?: string;
  image?: string;
  created: string;
  hidden?: boolean;
  pathKey?: string;
}
export type PageEntry = Partial<PageData> & { pathKey: string };

export type SitemapEntry = PageData & {
  path?: string;
};

export type PageRender = ({
  data,
}: {
  data: PageData;
}) => JSX.Element | Promise<JSX.Element>;

export interface Page {
  data: PageData;
  render: PageRender;
  initRender?: () => void | Promise<void>;
  getPageEntries?: () => PageEntry[] | Promise<PageEntry[]>;
}

export type LoadedPage = Page & {
  path: string;
  valid: boolean;
};

export function md(markdown: string) {
  return Marked.parse(markdown).content;
}

export { h, JSX, ComponentChildren, Fragment };

export const dateTimeFormatStr = "yyyy-MM-dd HH:mm:ss";
export const dateFormatStr = "yyyy-MM-dd";

export { util };

export function formatDate(date: Date, format?: string) {
  return _formatDate(date, format ?? dateFormatStr);
}

export function parseDate(dateString: string, format?: string) {
  return _parseDate(dateString, format ?? dateFormatStr);
}

export function formatDateTime(date: Date, format?: string) {
  return _formatDate(date, format ?? dateTimeFormatStr);
}

export function parseDateTime(dateString: string, format?: string) {
  try {
    return _parseDate(dateString, format ?? dateTimeFormatStr);
  } catch (e) {
    console.log(e);
    return new Date();
  }
}

export type LinkeHTMLDocument = ReturnType<
  typeof domParser.parseFromString<"text/html">
>;

// --------------------------------------------------------------------------------
// ██▓ ███▄ ▄███▓ ██▓███   ▒█████   ██▀███  ▄▄▄█████▓  ██████
// ▓██▒▓██▒▀█▀ ██▒▓██░  ██▒▒██▒  ██▒▓██ ▒ ██▒▓  ██▒ ▓▒▒██    ▒
// ▒██▒▓██    ▓██░▓██░ ██▓▒▒██░  ██▒▓██ ░▄█ ▒▒ ▓██░ ▒░░ ▓██▄
// ░██░▒██    ▒██ ▒██▄█▓▒ ▒▒██   ██░▒██▀▀█▄  ░ ▓██▓ ░   ▒   ██▒
// ░██░▒██▒   ░██▒▒██▒ ░  ░░ ████▓▒░░██▓ ▒██▒  ▒██▒ ░ ▒██████▒▒
// ░▓  ░ ▒░   ░  ░▒▓▒░ ░  ░░ ▒░▒░▒░ ░ ▒▓ ░▒▓░  ▒ ░░   ▒ ▒▓▒ ▒ ░
//  ▒ ░░  ░      ░░▒ ░       ░ ▒ ▒░   ░▒ ░ ▒░    ░    ░ ░▒  ░ ░
//  ▒ ░░      ░   ░░       ░ ░ ░ ▒    ░░   ░   ░      ░  ░  ░
//  ░         ░                ░ ░     ░                    ░
import { Marked } from "markdown";

import { createElement, h, Fragment } from "preact";
import type { JSX, ComponentChildren } from "preact";
import { render as renderToString } from "preact-render-to-string";
import * as path from "$std/path/mod.ts";
import { copy, ensureFile, ensureDir, walk } from "$std/fs/mod.ts";
import { Command } from "https://deno.land/x/cliffy@v0.25.7/command/command.ts";
import { debounce } from "$std/async/debounce.ts";
import { serve } from "$std/http/server.ts";
import { serveDir } from "$std/http/file_server.ts";
import { format as _formatDate } from "$datetime/format.ts";
import { parse as _parseDate } from "$datetime/parse.ts";

import { DOMParser } from "linkedom";

const domParser = new DOMParser();

// --------------------------------------------------------------------------------
// ▄▄▄█████▓▓█████  ███▄ ▄███▓ ██▓███   ██▓    ▄▄▄     ▄▄▄█████▓▓█████   ██████
// ▓  ██▒ ▓▒▓█   ▀ ▓██▒▀█▀ ██▒▓██░  ██▒▓██▒   ▒████▄   ▓  ██▒ ▓▒▓█   ▀ ▒██    ▒
// ▒ ▓██░ ▒░▒███   ▓██    ▓██░▓██░ ██▓▒▒██░   ▒██  ▀█▄ ▒ ▓██░ ▒░▒███   ░ ▓██▄
// ░ ▓██▓ ░ ▒▓█  ▄ ▒██    ▒██ ▒██▄█▓▒ ▒▒██░   ░██▄▄▄▄██░ ▓██▓ ░ ▒▓█  ▄   ▒   ██▒
//   ▒██▒ ░ ░▒████▒▒██▒   ░██▒▒██▒ ░  ░░██████▒▓█   ▓██▒ ▒██▒ ░ ░▒████▒▒██████▒▒
//   ▒ ░░   ░░ ▒░ ░░ ▒░   ░  ░▒▓▒░ ░  ░░ ▒░▓  ░▒▒   ▓▒█░ ▒ ░░   ░░ ▒░ ░▒ ▒▓▒ ▒ ░
//     ░     ░ ░  ░░  ░      ░░▒ ░     ░ ░ ▒  ░ ▒   ▒▒ ░   ░     ░ ░  ░░ ░▒  ░ ░
//   ░         ░   ░      ░   ░░         ░ ░    ░   ▒    ░         ░   ░  ░  ░
//             ░  ░       ░                ░  ░     ░  ░           ░  ░      ░
//
export const templates = {
  newPage: (filename: string) =>
    `
import { PageData, PageRender } from "cita";
import { Layout } from "components";

export const data: PageData = {
  title: "${util.formatTitle(filename)}",
  created: "${util.today()}",
};

export const render: PageRender = () => {
  return <Layout title={data.title}>hello world</Layout>;
};`.trim(),

  layoutTemplate: `
import { ComponentChildren, config } from "cita";

function getSiteTitle(pageTitle?: string) {
  if (pageTitle) {
    return \`\${pageTitle} - \${config.siteName}\`;
  }
  return config.siteName;
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
      </head>
      <body>
        {config.siteName}
        <hr />
        <div>{children}</div>
      </body>
    </html>
  );
}
  `.trim(),
  // --------------------------------------------------------------------------------

  sitemap(pages: LoadedPage[]): string {
    const entries: SitemapEntry[] = [];
    const dirEntries: Record<string, number[]> = {};
    const dirs: string[] = [];
    const pagePaths: string[] = [];

    const dirSet = new Set<string>();
    let i = 0;
    for (const p of pages) {
      if (!p.valid) continue;

      entries.push({
        ...p.data,
        path: p.path,
      });
      pagePaths.push(p.path.replace(/\.tsx$/, ""));

      const dir = path.dirname(p.path) + "/";
      if (dir !== "./") {
        dirSet.add(p.path);
        if (!dirEntries[dir]) {
          dirEntries[dir] = [];
        }
        dirEntries[dir].push(i);
      }

      i++;
    }

    for (const d of dirSet) {
      dirs.push(d);
    }

    return `
/* This is a generated file, any manual changes may be overwritten.
 */
import { SitemapEntry, parseDateTime } from "./cita.tsx";

export const sitemapPages: SitemapEntry[] = ${JSON.stringify(entries, null, 2)};

export const sitemapDirs = ${JSON.stringify(dirEntries)} as const;

export type PagePath = ${
      pagePaths.length === 0
        ? '""'
        : "\n" + pagePaths.map((p) => `  | "${p}"`).join("\n")
    };

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

  const result = entries.map((i) => sitemapPages[i]);
  result.sort(
    (a, b) => parseDateTime(b.created).getTime() - parseDateTime(a.created).getTime()
  );
  return result;
}


    `.trim();
  },
  // --------------------------------------------------------------------------------

  pageList(pages: LoadedPage[]): string {
    pages = pages.filter((p) => p.valid);
    const imports = pages.map(
      (p, i) => `import * as \$${i} from "./${p.path}"`
    );
    const list = pages.map(
      (p, i) => `  {...$${i}, valid: true, path: "${p.path}"},`
    );

    const dirSet = new Set<string>();
    for (const p of pages) {
      const d = path.dirname(p.path);
      if (d !== ".") {
        dirSet.add(d);
      }
    }
    const dirs: string[] = [];
    for (const d of dirSet) {
      dirs.push(d);
    }

    return `
${imports.join(";\n")}

export const pageList = [
${list.join("\n")}
];

export default pageList;

  `;
  },
  // --------------------------------------------------------------------------------

  denoConfig: `
{
    "imports": {
        "sitemap": "./gen_sitemap.ts"
        "cita": "./cita.tsx",
        "components": "./components.tsx",
        "$std/": "https://deno.land/std@0.177.0/",
        "$datetime/": "https://deno.land/std@0.177.0/datetime/",
        "preact": "https://esm.sh/preact@10.12.1",
    },
    "compilerOptions": {
        "jsx": "react-jsx",
        "jsxImportSource": "https://esm.sh/preact@10.12.1",
        "lib": [
            "dom",
            "dom.iterable",
            "dom.asynciterable",
            "deno.ns"
        ]
    }
}
    `,
};

// --------------------------------------------------------------------------------
//  █    ██ ▄▄▄█████▓ ██▓ ██▓
//  ██  ▓██▒▓  ██▒ ▓▒▓██▒▓██▒
// ▓██  ▒██░▒ ▓██░ ▒░▒██▒▒██░
// ▓▓█  ░██░░ ▓██▓ ░ ░██░▒██░
// ▒▒█████▓   ▒██▒ ░ ░██░░██████▒
// ░▒▓▒ ▒ ▒   ▒ ░░   ░▓  ░ ▒░▓  ░
// ░░▒░ ░ ░     ░     ▒ ░░ ░ ▒  ░
//  ░░░ ░ ░   ░       ▒ ░  ░ ░
//    ░               ░      ░  ░
const util = {
  deindent(str: string) {
    str = str.trim();
    const lines = str.split("\n");
    return lines.map((line) => line.trim()).join("\n");
  },
  getRelativeImport(filename: string, importName: string) {
    filename = path.relative(path.dirname(filename), importName);
    if (!filename.match(/\.\/\w/)) {
      filename = "./" + filename;
    }
    return filename;
  },
  mapRelativePath(pagePath: string, href: string) {
    if (!href) return "";
    if (href.match(/^\#/)) return href;
    if (!href.match(/^https?:\/\//)) {
      href = href.replace(".tsx", ".html");
      href = path.relative(pagePath, href).replace("../", "./");
    }
    return href;
  },
  formatTitle(filename: string) {
    filename = path.basename(filename, ".tsx");
    filename = filename.replace(/[._-]/g, " ");
    filename = filename.split(/\s+/).join(" ");
    return filename.slice(0, 1).toUpperCase() + filename.slice(1);
  },

  async copyDir(dir: string, dest: string) {
    await ensureDir(dest);

    for await (const file of walk(dir, { includeDirs: false })) {
      const destFile = path.join(dest, file.path);
      await ensureDir(path.dirname(destFile));

      const srcStat = await util.stat(file.path);
      const destStat = await util.stat(destFile);

      if (!srcStat) continue;
      if (
        !(
          destStat &&
          (srcStat.mtime?.getTime() ?? 0) <= (destStat.mtime?.getTime() ?? 0)
        )
      ) {
        console.log("copy", file.path, "->", destFile);
        await copy(file.path, destFile, {
          overwrite: true,
          preserveTimestamps: false,
        });
      }
    }
  },

  async stat(filename: string) {
    try {
      return await Deno.stat(filename);
    } catch (e) {
      if (!(e instanceof Deno.errors.NotFound)) {
        throw e;
      }
      return null;
    }
  },

  isDirectory(filename: string) {
    try {
      const stat = Deno.statSync(filename);
      return stat.isDirectory;
    } catch (e) {
      if (!(e instanceof Deno.errors.NotFound)) {
        throw e;
      }
      return false;
    }
  },

  fileExists(filename: string) {
    try {
      Deno.statSync(filename);
      return true;
    } catch (e) {
      if (!(e instanceof Deno.errors.NotFound)) {
        throw e;
      }
      return false;
    }
  },

  today() {
    return formatDateTime(new Date());
  },

  isAsset(filename: string) {
    return config.assets.some((asset) => util.isSubDirectory(asset, filename));
  },

  isSubDirectory(parentPath: string, subPath: string) {
    const relative = path.relative(parentPath, subPath);
    return relative && !relative.startsWith("..") && !path.isAbsolute(relative);
  },

  isSiteMapEntry(obj: unknown): obj is SitemapEntry {
    return !!obj && typeof obj === "object" && "title" in obj;
  },
  getSiteMapEntries(obj: Record<string, unknown>): SitemapEntry[] {
    return Object.values(obj).filter(util.isSiteMapEntry);
  },

  hasPathKey: (filename: string) => {
    return filename.indexOf("[x]") >= 0;
  },
  setPathKey(filename: string, key: string) {
    if (filename.indexOf("[x]") < 0) {
      filename = filename.replace(/\.tsx$/, "");
      return filename + "-" + key + ".tsx";
    }
    return filename.replace(/\[x\]/, key);
  },
};

Deno.test("test sub directory check", async () => {
  const { assertEquals } = await import(
    "https://deno.land/std@0.177.0/testing/asserts.ts"
  );

  assertEquals(util.isSubDirectory("./abc", "abcd/file.txt"), false);
  assertEquals(util.isSubDirectory("./abc.txt", "abcd/file.txt"), false);
  assertEquals(util.isSubDirectory("./abcd.txt", "abcd/file.txt"), false);
  assertEquals(util.isSubDirectory("./abcd", "abcd/file.txt"), true);
  assertEquals(util.isSubDirectory("./abcd/efg", "abcd/file.txt"), false);
  assertEquals(util.isSubDirectory("./abcd/efg", "efg/file.txt"), false);
  assertEquals(util.isSubDirectory("./efg", "efg/file.txt"), true);
  assertEquals(util.isSubDirectory("abcd", "efg/../abcd/file.txt"), true);
});

// --------------------------------------------------------------------------------
//  ██▓ ███▄    █ ▄▄▄█████▓▓█████  ██▀███   ███▄    █  ▄▄▄       ██▓
// ▓██▒ ██ ▀█   █ ▓  ██▒ ▓▒▓█   ▀ ▓██ ▒ ██▒ ██ ▀█   █ ▒████▄    ▓██▒
// ▒██▒▓██  ▀█ ██▒▒ ▓██░ ▒░▒███   ▓██ ░▄█ ▒▓██  ▀█ ██▒▒██  ▀█▄  ▒██░
// ░██░▓██▒  ▐▌██▒░ ▓██▓ ░ ▒▓█  ▄ ▒██▀▀█▄  ▓██▒  ▐▌██▒░██▄▄▄▄██ ▒██░
// ░██░▒██░   ▓██░  ▒██▒ ░ ░▒████▒░██▓ ▒██▒▒██░   ▓██░ ▓█   ▓██▒░██████▒
// ░▓  ░ ▒░   ▒ ▒   ▒ ░░   ░░ ▒░ ░░ ▒▓ ░▒▓░░ ▒░   ▒ ▒  ▒▒   ▓▒█░░ ▒░▓  ░
//  ▒ ░░ ░░   ░ ▒░    ░     ░ ░  ░  ░▒ ░ ▒░░ ░░   ░ ▒░  ▒   ▒▒ ░░ ░ ▒  ░
//  ▒ ░   ░   ░ ░   ░         ░     ░░   ░    ░   ░ ░   ░   ▒     ░ ░
//  ░           ░             ░  ░   ░              ░       ░  ░    ░  ░
//
export const internal = {
  onRenderPage(page: LoadedPage, dom: LinkeHTMLDocument) {
    // override this on cita_ext.tsx
  },
  async renderPage(page: LoadedPage): Promise<string> {
    if (page.initRender) {
      const ps = page.initRender();
      if (ps instanceof Promise) await ps;
    }

    let output = page.render({ data: page.data });
    if (output instanceof Promise) output = await output;

    const html = renderToString(output);
    const dom = domParser.parseFromString(html, "text/html");

    // rewrite local hrefs to relative path
    for (const a of dom.querySelectorAll("a, link, area, base")) {
      const anchor = a as { href: string };
      anchor.href = util.mapRelativePath(page.path, anchor.href);
    }

    // rewrite local srcs to relative path
    for (const a of dom.querySelectorAll(
      "audio, img, video, script, input, track, embed"
    )) {
      const node = a as { src: string };
      node.src = util.mapRelativePath(page.path, node.src);
    }

    const scriptNode = dom.createElement("script");
    scriptNode.innerHTML = `
      if (!location.pathname.match(/\.html$/)) {
        // This makes sure that urls end with index.html
        // since the pages have relative paths in them.
        // For example: http://localhost:8000 -> http://localhost:8000/index.html
        // Omitting index.html breaks some links.
        // The generate HTML uses relative paths for easier deployment,
        // that they can be placed in any subdir and the links still work.
      
        var pathname = location.pathname;
        if (pathname[pathname.length-1] != "/") pathname += "/"
        location.pathname =  pathname + "index.html";
      }
    `;
    (dom.querySelector("head") ?? dom.body).appendChild(scriptNode as any);

    internal.onRenderPage(page, dom);

    return dom.toString();
  },

  async getPageFile(filename: string): Promise<LoadedPage> {
    filename = path.normalize(filename.replace(/(\.html|\.tsx)$/, "")) + ".tsx";

    const buildDir = path.normalize(config.buildDir);
    const dir = path.normalize(path.dirname(filename)) + path.sep;

    const emptyPage: LoadedPage = {
      path: filename,
      valid: false,
      data: { title: "", created: "" },
      render: () => createElement("div", {}),
    };

    if (dir.startsWith(buildDir)) {
      return emptyPage;
    }

    const pages = await internal.getPageFiles();
    for (const page of pages) {
      if (page.path === filename) {
        return page;
      }
    }

    return emptyPage;
  },

  async getPageFiles(): Promise<LoadedPage[]> {
    const pages = await import("./gen_pages.ts");
    return pages.pageList as LoadedPage[];
  },

  async enumeratePageFiles(ignoreError = false): Promise<LoadedPage[]> {
    const pages: LoadedPage[] = [];
    const buildDir = path.normalize(config.buildDir);

    const skip = [
      path.globToRegExp(path.join(config.buildDir, "**")),
      ...config.ignore.map((p) => path.globToRegExp(path.join(p, "**"))),
    ];

    for await (const entry of walk(".", { exts: [".tsx"], skip })) {
      const dir = path.normalize(path.dirname(entry.path)) + path.sep;
      if (dir.startsWith(buildDir)) {
        continue;
      }

      let page: LoadedPage = {
        path: entry.path,
        valid: false,
        data: { title: "", created: "" },
        render: () => createElement("div", {}),
      };

      try {
        const obj = await import("./" + entry.path);
        if (internal.validatePage(obj)) {
          page = {
            ...obj,
            valid: true,
            path: entry.path,
          };
        }
      } catch (e) {
        if (ignoreError) {
          console.log(entry.path, "cannot be imported");
          console.log(e);
        } else {
          throw e;
        }
      }

      pages.unshift(page);
    }
    return pages;
  },

  validatePage(obj: unknown): obj is Page {
    if (!obj) return false;
    if (typeof obj !== "object") return false;

    {
      if (!("data" in obj)) return false;
      const data = obj.data;
      if (!data || typeof data !== "object") return false;
      if (!("title" in data)) return false;
      if (!data.title || typeof data.title !== "string") return false;
    }

    {
      if (!("render" in obj)) return false;
      const render = obj.render;
      if (!render || typeof render !== "function") return false;
    }

    return true;
  },

  async buildHTML(pages: LoadedPage[]) {
    console.log("* building pages");
    await ensureDir(config.buildDir);

    const buildPage = async (page: LoadedPage) => {
      const output = await internal.renderPage(page);
      const dest = path.join(
        config.buildDir,
        page.path.replace(".tsx", ".html")
      );
      await ensureDir(path.dirname(dest));

      console.log("-> ", dest);
      await Deno.writeTextFile(dest, output, {
        create: true,
      });
    };

    const ps: Promise<void>[] = [];
    for (const page of pages) {
      if (!page.valid) {
        continue;
      }

      const promise = buildPage(page);
      //await promise;
      ps.push(promise);
    }

    await Promise.all(ps);
  },

  async copyAssets() {
    console.log("* copying assets");
    for (const entry of config.assets) {
      if (!entry) continue;

      if (util.isDirectory(entry)) {
        await util.copyDir(entry, path.join(config.buildDir));
      } else {
        try {
          await copy(entry, path.join(config.buildDir, entry), {
            overwrite: true,
            preserveTimestamps: false,
          });
        } catch (e) {
          if (
            !(e instanceof Deno.errors.NotFound) &&
            !(e instanceof Deno.errors.AlreadyExists)
          ) {
            console.log("failed to copy asset", entry, ":", e);
          }
        }
      }
    }
  },

  async generateSiteMapFile(pages: LoadedPage[]) {
    pages = await internal.expandMorePages(pages);

    const content = templates.sitemap(pages);
    await Deno.writeTextFile("gen_sitemap.ts", content, {
      create: true,
    });
  },

  async createNewPage(filename: string) {
    const contents = templates.newPage(filename);

    const dirname = path.dirname(filename);
    const basename = path.basename(filename, ".tsx") + ".tsx";

    await ensureDir(dirname);
    filename = path.join(dirname, basename);

    try {
      await Deno.writeTextFile(filename, contents, { createNew: true });
    } catch (e) {
      if (e instanceof Deno.errors.AlreadyExists) {
        console.log(`${filename} already exists.`);
      } else {
        console.log("failed to create new page:", e);
      }
    }
  },

  toMarkdown() {
    type header = keyof typeof documentation;
    type gsHeader = keyof typeof documentation.$getting_started;
    const formatHeader = (header: header | gsHeader) => {
      let str = header as string;
      let count = 0;
      while (str[count] === "$") count++;
      str = str.replaceAll("$", "");
      str = str.replace(/[._-]/g, " ");
      str = str.slice(0, 1).toUpperCase() + str.slice(1);
      str = "#".repeat(count + 1) + " " + str;
      return str;
    };
    const getSteps = (obj: Record<string, unknown>) => {
      const result: string[] = [];
      for (const [k, v] of Object.entries(obj)) {
        const i = parseInt(k, 10);
        if (typeof v === "string" && !isNaN(i)) {
          result[i] = i + ". " + v;
        }
      }
      return result.join("\n");
    };

    return util.deindent(`
      # cita.tsx (backwards for xstatic)

      ${formatHeader("$what_is_this")}
      ${documentation.$what_is_this}
      
      ## ${documentation.$doclink}
      ${documentation.$demoImage}

      ${formatHeader("$target_users")}
      ${documentation.$target_users}


      ${formatHeader("$getting_started")}
      ${getSteps(documentation.$getting_started)}
      ${documentation.$getting_started.NOTE}

      ${formatHeader("$$setup_dino")}
      ${getSteps(documentation.$getting_started.$$setup_dino)}

      ${formatHeader("$$setup_cita")}
      ${getSteps(documentation.$getting_started.$$setup_cita)}

      ${formatHeader("$development_and_work_flow")}
      ${getSteps(documentation.$development_and_work_flow)}

      ${documentation.$development_and_work_flow.mapping}

      ${documentation.$development_and_work_flow.NOTE}

      ${formatHeader("$building")}
      ${documentation.$building}

      ${formatHeader("$configuring_and_extension")}
      ${documentation.$configuring_and_extension}
  `);
  },

  /*
  async initSitemap() {
    let sitemapGen: Record<string, unknown> = {};
    try {
      sitemapGen = await import("./gen_sitemap.ts");
    } catch (e) {
      console.log(e);
    }

    if ("sitemapPages" in sitemapGen) {
      sitemapPages = sitemapGen.sitemapPages as SitemapEntry[];
    }
    if ("sitemapDirs" in sitemapGen) {
      sitemapDirs = sitemapGen.sitemapDirs as Record<string, number[]>;
    }
  },
  */

  async loadExtensionFile() {
    const setupFile = "./cita_ext.tsx";
    await import(setupFile);
  },

  async expandMorePages(pages: LoadedPage[]) {
    const result: LoadedPage[] = [];
    for (const page of pages) {
      if (!page.getPageEntries || !util.hasPathKey(page.path ?? "")) {
        result.push(page);
      } else {
        let entries = page.getPageEntries();
        if (entries instanceof Promise) entries = await entries;

        for (const data of entries) {
          const entry: LoadedPage = {
            ...page,
            data: {
              ...page.data,
              ...data,
            },
            path: util.setPathKey(page.path, data.pathKey),
          };

          //delete entry.getPageEntries;
          result.push(entry);
        }
      }
    }
    return result;
  },
};

// --------------------------------------------------------------------------------
//  ▄████▄   ▒█████   ███▄ ▄███▓ ███▄ ▄███▓ ▄▄▄       ███▄    █ ▓█████▄   ██████
// ▒██▀ ▀█  ▒██▒  ██▒▓██▒▀█▀ ██▒▓██▒▀█▀ ██▒▒████▄     ██ ▀█   █ ▒██▀ ██▌▒██    ▒
// ▒▓█    ▄ ▒██░  ██▒▓██    ▓██░▓██    ▓██░▒██  ▀█▄  ▓██  ▀█ ██▒░██   █▌░ ▓██▄
// ▒▓▓▄ ▄██▒▒██   ██░▒██    ▒██ ▒██    ▒██ ░██▄▄▄▄██ ▓██▒  ▐▌██▒░▓█▄   ▌  ▒   ██▒
// ▒ ▓███▀ ░░ ████▓▒░▒██▒   ░██▒▒██▒   ░██▒ ▓█   ▓██▒▒██░   ▓██░░▒████▓ ▒██████▒▒
// ░ ░▒ ▒  ░░ ▒░▒░▒░ ░ ▒░   ░  ░░ ▒░   ░  ░ ▒▒   ▓▒█░░ ▒░   ▒ ▒  ▒▒▓  ▒ ▒ ▒▓▒ ▒ ░
//   ░  ▒     ░ ▒ ▒░ ░  ░      ░░  ░      ░  ▒   ▒▒ ░░ ░░   ░ ▒░ ░ ▒  ▒ ░ ░▒  ░ ░
// ░        ░ ░ ░ ▒  ░      ░   ░      ░     ░   ▒      ░   ░ ░  ░ ░  ░ ░  ░  ░
// ░ ░          ░ ░         ░          ░         ░  ░         ░    ░          ░
// ░                                                             ░
const commands = {
  async build(options: {}, filenames: string[]) {
    //await internal.initSitemap();

    let pages: LoadedPage[] = [];
    let allPages: LoadedPage[] | undefined;
    if (filenames.length === 0) {
      allPages = await internal.getPageFiles();
      pages = allPages;
    } else {
      const ps = filenames.map((f) => internal.getPageFile(f));
      pages = await Promise.all(ps);
    }

    if (filenames.length === 0) {
      if (!allPages) {
        allPages = await internal.getPageFiles();
      }
      await internal.copyAssets();
    }

    if (pages.every((p) => !p.valid)) {
      if (!allPages) {
        allPages = await internal.getPageFiles();
      }
      pages = allPages;
    }

    pages = await internal.expandMorePages(pages);

    await internal.buildHTML(pages);
  },

  async devWatch(options: {}, _: string[]) {
    await commands.build({}, []);

    if ((await internal.getPageFiles()).length === 0) {
      return;
    }

    const watcher = Deno.watchFs(".");

    const handleChange = debounce(async (paths: string[]) => {
      let assetChanged = false;
      const sourceFiles: string[] = [];

      for (let p of paths) {
        p = path.relative(".", p);
        if (p.endsWith(".tsx") || p.endsWith(".ts")) {
          sourceFiles.push(p);
        } else if (!assetChanged) {
          assetChanged = util.isAsset(p);
        }
      }
      console.log({ assetChanged, sourceFiles });

      if (assetChanged) {
        internal.copyAssets();
      }
      if (sourceFiles.length > 0) {
        const cmd = [
          "deno",
          "run",
          "-A",
          "cita.tsx",
          "build",
          "--auto-reload-on-focus",
          ...sourceFiles,
        ];
        const proc = await Deno.run({
          cmd,
          stdout: "inherit",
          stderr: "inherit",
        });
        await proc.status();
      }
    }, 20);

    let pageToBuild = "";
    serve((req) => {
      if (req.url.endsWith(".html")) {
        const url = new URL(req.url);
        const filename = "." + url.pathname.replace(/.html$/, ".tsx");
        pageToBuild = filename;
      }

      return serveDir(req, {
        fsRoot: config.buildDir,
      });
    });

    for await (const event of watcher) {
      if (
        (event.kind === "create" || event.kind === "remove") &&
        event.paths.some((p) => p.endsWith(".tsx"))
      ) {
        console.log("new .tsx file is created or deleted, please restart");
        Deno.exit(0);
      } else if (event.kind === "modify") {
        const paths = event.paths.filter((p) => {
          for (const ignored of config.ignore) {
            if (util.isSubDirectory(ignored, p)) return false;
          }
          return true;
        });
        if (paths.length === 0) continue;

        const isPageViewed = paths.some((p) => p === pageToBuild);

        await handleChange(
          isPageViewed
            ? [pageToBuild].concat(paths.filter((p) => !p.match(/\.tsx?$/)))
            : paths
        );
      }
    }
  },

  async generateSiteMap() {
    console.log("generating page list");
    try {
      if (!(await util.fileExists("./gen_sitemap.ts"))) {
        await internal.generateSiteMapFile([]);
      }

      const pages = await internal.enumeratePageFiles();
      await internal.generateSiteMapFile(pages);

      const filename = "gen_pages.ts";
      await Deno.writeTextFile(filename, templates.pageList(pages));

      return pages;
    } catch (e) {
      console.log(e);
      console.log(
        "failed to generate page_gen.ts, please fix all errors first."
      );
      return null;
    }
  },

  async createNewPages(filenames: string[]) {
    for (const filename of filenames) {
      await internal.createNewPage(filename);
    }
    const pages = await commands.generateSiteMap();
    if (pages) {
      await internal.generateSiteMapFile(pages);
    }
  },

  async init() {
    if (!util.fileExists("deno.json")) {
      await Deno.writeTextFile("deno.json", templates.denoConfig);
    }

    if (!util.fileExists("components.tsx")) {
      await Deno.writeTextFile("components.tsx", templates.layoutTemplate);
    }
    if (!util.fileExists("index.tsx")) {
      await internal.createNewPage("index.tsx");
    }
    await commands.generateSiteMap();
  },
};

// --------------------------------------------------------------------------------
//  ███▄ ▄███▓ ▄▄▄       ██▓ ███▄    █
// ▓██▒▀█▀ ██▒▒████▄    ▓██▒ ██ ▀█   █
// ▓██    ▓██░▒██  ▀█▄  ▒██▒▓██  ▀█ ██▒
// ▒██    ▒██ ░██▄▄▄▄██ ░██░▓██▒  ▐▌██▒
// ▒██▒   ░██▒ ▓█   ▓██▒░██░▒██░   ▓██░
// ░ ▒░   ░  ░ ▒▒   ▓▒█░░▓  ░ ▒░   ▒ ▒
// ░  ░      ░  ▒   ▒▒ ░ ▒ ░░ ░░   ░ ▒░
// ░      ░     ░   ▒    ▒ ░   ░   ░ ░
//        ░         ░  ░ ░           ░
async function main() {
  if (!import.meta.url.startsWith("file:///")) {
    console.log("cita.tsx must be downloaded to the site folder");
    Deno.exit(0);
  }
  // change directory to where cita.tsx is located
  const scriptDir = path.dirname(path.fromFileUrl(import.meta.url));
  await Deno.chdir(scriptDir);

  await internal.loadExtensionFile();

  await new Command()
    .name("cita.tsx")
    .version(version)
    .description("static site generator")
    .action(() => {
      console.log(documentation.$what_is_this);
      console.log("\n -h, --help to see help");
    })

    .command("doc", "show markdown documentation")
    .action((options, ...args) => {
      console.log(internal.toMarkdown());
    })

    .command("build", "build HTML")
    .arguments("[files...:string]")
    .option(
      "-a, --auto-reload-on-focus",
      "adds a script on pages that makes it auto-reload when the page is focused"
    )
    .action(async (options, ...args) => {
      console.time("build time");
      await commands.build(options, args);
      console.timeEnd("build time");
    })

    .command("sitemap", "generate sitemap")
    .action((options, ...args) => commands.generateSiteMap())

    .command("dev", "build and watch for file changes")
    .action((options, ...args) => commands.devWatch({}, args))

    .command("new", "create a new pages")
    .arguments("<file:string> [more-files...:string]")
    .action((options, ...args) => commands.createNewPages(args))

    .command("init", "creates an index page and a simple layout file")
    .action((options, ...args) => commands.init())

    .parse(Deno.args);
}

if (import.meta.main) main();
