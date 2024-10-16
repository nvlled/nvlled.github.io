dofile "init"

local page = require "page"
local path = require "path"
local ext = require "ext"
local html = require "html"
local notedb = require "notedb"
local imagedb = require "imagedb"
local LAYOUT = require "layout"

page.data.title = "Home"

local images = imagedb.entries
local latestImages = ext.slice(images, #images-7, #images)
latestImages = ext.reverse(latestImages)

local logs = notedb.entries

logs = ext.filter(logs, function(log) return not log.tags.hidden end)
logs = ext.slice(logs, #logs-9, #logs)
logs = ext.reverse(logs)

return LAYOUT {
    id = "home";
    STYLE {
        CSS "img" {width = 170; height = 100; margin = 5; object_fit = "cover"};
        CSS ".images li" {display = "inline-block"};
        CSS "ol li" {margin_bottom = 20};
    };

    H2 / "Recent images";
    UL {
        class = "images";
         ext.map(latestImages, function(image, i)
             return LI {
                 A {
                     href=path.setParams("/notes/image.html", {i=image.num});
                     IMG { src = image.filename, lazy = true, }
                 }
             }
         end),
    };

    H2 / "Recent logs";
    OL {
        class = "navigation";
        ext.map(logs, function(log)
            local limit = 150
            local contents = html.textContent(log.contents)

            if #contents > limit then
                contents = contents:sub(1, limit) .. "..."
            end

             local year, month, day = log.date:match("(%d+)%-(%d+)%-(%d+)")
             local link = "/notes/index[date="..log.date .. "].html#nt-"..log.num

             return LI {contents; " "; A {href = link; "[more]"}}
            -- return LI {
            --     log.date;
            --     " ";
            --     log.time;
            --     HR;
            --     contents;
            -- }
        end);
    };

}
