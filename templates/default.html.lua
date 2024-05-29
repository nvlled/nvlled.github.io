local utc = os.date("!*t", os.time())
utc.hour = utc.hour + 8
local now = os.date("*t", os.time(utc))
local s = string.format("%0i-%02d-%0i %02d:%02d", now.year, now.month, now.day, now.hour, now.min)

print(string.format([[
PAGE_TITLE = "%s"
PAGE_DATE = "%s"

return LAYOUT {

}]], "", s))
