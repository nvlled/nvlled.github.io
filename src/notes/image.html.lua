dofile "init"

local ext = require 'ext'
local page = require 'page'
local imagedb = require('imagedb')
local tagDescriptions = require('tag-desc')
local aggregate = require('notes.aggregate')
local path = require 'path'
local LAYOUT = require 'layout'

local params = path.getParams(page.PAGE_LINK)
local index = tonumber(params.i)
local src = params.src
local link = page.PAGE_LINK

local data = imagedb.get(index)
if not data and src then
    data = imagedb.loadData(src)
end

if not data then
    return LAYOUT {"image not found:"; BR; "i="; index; BR; "src="; src}
end

page.data.title = "view image"
if data.title then
    page.data.title = page.data.title .. " - " .. data.title
else
    page.data.title = page.data.title .. " - " .. data.date .. " " .. data.time
end

local siblings = aggregate.getSiblingImages(data, params.tag)
local nextImage, prevImage, startImage, endImage
if siblings then
    nextImage = siblings.nextNum
    prevImage = siblings.prevNum
    startImage = siblings.startNum
    endImage = siblings.lastNum
end

-- if params.tag then
--     local entries = aggregate.imageTags[params.tag]
--     local index = 1
--     for i, log in ipairs(entries or {}) do
--         if data.aggregateNum == log.aggregateNum then
--             index = i
--             break
--         end
--     end

--     startImage = entries[1].num
--     endImage = entries[#entries].num
--     if index < #entries then
--         nextImage = entries[index + 1].num
--     end
--     if index > 1 then
--         prevImage = entries[index - 1].num
--     end
-- else
--     startImage = 1
--     endImage = #imagedb.entries
--     if index < #imagedb.entries then
--         nextImage = index + 1
--     end
--     if index > 1 then
--         prevImage = index - 1
--     end
-- end

local tagDesc = tagDescriptions[params.tag] or ""

return LAYOUT {
    BR;
    params.tag
        and H4 {class="tag-info"; (#tagDesc > 0 and tagDesc or params.tag)};

    DIV {
        class="nav";

        not prevImage and NBSP
            or A {href=path.setParams(link, {i=prevImage}); "⇜prev"};

        B {class="title"; data.title or ""};

        not nextImage and NBSP
            or A {href=path.setParams(link, {i=nextImage}); "next⇝"};
    };
    BR;

    DIV {class="img-container"; IMG {src=data.filename}};

    DIV {
        class="nav";
        SMALL {
            data.tags and #data.tags > 0 and EM {
                "tags: ";
                function()
                    local result = {}
                    for _, t in ipairs(data.tags) do
                        table.insert(result, A {
                            href="/notes/index[tag=" .. t .. "].html";
                            t;
                        })
                    end
                    return FRAGMENT(result)
                end;
            };
        };
        A {
            href=path.setParams("/notes/index.html", {date=data.date});
            SMALL {data.date; " "; data.time};
        };
    };

    DIV {
        class="nav";
        A {href=path.setParams(link, {i=startImage}); "↞start"};
        A {
            style="font-size: 100%";
            title="random";
            href=path.setParams("/notes/index.html#img-" .. data.time,
                                {page=aggregate.dateToPage[data.date]});
            "[context]";
        };
        A {
            style="font-size: 100%";
            title="random";
            href="/notes/random-image.html";
            "[⚄random]";
        };
        A {href=path.setParams(link, {i=endImage}); "end↠"};
    };

    STYLE {
        CSS ".tag-info" {text_align="center"; margin=0};
        CSS ".title" {text_align="center"; min_width="200px"; max_width="70%"};
        CSS ".nav" {
            display="flex";
            align_items="center";
            justify_content="space-between";
            max_width="800px";
            margin="auto";
        };
        CSS ".nav2" {text_align="center"; ["> *"]={margin_left="20px"}};
        CSS ".img-container" {text_align="center"};
        CSS "img" {object_fit="cover"; max_width="100%"; max_height="70vh"};
        CSS "body" {max_width="100%"; margin="10px 50px"};
    };
}
