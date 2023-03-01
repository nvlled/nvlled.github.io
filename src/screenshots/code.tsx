/* This is a generated file, any manual changes may be overwritten. */
import { PageData, PageRender } from "cita";
import { ScreenShotPage } from "./common.tsx";
import listing from "./listing.ts";

export const data: PageData = {
  title: "code screenshots",
  created: "2023-02-23 00:00:00",
};

export const render: PageRender = () => {
  return <ScreenShotPage data={data} images={listing["code"] ?? []} />;
};
