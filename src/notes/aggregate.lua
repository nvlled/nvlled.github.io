local ext = require 'ext'
local query = require 'query'
local notedb = require 'notedb'
local imagedb = require('imagedb')

local logs, allTags = notedb.entries, notedb.getTags()
local images, imageTags = imagedb.entries, imagedb.tags

local function groupNotesAndImages(logs, images)
    local dates = {}
    local entries = {}
    local others = {}
    local dateToPage = {}
    local tags = {}
    local imageTags = {}
    local noteTags = {}

    local function addToTag(tags, tag, entry)
        if not tags[tag] then
            tags[tag] = {}
        end
        table.insert(tags[tag], entry)
    end

    local function initEntry(date, hour)
        if not entries[date] then
            entries[date] = {}
            table.insert(dates, 1, date)
        end
    end

    for _, image in ipairs(images) do
        local date, time = image.date, image.time
        if not date and not hour then
            table.insert(others, image)
            goto continue
        end
        local hour = time:sub(1, 2)
        if not hour or hour == "00" then
            hour = "12"
        end

        image.type = "image"
        initEntry(date, hour)
        table.insert(entries[date], 1, image)

        for tag in pairs(image.tags) do
            if type(tag) == "string" then
                addToTag(tags, tag, image)
                addToTag(imageTags, tag, image)
            end
        end

        ::continue::
    end

    for _, log in ipairs(logs) do
        local date, time = log.date, log.time
        if not date and not time then
            table.insert(others, log)
            goto continue
        end
        local hour = time:sub(1, 2)
        if not hour or hour == "00" then
            hour = "12"
        end

        log.type = "note"
        initEntry(date, hour)
        table.insert(entries[date], 1, log)

        for tag in pairs(log.tags) do
            if type(tag) == "string" then
                addToTag(tags, tag, log)
                addToTag(noteTags, tag, log)
            end
        end

        ::continue::
    end

    table.sort(dates, function(a, b)
        return a > b
    end)

    local pages = {{}}
    local pageSize = 10

    local num = 1
    for _, date in ipairs(dates) do
        table.sort(entries[date], function(a, b)
            return a.time > b.time
        end)

        for _, log in ipairs(entries[date]) do
            log.aggregateNum = num
            num = num + 1
        end

        if #pages[#pages] >= pageSize then
            table.insert(pages, {})
        end
        table.insert(pages[#pages], date)
        dateToPage[date] = #pages
    end

    return {
        tags=tags;
        imageTags=imageTags;
        noteTags=noteTags;
        dates=dates;
        entries=entries;
        others=others;
        pages=pages;
        dateToPage=dateToPage;
    }
end

local aggregate = groupNotesAndImages(logs, images)

local function getSiblings(entries, item, tag)
    if not entries or #entries == 0 then
        return nil
    end

    local _, index = ext.findBy(entries, function(e)
        return e.aggregateNum == item.aggregateNum
    end)
    print("index", index, #entries)
    if not index then
        return nil
    end
    local result = {next=nil; prev=nil; start=nil; last=nil}
    if index < #entries then
        result.next = entries[index + 1]
        if result.next then
            result.nextNum = result.next.num
        end
    end
    if index > 1 then
        result.prev = entries[index - 1]
        if result.prev then
            result.prevNum = result.prev.num
        end
    end

    result.start = entries[1]
    result.last = entries[#entries]
    result.startNum = result.start.num
    result.lastNum = result.last.num
    return result
end

function aggregate.getSiblingNotes(note, tag)
    local entries = tag and aggregate.noteTags[tag] or notedb.entries
    return getSiblings(entries, note, tag)
end
function aggregate.getSiblingImages(image, tag)
    local entries = tag and aggregate.imageTags[tag] or imagedb.entries
    return getSiblings(entries, image, tag)
end

function aggregate.getNewerDate(date)
    for i, d in ipairs(aggregate.dates) do
        if date  == d then
            return aggregate.dates[i-1]
        end
    end
    return nil
end
function aggregate.getOlderDate(date)
    for i, d in ipairs(aggregate.dates) do
        if date  == d then
            return aggregate.dates[i+1]
        end
    end
    return nil
end

return aggregate
