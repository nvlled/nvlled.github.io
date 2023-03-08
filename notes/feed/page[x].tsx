import { PageData, PageEntry, util } from "cita";
import {
  FeedPage,
  NoteFeed,
  pageSize,
  getAllNotes,
} from "../../notes/common.tsx";

export const data: PageData = {
  title: "Notes",
  created: util.today(),
};

export function getPageEntries() {
  const notes = getAllNotes();
  const numPages = Math.ceil(notes.length / pageSize);
  const result: PageEntry[] = [];
  for (let i = 0; i < numPages; i++) {
    result.push({ pathKey: i.toString() });
  }
  return result;
}

export function render({ data }: { data: PageData }) {
  return <FeedPage pageNum={parseInt(data?.pathKey ?? "", 10) ?? 0} />;
}
