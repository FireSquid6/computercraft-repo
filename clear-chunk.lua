LastTime = false


function Loop()
    if LastTime then
        return 0
    end

    -- if the block below is bedrock, set this as the last time
    local success, data = turtle.inspectDown()
    if success then
        if string.match(data.name, "bedrock") then
            LastTime = true
        end
    end

    -- go down a layer
    turtle.digDown()
    turtle.down()
    turtle.digDown()
    turtle.down()
    turtle.digDown()

    -- dig forward the whole area
    local dir = -1
    for i = 1, 16 do
        for i = 1, 15 do
            DigForward()
        end

        if i < 16 then
            if dir == -1 then
                turtle.turnLeft()
                DigForward()
                turtle.turnLeft()
            else
                turtle.turnRight()
                DigForward()
                turtle.turnRight()
            end
        end

        dir = dir * -1
    end

    -- go back to the start
    turtle.turnLeft()
    for i = 0, 15 do
        turtle.forward()
    end
    turtle.turnLeft()

    -- dump all items
    for i = 1, 16 do
        turtle.select(i)
        turtle.dropDown()
    end
    turtle.select(1)

    return 1
end

function DigForward()
    while turtle.detect() do
        turtle.dig()
    end
    turtle.forward()

    turtle.digUp()
    turtle.digDown()
end

while true do
    if Loop() == 0 then
        break
    end
end
