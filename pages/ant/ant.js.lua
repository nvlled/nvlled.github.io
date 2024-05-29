local g = js.global
local document = g.document
local console = g.console

local MouseButton = {
    left = 0,
    middle = 1,
    right = 2,
}

function parseInt(str)
    return tonumber(str:match("%d+"))
end

local Grid = {}
Grid.__index = Grid

function Grid.create(rows, cols, init)
    local self = {
        pos = { x = 0, y = 0 },
        display = {
            margin = 1,
            rectSize = 20,
        },
        rows = rows,
        cols = cols,
        selected = {},
        data = {},
    }

    setmetatable(self, Grid)

    if init then
        for pos, val in pairs(init) do
            self:setValue(pos[1], pos[2], val)
        end
    end


    return self
end

function Grid:posToInt(i, j)
    local size = math.ceil(math.log(self.rows * self.cols, 10))
    return i * 10 ^ size + j
end

function Grid:intToPos(index)
    local size = math.ceil(math.log(self.rows * self.cols, 10))
    return math.floor(index / 10 ^ size), index % 10 ^ size
end

function Grid:select(i, j)
    local index = self:posToInt(i, j)
    if self:getValue(i, j) then
        self.selected[index] = true
    end
end

function Grid:deselect(i, j)
    local index = self:posToInt(i, j)
    self.selected[index] = nil
end

function Grid:isSelected(i, j)
    return self.selected[self:posToInt(i, j)] ~= nil
end

function Grid:clearSelected()
    for index in pairs(self.selected) do
        self.selected[index] = nil
    end
end

function Grid:getAllSelected()
    return coroutine.wrap(function()
        for index in pairs(self.selected) do
            coroutine.yield(self:intToPos(index))
        end
    end)
end

function Grid:getValue(i, j)
    local index = i * self.cols + j
    return self.data[index]
end

function Grid:setValue(i, j, val)
    local index = i * self.cols + j
    self.data[index] = val
end

function Grid:getCellsAt(x1, y1, x2, y2)
    local i1, j1 = self:getCellAt(x1, y1)
    local i2, j2 = self:getCellAt(x2, y2)
    local result = {}

    if i1 > i2 then i1, i2 = i2, i1 end
    if j1 > j2 then j1, j2 = j2, j1 end

    for i = i1, i2 do
        for j = j1, j2 do
            table.insert(result, { i, j })
        end
    end
    return result
end

function Grid:getCellAt(x, y)
    -- TODO: return nil if outside of grid
    local disp = self.display
    local n = disp.margin + disp.rectSize
    local j = 1 + (x - self.pos.x) // n
    local i = 1 + (y - self.pos.y) // n
    return i, j
end

function Grid:getBoundingRect(i, j)
    local disp = self.display
    local x = self.pos.x + (disp.margin + disp.rectSize) * (j - 1)
    local y = self.pos.y + (disp.margin + disp.rectSize) * (i - 1)
    return x, y, disp.rectSize, disp.rectSize
end

function Grid:nextIterCells(current)
    local max = self.rows * self.cols
    if current < max then
        local i = (current // self.cols) + 1
        local j = (current % self.cols) + 1
        current = current + 1
        return current, i, j
    end
end

function Grid:iterateCells()
    return Grid.nextIterCells, self, 0
end

function main()
    local bufferCanvas = document:createElement("canvas")
    local canvas = document:querySelector("canvas")
    local debug = document:querySelector("#debug")

    canvas.width = 700
    canvas.height = 400

    bufferCanvas.width = canvas.width
    bufferCanvas.height = canvas.height

    local ctx = bufferCanvas:getContext("2d", { alpha = false })
    local mainCtx = canvas:getContext("2d", { alpha = false })

    local scale = 1.5
    local origin = { x = 0, y = 0 }
    local grid = Grid.create(90, 90, {
        [{ 0, 0 }] = 1,
        [{ 1, 1 }] = 1,
        [{ 2, 2 }] = 1,
        [{ 3, 3 }] = 1,
        [{ 5, 10 }] = 1,
        [{ 1, 10 }] = 1,
        [{ 5, 1 }] = 1,
    })


    function getMousePos(e)
        local canvasRect = canvas:getBoundingClientRect()
        local r = canvasRect
        local x, y = (e.clientX - r.left) / scale, (e.clientY - r.top) / scale
        x = x + origin.x
        y = y + origin.y
        return x, y
    end

    local mouse = {
        start = nil,
        current = nil,
        button = -1
    }

    canvas.onwheel = function(_, e)
        e:preventDefault()
        local n = e.deltaY
        n = math.abs(n) / n
        scale = scale - n * 0.1
        g.console:log("wheel", e, n)
    end

    canvas.onmousedown = function(_, e)
        e:preventDefault()
        g.console:log(e.button, e)

        local x, y = getMousePos(e)
        mouse.start = { x, y }
        mouse.current = { x, y }
        mouse.button = e.button

        if e.button ~= MouseButton.middle then
            local i, j = grid:getCellAt(x, y)

            if e.shiftKey and grid:getValue(i, j) then
                grid:clearSelected()
                grid:select(i, j)
                mouse.drag = true
            else
                local hasNonEmptySelected = false
                for i2, j2 in grid:getAllSelected() do
                    if grid:getValue(i2, j2) then
                        hasNonEmptySelected = true
                        break
                    end
                end
                mouse.drag = grid:isSelected(i, j) and hasNonEmptySelected and not e.shiftKey

                if not mouse.drag then
                    grid:clearSelected()
                end
            end
        end
    end

    canvas.onmousemove = function(_, e)
        if not mouse.start or not mouse.current then
            return
        end

        local x, y = getMousePos(e)
        mouse.current = { x, y }
        if mouse.button == MouseButton.middle then
            origin.x = origin.x - e.movementX
            origin.y = origin.y - e.movementY
        else
        end
    end

    document:addEventListener("mouseup", function(_, ev)
        if not mouse.start or not mouse.current then
            return
        end

        if ev.button == MouseButton.middle then
            mouse.start = nil
            mouse.current = nil
            return
        end

        local sx, sy = table.unpack(mouse.start)
        local x, y = table.unpack(mouse.current)

        if mouse.drag then
            local i1, j1 = grid:getCellAt(table.unpack(mouse.start))
            local i2, j2 = grid:getCellAt(table.unpack(mouse.current))
            local di, dj = i2 - i1, j2 - j1

            if di ~= 0 or dj ~= 0 then
                local selected = {}
                local abort = false
                for i, j in grid:getAllSelected() do
                    i2, j2 = i + di, j + dj
                    if i2 <= 0 or j2 <= 0 or i2 > grid.rows or j2 > grid.cols then
                        abort = true
                        break
                    end
                    table.insert(selected, { i, j })
                end

                if not abort then
                    for _, e in ipairs(selected) do
                        local i, j = table.unpack(e)
                        local val = grid:getValue(i, j)
                        if val then
                            grid:setValue(i + di, j + dj, val)
                            grid:deselect(i, j)
                            grid:select(i + di, j + dj)
                            grid:setValue(i, j, nil)
                        end
                    end
                end
            end
        else
            if x == sx and y == sy then
                local i, j = grid:getCellAt(x, y)
                grid:select(i, j)
            else
                for _, elem in ipairs(grid:getCellsAt(sx, sy, x, y)) do
                    grid:select(elem[1], elem[2])
                end
            end
        end

        mouse.start = nil
        mouse.current = nil

        print("mouseup", x, y)
    end)

    canvas.onclick = function(_, e)
        local x, y = getMousePos(e)
        debug.innerHTML = [[
            <p>
                click pos: (]] .. x .. [[, ]] .. y .. [[)
            <p>
        ]]
    end

    local function loop()
        mainCtx:clearRect(0, 0, canvas.width, canvas.height)
        ctx:clearRect(0, 0, canvas.width, canvas.height)
        ctx:save()
        ctx:scale(scale, scale)
        ctx:translate(-origin.x, -origin.y)

        ctx.fillStyle = 'blue'
        ctx:fillRect(0, 0, 2, 2)

        for _, i, j in grid:iterateCells() do
            local a, b, c, d = grid:getBoundingRect(i, j)
            local selected = grid:isSelected(i, j)

            local val = grid:getValue(i, j)
            if val then
                ctx.fillStyle = (selected) and '#0f0' or '#0a0'
            else
                ctx.fillStyle = (selected) and '#333' or '#111'
            end
            ctx:fillRect(a, b, c, d)
        end

        if mouse.button ~= MouseButton.middle and mouse.start and mouse.current then
            if mouse.drag then
                local i1, j1 = grid:getCellAt(table.unpack(mouse.start))
                local i2, j2 = grid:getCellAt(table.unpack(mouse.current))
                local di, dj = i2 - i1, j2 - j1

                for i, j in grid:getAllSelected() do
                    local a, b, c, d = grid:getBoundingRect(i + di, j + dj)

                    local val = grid:getValue(i, j)
                    if val then
                        ctx.fillStyle = (selected) and '#f00' or '#a00'
                        ctx:fillRect(a, b, c, d)
                    end
                end
            else
                local sx, sy = table.unpack(mouse.start)
                local x, y = table.unpack(mouse.current)
                local w = x - sx
                local h = y - sy
                ctx.fillStyle = "#0ff2"
                ctx:fillRect(sx, sy, w, h)
            end
        end

        ctx:restore()

        mainCtx:drawImage(bufferCanvas, 0, 0)

        g:requestAnimationFrame(loop)
    end

    g:requestAnimationFrame(loop)
end

function main2()
    local table = document:querySelector("table")
    local selector = document:querySelector("#selector")

    local dragging = false;
    local clickX, clickY = -1, -1

    for i = 1, 100 do
        local tr = document:createElement("tr")
        for j = 1, 100 do
            local td = document:createElement("td")
            td.onclick = function(_, e)
                --td.classList:add("selected")
            end

            td.ondragstart = function(_, e)
                e:preventDefault()
            end

            td.onmousedown = function(_, e)
                console:log(e, table.clientTop)

                selector.style.left = e.layerX .. "px"
                selector.style.top = (e.layerY) .. "px"
                clickX, clickY = e.layerX, e.layerY
                dragging = true
            end
            td.onmousemove = function(_, e)
                if dragging then
                    local x = math.min(e.layerX, clickX)
                    local y = math.min(e.layerY, clickY)
                    selector.style.left = x .. "px"
                    selector.style.top = y .. "px"
                    selector.style.width = math.abs(e.layerX - clickX) .. "px"
                    selector.style.height = math.abs(e.layerY - clickY) .. "px"
                end
            end
            td.onmouseup = function(_, e)
                dragging = false
                selector.style.width = 0
                selector.style.height = 0
            end

            tr:appendChild(td)
        end
        table:appendChild(tr)
    end
end

main()
