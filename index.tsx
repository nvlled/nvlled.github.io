import { data, render as renderHomeFeed } from "./homefeed/page[x].tsx";

export { data };

export function render() {
  const props = { data: { ...data, pathKey: "0" } };
  return renderHomeFeed(props);
}
