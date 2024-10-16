require("web")
require("strict").enable()

local hook = require "hook"
local tags = require "runtags"

hook.onPageRender = function(node)
	if not node then
		return
	end

	if tags.autoreload then
		local query = require "query"
		local body = query.select(node, "body") or node
		local contents = [[
        window.addEventListener("load", function() {
            new EventSource('/.modified').onmessage = function(event) {
                window.location.reload();
            };
        });
        ]]
		table.insert(body.children, SCRIPT(contents))
	end

	if tags.build then
		local build = require "build"
		local query = require "query"
		local path = require "path"
		local links = query.findLocalLinks(node)
		for _, link in ipairs(links) do
			if path.hasParams(link) then
				build.queue(link)
			end
		end
	end
end

