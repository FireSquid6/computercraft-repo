while true do
	local distance = 0
	local full = false

	-- mine
	while !full do
		turtle.dig()
		turtle.forward()
		turtle.digDown()
		turtle.digUp()
	end

	-- dump inventory
end
