#!/usr/bin/env -S deno run -A --unstable
import puppeteer, {
  HTTPResponse,
} from "https://deno.land/x/puppeteer@16.2.0/mod.ts";
import * as path from "https://deno.land/std@0.177.0/path/mod.ts";
import { config, util } from "../cita.tsx";
import { debounce } from "https://deno.land/std@0.177.0/async/debounce.ts";

const browserExecutablePath = "/usr/bin/google-chrome-unstable";

async function main() {
  const browser = await puppeteer.launch({
    executablePath: browserExecutablePath,
    headless: false,

    defaultViewport: null,

    timeout: 1000000000,
  });

  const page = await browser.newPage();
  page.on("error", onError);

  try {
    await page.goto("http://localhost:8000");
  } catch (e) {
    onError(e);
  }

  let reloadPromise: Promise<HTTPResponse | null> = Promise.resolve(null);
  const reload = debounce(async () => {
    await reloadPromise;
    console.log("reload");
    reloadPromise = page.reload({ timeout: 0 });
  }, 50);

  const watchDir = path.resolve(
    path.join(path.fromFileUrl(import.meta.url), "..", "..", "..")
  );
  console.log({ watchDir });
  const watcher = Deno.watchFs(watchDir);
  for await (const event of watcher) {
    if (event.kind !== "modify") {
      continue;
    }
    const paths = event.paths.filter((p) => !p.match(/\.tsx?$/));
    if (paths.length === 0) continue;
    console.log("modified", paths);

    try {
      reload();
    } catch (e) {
      console.log(e);
    }
  }
}

function onError(err: Error) {
  console.log("huh", err);
}

Deno.test("test filter watch", () => {
  console.log(config.assets.map((a) => path.normalize(a)));
  console.log(config.assets.map((a) => path.resolve(a)));
  const filename = "/home/nvlled/code/nvlled.github.io/./assets/style.css";
  console.log(path.normalize(filename));
  console.log(path.resolve(filename));
  console.log(config.assets.some((a) => util.isSubDirectory(a, filename)));
});

if (import.meta.main) {
  main();
}
