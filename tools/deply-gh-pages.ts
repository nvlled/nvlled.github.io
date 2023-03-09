#!/usr/bin/env -S deno run -A --unstable
import $ from "https://deno.land/x/dax/mod.ts";

await $`./cita.tsx build`;
await $`git checkout build`;
await $`rm -rf docs`;
await $`mv _build docs`;
await $`git checkout master`;
