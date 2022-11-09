function Loop()
    local distance_from_spawn = 0

    -- check every space
    while true do
        -- break if there's a block in front of the turtle
        if turtle.inspect() then
            break
        end

        -- turn right and dig the tree
        turtle.turnRight()
        DigTree()
        turtle.turnLeft()
        turtle.forward()


        -- add to distance from spawn
        distance_from_spawn = distance_from_spawn + 1
    end

    -- dump all items
    for i = 1, 16 do
        turtle.select(i)
        turtle.dropDown()
    end
    turtle.select(1)

    -- go back
    while distance_from_spawn > 0 do
        turtle.back()
        distance_from_spawn = distance_from_spawn - 1
    end

    return 1
end

function CheckTree(method)
    local success, data = method()
    if success then
        return string.match(data.name, "log")
    end

    return false
end

function DigTree()
    if CheckTree(turtle.inspect) then
        turtle.dig()
        turtle.forward()

        -- dig up the tree
        local height = 0
        while CheckTree(turtle.inspectUp) do
            turtle.digUp()
            turtle.up()
            height = height + 1
        end

        -- go down the tree
        while height > 0 do
            turtle.digDown()
            turtle.down()
            height = height - 1
        end

        turtle.back()
    end
end

while true do
    if Loop() == 0 then
        break
    end
end
