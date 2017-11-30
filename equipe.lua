local character = require "Character"

local Equipe = {personagens = {}, red, green, blue}

function Equipe:new(o)
		o =  {}
		setmetatable(o,self)
		self.__index = self
		return o
	end

function Equipe:carregar(vet, mapaX, mapaY, initialFrame, sprites, matTeam, rival1, rival2, rival3, r, g, b)
	
	personagens = vet
	
	self.red = r
	self.green = g
	self.blue = b
	
	local aux = character:new(mapaX, mapaY, initialFrame, sprites, matTeam, rival1, rival2, rival3)
	table.insert(personagens,aux)
	
	aux = character:new(mapaX + 1, mapaY, initialFrame, sprites, matTeam, rival1, rival2, rival3)
	table.insert(personagens,aux)
	
	aux = character:new(mapaX, mapaY + 1, initialFrame, sprites, matTeam, rival1, rival2, rival3)
	table.insert(personagens,aux)
	
	aux = character:new(mapaX + 1, mapaY + 1, initialFrame, sprites, matTeam, rival1, rival2, rival3)
	table.insert(personagens,aux)
	
end

function Equipe:atualizar(dt)
	for i, v in ipairs(self.personagens) do
		v:atualizar(dt)
	end
end

function Equipe:desenhar(imageFile)
	for i, v in ipairs(self.personagens) do
		v:desenhar(imageFile, self.red, self.green, self.blue)
	end
end

return Equipe