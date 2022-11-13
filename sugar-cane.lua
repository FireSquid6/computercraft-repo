while true do
    -- collect sugar cane until a wall is hit
    local distance = 0
    while true do
        local success, data = turtle.inspect()

        if success then
            if not string.match(data.name, "sugar") then
                break
            end
        end

        turtle.dig()
        turtle.forward()
        distance = distance + 1
    end

    -- go backwards
    turtle.turnRight()
    turtle.turnRight()
    while distance > 0 do
        turtle.suckDown()
        turtle.dig()
        turtle.forward()
        distance = distance - 1
    end

    -- drop items
    for i = 1, 16 do
        turtle.select(i)

        turtle.dropDown()
    end
    turtle.select(1)

    -- turn around
    turtle.turnRight()
    turtle.turnRight()
end
