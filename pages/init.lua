PAGE_TITLE = nil
PAGE_DATE = nil
PAGE_PATH = PAGE_PATH or ''
PAGE_TAGS = {}

Rel = function(targetPath) return ext.relativePath(targetPath, PAGE_PATH) end

require "components"
ext = require 'ext'
