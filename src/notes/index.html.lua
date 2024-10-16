dofile "init"

local ext = require 'ext'
local query = require 'query'
local tagDesc = require 'tag-desc'
local page = require 'page'
local notedb = require 'notedb'
local imagedb = require('imagedb')
local path = require 'path'
local LAYOUT = require 'layout'

local allLogs = require 'notes.aggregate'

local fparams = path.getParams(page.PAGE_LINK)
local pageNum = tonumber(fparams.page) or 1
local viewDate = fparams["date"]
local viewTag = fparams.tag
local viewDateLogs = {}
local pageSize = 10

local logsToShow = {}
if viewDate then
    logsToShow = {viewDate}
elseif viewTag then
    logsToShow = allLogs.dates
else
    logsToShow = allLogs.pages[pageNum]
end

page.data.title = "notes"
if viewTag then
    page.data.title = viewTag .. " " .. page.data.title
elseif pageNum > 1 then
    page.data.title = page.data.title .. " - page " .. pageNum
end

local function renderDate(date, showTag)
    local result = {}
    local pageNum = allLogs.dateToPage[date]

    local dayLogs = allLogs.entries[date]
    table.sort(dayLogs, function(a, b)
        return a.time > b.time
    end)

    local function renderNote(log)
        local hourKey = log.time
        local aID = "nt-" .. log.num
        local link

        do
            local year, month, day = log.date:match("(%d+)%-(%d+)%-(%d+)")
            link = "/notes/index[date=" .. year .. "-" .. month .. "-" .. day
                       .. "].html"
        end

        local siblings = allLogs.getSiblingNotes(log, showTag)
        if siblings then
        end

        return LI {
            id=aID;
            class="log " .. (log.tags.hidden and "hidden" or "");
            DIV {
                class="log-head";
                B(hourKey);
                " ";
                A {href=link .. "#" .. aID; "[link]"};
                pageNum and A {
                    href="/notes/index[page=" .. tostring(pageNum) .. "].html#"
                        .. aID;
                    "[context]";
                };
                not log.tags.hidden and ext.map(log.tags, function(_, t)
                    if t == "text" or type(t) ~= "string" then
                        return nil
                    end
                    return FRAGMENT {
                        SPAN " ";
                        A {href="/notes/index[tag=" .. t .. "].html"; "#" .. t};
                    }
                end);
                log.title and STRONG {" > "; log.title} or "";
            };

            DIV {class="note-contents"; PP(log.contents)};
            log.tags.hidden and DIV {BR; EM "hidden"; BR; BR};

            false and siblings and DIV {
                class="note-nav";
                not siblings.next and NBSP or A {
                    title="previous note";
                    class="link-button";
                    href=showTag
                        and (page.PAGE_LINK .. "#nt-" .. siblings.next.num)
                        or (path.setParams(
                            "/notes/index.html#nt-" .. siblings.next.num,
                            {date=siblings.next.date}));
                    "⇜";
                };

                not siblings.prev and NBSP or A {
                    title="next note";
                    class="link-button";
                    href=showTag
                        and (page.PAGE_LINK .. "#nt-" .. siblings.prev.num)
                        or path.setParams(
                            "/notes/index.html#nt-" .. siblings.prev.num,
                            {date=siblings.prev.date});
                    "⇝";
                };
            };
        }
    end

    local timeSymbols = {
        ["01"]="🕐";
        ["02"]="🕑";
        ["03"]="🕒";
        ["04"]="🕓";
        ["05"]="🕔";
        ["06"]="🕕";
        ["07"]="🕖";
        ["08"]="🕗";
        ["09"]="🕘";
        ["10"]="🕙";
        ["11"]="🕚";
        ["12"]="🕛";
        ["13"]="🕐";
        ["14"]="🕑";
        ["15"]="🕒";
        ["16"]="🕓";
        ["17"]="🕔";
        ["18"]="🕕";
        ["19"]="🕖";
        ["20"]="🕗";
        ["21"]="🕘";
        ["22"]="🕙";
        ["23"]="🕚";
        ["00"]="🕛";
    }

    local function renderImage(img)
        local href = path.setParams("/notes/image.html",
                                    {i=img.num; tag=viewTag})
        return DIV {
            class="thumbnail-container";
            -- A {href=img.filename} / IMG {src=img.filename; loading="lazy"};
            A {id="img-" .. img.time; href=href}
                / IMG {src=img.filename; loading="lazy"};

            DIV {
                class="img-tags";
                A {timeSymbols[img.time:sub(1, 2)]; " "; img.time:sub(1, 5)};
            };
        }
    end

    local lastType = ""
    for _, log in ipairs(dayLogs) do
        if showTag and not log.tags[showTag] then
            goto continue
        end
        if log.type == "image" then
            if lastType ~= "image" then
                local li = LI {
                    class="images";
                    -- EM(hour .. ":00 to " .. hour .. ":59");
                    DIV {};
                }
                table.insert(result, li)
            end
            local container = query.select(result[#result], "div")
            table.insert(container.children, renderImage(log))
        else
            table.insert(result, renderNote(log))
        end
        lastType = log.type

        ::continue::
    end

    if #result == 0 then
        return nil
    end

    table.insert(result, 1, FRAGMENT {
        BR;
        LI {
            id="date-" .. date;
            class="date";
            DIV {class="line"};
            "[ " .. date .. " ]";
            DIV {class="line"};
        };
    })

    return FRAGMENT(result)
end

local renderNav = function(link, hideNote)
    return DIV {
        class="page-nav";
        not viewTag and function()
            if viewDate then
                local href = path.setParams(page.PAGE_LINK, {
                    date=allLogs.getNewerDate(viewDate);
                })
                return not hideNote and A {href=href; "⮈ previous day"}
            end
            if pageNum > 1 then
                return A {
                    class="link-button";
                    title="previous page";
                    href=path.setParams(page.PAGE_LINK,
                                        {page=tostring(pageNum - 1)});
                    "⮈ previous page";
                }
            end
            return DIV {}
        end;

        DIV {link};
        not hideNote and viewTag and DIV {
            DIV {"show tag: "; EM(viewTag)};
            tagDesc[viewTag] and DIV / STRONG {tagDesc[viewTag]};
        };

        not viewTag and function()
            if viewDate then
                local tyear, tmonth, tday =
                    viewDate:match("(%d+)%-(%d+)%-(%d+)")
                if hideNote then
                    return DIV ""
                end
                -- return viewDate and EM
                --            ^ SMALL {
                --         "showing logs only for ";
                --         tyear .. "-" .. tmonth .. "-" .. tday;
                --     }
                local href = path.setParams(page.PAGE_LINK, {
                    date=allLogs.getOlderDate(viewDate);
                })
                return not hideNote and A {href=href; "next day ⮊"}
            end
            if pageNum < #allLogs.pages then
                return A {
                    class="link-button";
                    title="next page";
                    href=path.setParams(page.PAGE_LINK,
                                        {page=tostring(pageNum + 1)});
                    "next page ⮊";
                }
            end
            return DIV ""
        end;

    }
end

return LAYOUT {
    LINK {rel="stylesheet"; href="/notes/style.css"};
    P / [[
        In here are the list of things I did for a particular hour or day.
        Also included here are the screenshots of games I played, or videos
        I watched or listened to, or just random things I stumbled upon.
        I'll occasionally write down what I'm thinking, or things
        I'm planning to do.
    ]];


    renderNav();

    UL {
        class="main";
        function()
            local list = {}
            for _, date in ipairs(logsToShow) do
                table.insert(list, renderDate(date, viewTag))
            end
            return list
        end;
    };

    BR;

    renderNav(A {id="bottom"; href="#top"; "[top]"}, true);
    DIV {id="bottom"};
}
