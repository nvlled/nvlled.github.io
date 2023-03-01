import { walk } from "https://deno.land/std@0.177.0/fs/walk.ts";
import * as path from "https://deno.land/std@0.177.0/path/mod.ts";
import { ensureDir } from "https://deno.land/std@0.93.0/fs/mod.ts";
import { formatDate } from "../cita.tsx";

for await (const entry of walk("/home/nvlled/Pictures/time-flies")) {
  if (!entry.isFile) continue;
  const stat = await Deno.stat(entry.path);
  if (!stat || !stat.mtime) continue;
  const destDir = "./assets/screenshots";

  const basename = path.basename(entry.name, ".png");
  const destFile = path.join(
    destDir,
    `${basename}--${formatDate(stat.mtime)}.png`
  );
  await ensureDir(path.dirname(destFile));
  await Deno.copyFile(entry.path, destFile);
}
