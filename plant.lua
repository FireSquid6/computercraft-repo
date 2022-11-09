function Loop()
    -- grab all saplings
    if turtle.getItemCount() < 2 then
        turtle.suckDown()
    end

    -- move through planters
    local distance_from_spawn = 0
    while not turtle.inspect() do
        -- if there isn't enough saplings
        if turtle.getItemCount() < 2 then
            break
        end

        -- plant
        turtle.suck()
        turtle.suckDown()

        turtle.turnLeft()
        turtle.suck()
        turtle.place()
        turtle.turnRight()

        -- move forward
        turtle.forward()
        distance_from_spawn = distance_from_spawn + 1
    end

    -- dump all items
    for i = 1, 16 do
        turtle.select(i)

        turtle.dropDown()
    end
    turtle.select(1)

    -- move back
    while distance_from_spawn > 0 do
        turtle.back()
        distance_from_spawn = distance_from_spawn - 1
    end


end

while true do
    if Loop() == 0 then
        break
    end
end
