local mapa = require "mapa"
local tile = require "tile"
local character = require "character"
local sprite = require "Sprite"
local imageFile
local grassImage
local dirtImage
local waterImage
local brickSprite
local brickImage
local blueTileSprite
local blueTileImage
local snowSprite
local snowImage
local stevenSprite
local steven = character:new()

local contador = 0


function love.load()

	math.randomseed( os.time() )
	grassImage = love.graphics.newImage("images/grass64.png")
	dirtImage = love.graphics.newImage("images/dirt64.png")
	waterImage = love.graphics.newImage("images/water64.png")
	imageFile = love.graphics.newImage("images/steven-universe-sprites.png")
	
	brickImage = love.graphics.newImage("images/brick.png")
	brickSprite = tile:preencherQuad(0,0,brickImage)
	
	blueTileImage = love.graphics.newImage("images/blueTiles.png")
	blueTileSprite =tile:preencherQuad(0,0,blueTileImage)
	
	snowImage = love.graphics.newImage("images/snow512square.png")
	snowSprite =tile:preencherQuad(7,0,snowImage)
	
	stevenSprite = sprite:preencherFrames(0,0,imageFile)
	steven:carregar(5,11, 1, stevenSprite, imageFile)

end

function love.update(dt)
	
	
end


function love.draw()
	
	mapa:draw(grassImage, dirtImage, waterImage, snowImage, snowSprite, brickImage, brickSprite )
	steven:desenhar(imageFile, 250, 0, 199)
end



