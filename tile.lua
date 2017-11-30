local Tile = {}


function Tile:preencherQuad(x, y, imageFile)

	local newTile = love.graphics.newQuad(x*64,y*64,64,64, imageFile:getDimensions())
	
	return newTile
	
end

return Tile