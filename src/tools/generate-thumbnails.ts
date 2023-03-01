import { ensureDir } from "https://deno.land/std@0.177.0/fs/ensure_dir.ts";
import * as imageScript from "https://deno.land/x/imagescript@1.2.15/mod.ts";
import * as path from "$std/path/mod.ts";
import {
  Screenshot,
  screenshotsImageDir,
  screenshotsThumbnailDir,
} from "../screenshots/common.tsx";
import listing from "../screenshots/listing.ts";

async function createThumbnails(filenames: string[]) {
  const ps: Promise<void>[] = [];
  const handleFile = async (filename: string) => {
    let bytes = await Deno.readFile(path.join(screenshotsImageDir, filename));
    const image = await imageScript.decode(bytes);
    image.resize(280, imageScript.Image.RESIZE_AUTO);
    bytes = await image.encode();
    const destFile = path.join(screenshotsThumbnailDir, filename);
    await ensureDir(path.dirname(destFile));
    await Deno.writeFile(destFile, bytes);
  };

  for (const filename of filenames) {
    ps.push(handleFile(filename));
  }

  await Promise.all(ps);
}

async function main() {
  const files: string[] = [];
  for (const entries of Object.values(listing) as Screenshot[][]) {
    for (const entry of entries) {
      files.push(entry.path);
    }
  }
  await createThumbnails(files);
}

if (import.meta.main) main();
