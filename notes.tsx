import { data, render as renderFeedPage } from "./notes/feed/page[x].tsx";
export { data };

export function render() {
  return renderFeedPage({
    data: { ...data, pathKey: "0" },
  });
}
