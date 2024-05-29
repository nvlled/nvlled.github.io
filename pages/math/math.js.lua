local g = js.global
local document = g.document

local function gcd(a, b)
    if b > a then
        a, b = b, a
    end
    while b > 0 do
        a, b = b, a % b
    end
    return a
end


local function generate1(x)
    local table = document:querySelector("table#result")
    local thead = document:createElement("thead")
    local tbody = document:createElement("tbody")
    local tfoot = document:createElement("tfoot")

    table.innerHTML = ""
    thead.innerHTML = [[
    ]]

    table:appendChild(thead)
    table:appendChild(tbody)
    table:appendChild(tfoot)

    local a = math.floor(x ^ 0.5)
    local b = a
    local c = x - a * b

    if c > b then
        b = b + (c // b)
        c = x - a * b
    end

    local d = 0
    local e = 0
    local step = 1
    local firstFactorFound = nil
    local loops = 0
    local i = 0

    while a >= 2 do
        if a == 2 then
            step = 1
        end

        if not firstFactorFound then
            if c == 0 then
                firstFactorFound = a
            else
                local n = gcd(a * b, c)
                if n > 1 then
                    firstFactorFound = n
                end
            end
            loops = loops + 1
        end

        local row = document:createElement("tr")
        row.innerHTML = [[
            <td>]] .. i + 1 .. [[</td>
            <td>]] .. a .. [[</td>
            <td>]] .. b .. [[</td>
            <td>]] .. c .. [[</td>
            <td>]] .. d .. [[</td>
            <td>]] .. e .. [[</td>
            <td>]] .. a * b + c .. [[</td>
        ]]
        tbody:appendChild(row)

        local a_, b_, c_
        a_      = a - step
        d       = b * step + c
        e       = d // a_
        b_      = b + e
        c_      = d - a_ * e

        i       = i + 1
        a, b, c = a_, b_, c_

        -- aha, it's prime time to test my totally
        -- unfounded conjecture again:
        -- that I only need to test the first few values of a to find one of factor,
        -- (maybe two or three loops, give or take), otherwise it's a prime.
        -- As usual, I just need to find a counterexample to
        -- disprove it.
        -- Or not, 4079*7919 still disproves it...
        -- The problem is the fixed step size.
        -- e is mostly just 1 or 2 for the first few thousands,
        -- so b changes very slow too,
        -- which not how I expected the algorithm to behave.
        -- There should be a way to know if it's okay to skip 
        -- a few steps per iteration.
        --
        -- I have another algorithm to test, but this one seems
        -- to be the more promising one.
        --
    end

    thead.innerHTML = [[

        <tr><th colspan="5">
            first factor found: ]] .. (firstFactorFound or "") .. [[
            <br />
            loops: ]] .. loops .. [[
        </th></tr>
        <tr>
            <th>i</th>
            <th>a</th>
            <th>b</th>
            <th>c</th>
            <th>d</th>
            <th>e</th>
            <th></th>
        </tr>
    ]]
end

-- Okay, after some more scribbling,
-- blindly incrementing a factor
-- is the lazy but easy way of implementing
-- the algorithm. There's no reason for this though
-- since there's a structure and symmetry when
-- it comes to multiplication. I'm using the
-- formula (a+n)b + c - bn, which sure enough,
-- is still equal to ab + c. But I were to
-- represent multiplication as a grid, it would be
-- * * * * * .. a .. *
--             ..
--              b
--             ..
-- * * * * * .. a .. *
-- If I were to chip away one row (a-1)
-- then those excess * would be additional columns (b+1).
-- Meaning, adding or subtracting to one factor should
-- result to the corresponding subtraction or addition to
-- the other factor. Thus, I should  be able to reduce
-- the amount of sqrt(n) iterations by something like 1/2 to 3/4?
-- I haven't done the full math though, but that's the idea.
-- That's still a programmer solution though of looping through
-- possible answers.
--
-- The holy grail though would find the deeper meaning of symmetry
-- behind multiplication. What do I mean by this? Finding
-- factors utlimately means aligning a bunch of sticks (units)
-- into a nice perfect rectangle. For prime numbers, it
-- means I can never align them in a rectangle, only a single
-- straight line.
-- It's such a primitive concept, if I think about it.
-- I'm just a mere caveman aligning my bonksticks to
-- shoo the incoming dinosaurs away.
-- But surely, there's another way of representing
-- this concept, other than perfect rectangles?
-- Well, that question has been on mind for god knows
-- how long now, days, week?
--
-- Why do I even want to know though? There's no reward
-- in this. In fact, I think it's even dangerous to
-- ask such questions. Maybe the question is so hard
-- even the brightest minds of the current and past
-- generations have not solved it. Or, they were silenced,
-- the truth buried, to maintain current technological stability.
-- Aha, this is a good plot for a sci-fi story.

local function main()
    local form = document:querySelector("form")
    local fill = form:querySelector("#fill")
    local run = form:querySelector("#run")
    local xInput = form:querySelector("#x")
    local aInput = form:querySelector("#a")
    local bInput = form:querySelector("#b")
    local cInput = form:querySelector("#c")

    run:addEventListener("click", function(_, e)
        e:preventDefault()
        local x = tonumber(xInput.value) or 0
        --local a = tonumber(aInput.value) or 0
        --local b = tonumber(bInput.value) or 0
        --local c = tonumber(cInput.value) or 0
        generate1(x)
    end)

    fill:addEventListener("click", function(_, e)
        e:preventDefault()

        local x = tonumber(xInput.value)
        local a = tonumber(aInput.value)
        local b = tonumber(bInput.value)
        local c = tonumber(cInput.value)

        if not x and a and b then
            xInput.value = a * b + (c or 0)
            print(xInput.value)
        end
        if x and a and not b then
            bInput.value = a
        end
        if x and (not a and not b or x and x ~= a * b + (c or 0)) then
            local n = math.floor(math.sqrt(x))
            aInput.value = n
            bInput.value = n
            cInput.value = x - n ^ 2
        end
    end)
end

main()
