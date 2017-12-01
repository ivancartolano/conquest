--local character = require "Character"
local sprite = require "Sprite"
local equipe = require "Equipe"

--stevenSprites = Sprite:preencherFrames(0,0,imageFile)
--garnetSprites = Sprite:preencherFrames(3,0,imageFile)
--amethystSprites = Sprite:preencherFrames(6,0,imageFile)
--pearlSprites = Sprite:preencherFrames(9,0,imageFile)

local stevenSprites
local garnetSprites
local amethystSprites
local pearlSprites 

local pinkVec = {}
local blueVec = {}
local greenVec = {}
local yellowVec = {}

local pinkTeam = equipe:new()
local blueTeam = equipe:new()
local greenTeam = equipe:new()
local yellowTeam = equipe:new()

local mapa = {}

		
	local pinkTeamMap = {
		{1,1,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0,0},
		{1,1,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0,0},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0,0,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0,0},
		{0,0,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0,0},
	}
	
	local blueTeamMap = {
		{0,0,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0,0},
		{0,0,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0,0},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{1,1,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0,0},
		{1,1,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0,0},
	}
	
	local greenTeamMap = {
		{0,0,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,1,1},
		{0,0,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,1,1},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0,0,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0,0},
		{0,0,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0,0},
	}
	
	local yellowTeamMap = {
		{0,0,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0,0},
		{0,0,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0,0},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25},
		{0,0,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,1,1},
		{0,0,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,1,1},
	}
		
	function mapa:preencherSprites(imageFile)
	print("mapa:preencherSprites()")
		stevenSprites = sprite:preencherFrames(0,0,imageFile)
		garnetSprites = sprite:preencherFrames(3,0,imageFile)
		amethystSprites = sprite:preencherFrames(6,0,imageFile)
		pearlSprites = sprite:preencherFrames(9,0,imageFile)
	end
	
	function mapa:carregar()
	print("mapa:carregar()")
		pinkTeam:carregar(pinkVec,1,1,1,stevenSprites, pinkTeamMap, blueTeamMap, greenTeamMap, yellowTeamMap, 250, 0, 199)
		blueTeam:carregar(blueVec,9,1,1,pearlSprites, blueTeamMap, pinkTeamMap, greenTeamMap, yellowTeamMap, 0, 0, 255)
		greenTeam:carregar(greenVec,1,19,1,amethystSprites, greenTeamMap, pinkTeamMap, blueTeamMap, yellowTeamMap, 0, 255, 0)
		yellowTeam:carregar(yellowVec,9,19,1,garnetSprites,yellowTeamMap,pinkTeamMap,blueTeamMap, greenTeamMap, 255,255,0)
	end
	
	function mapa:atualizar(dt)
	print("mapa:atualizar()")
		pinkTeam:atualizar(dt)
		blueTeam:atualizar(dt)
		greenTeam:atualizar(dt)
		yellowTeam:atualizar(dt)
	end
	
	
	function mapa:draw(grass, dirt, water, blueTileImage, blueTileQuad, brickTileImage, brickTileQuad, imageFile)
		local i
		local j
		
		local pink
		local blue
		local green 
		local yellow
		
		for i= 1, 10 do
			for j = 1, 20 do
				
				pink = pinkTeamMap[i][j]
				blue = blueTeamMap[i][j]
				green = greenTeamMap[i][j]
				yellow = yellowTeamMap[i][j]
				
				if ((pink > blue) and (pink > green) and (pink > yellow)) then
					love.graphics.setColor(255, 255, 255, 255 * pink)
					love.graphics.draw(grass, (j-1)*64, (i-1)*64)
					love.graphics.setColor(255,255,255,255)
				elseif ((blue > pink) and (blue > green) and (blue > yellow)) then
					love.graphics.setColor(255, 255, 255, 255 * blue)
					love.graphics.draw(dirt, (j-1)*64, (i-1)*64)
					love.graphics.setColor(255, 255, 255, 255)
				elseif ((green > pink) and (green > blue) and (green > yellow)) then
					love.graphics.setColor(255, 255, 255, 255 * green)
					love.graphics.draw(water, (j-1)*64, (i-1)*64)
					love.graphics.setColor(255, 255, 255, 255)
				elseif ((yellow > pink) and (yellow > blue) and (yellow > green))	then
					love.graphics.setColor(255, 255, 255, 255 * yellow)
					love.graphics.draw(brickTileImage, brickTileQuad, (j-1)*64, (i-1)*64)
					love.graphics.setColor(255, 255, 255, 255)
				else
					love.graphics.draw(blueTileImage, blueTileQuad, (j-1)*64, (i-1)*64)
				end
			end
		end --
		pinkTeam:desenhar(imageFile)
		blueTeam:desenhar(imageFile)
		greenTeam:desenhar(imageFile)
		yellowTeam:desenhar(imageFile)
	
	end
	
	return mapa