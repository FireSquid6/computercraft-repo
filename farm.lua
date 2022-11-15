LastTime = false


function Loop()
    if LastTime then
        return 0
    end

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
    for i = 1, 15 do
        turtle.forward()
    end
    turtle.turnLeft()

    -- dump all items
    for i = 2, 16 do
        turtle.select(i)
        turtle.dropUp()
    end
    turtle.select(1)

    return 1
end

function DigForward()
    local success, data = turtle.inspectDown()
    if success then
        if data.state.age == 7 then
            print("Mined Wheat")
            turtle.digDown()
        end
    end

    Replant()
    turtle.forward()


end

function Replant()
    turtle.select(1)
    turtle.placeDown()
end

while true do
    if Loop() == 0 then
        break
    end
end
