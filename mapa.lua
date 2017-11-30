local mapa = {}

	local bitmap = {
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4},
		{2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4},
		}
		
	
	function mapa:draw(grass, dirt, water, blueTileImage, blueTileQuad, brickTileImage, brickTileQuad)
		local i
		local j
		for i= 1, 10 do
			for j = 1, 20 do
				if (bitmap[i][j] == 1) then
					love.graphics.draw(grass, (j-1)*64, (i-1)*64)
				elseif (bitmap[i][j] == 4)	then
					love.graphics.draw(dirt, (j-1)*64, (i-1)*64)
				elseif (bitmap[i][j] == 2)	then
					love.graphics.draw(water, (j-1)*64, (i-1)*64)
				elseif (bitmap[i][j] == 0)	then
					--love.graphics.draw(water, (j-1)*64, (i-1)*64)
					love.graphics.draw(blueTileImage, blueTileQuad, (j-1)*64, (i-1)*64)
				else
					love.graphics.draw(brickTileImage, brickTileQuad, (j-1)*64, (i-1)*64)
				end
			end
		end
	
	end
	
	return mapa