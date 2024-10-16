local aggregate = require("notes.aggregate")

return table.concat({
    "num dates";
    #aggregate.dates;

    -- images[#images].filename; " ";
    -- images[#images].title
    -- page.PAGE_LINK,
    -- FRAGMENT(notedb.entries[#notedb.entries].contents)
    -- page.PAGE_FILENAME,
}, "\n")
