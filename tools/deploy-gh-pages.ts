#!/usr/bin/env -S deno run -A --unstable
import $ from "https://deno.land/x/dax/mod.ts";

await $`git checkout build`;
await $`rm -rf docs`;
await $`mv _build docs`;
await $`gt add docs`;
await $`git commit -m Update`;
await $`git push --all`;
await $`git checkout master`;
