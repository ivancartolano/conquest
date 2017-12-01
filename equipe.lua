local character = require "Character"

local Equipe = {personagens = {}, red, green, blue}

function Equipe:new(o)
		o =  {}
		setmetatable(o,self)
		self.__index = self
		return o
	end

function Equipe:carregar(vet, mapaX, mapaY, initialFrame, sprites, matTeam, rival1, rival2, rival3, r, g, b, name)
print("equipe:carregar")
	
	self.personagens = vet
	
	self.red = r
	self.green = g
	self.blue = b
	
	local aux1 = character:new()
	aux1:carregar(mapaX, mapaY, initialFrame, sprites, matTeam, rival1, rival2, rival3, name)
	table.insert(self.personagens,aux1)
	
	local aux2 = character:new()
	aux2:carregar(mapaX + 1, mapaY, initialFrame, sprites, matTeam, rival1, rival2, rival3, name)
	table.insert(self.personagens,aux2)
	
	local aux3 = character:new()
	aux3:carregar(mapaX, mapaY + 1, initialFrame, sprites, matTeam, rival1, rival2, rival3, name)
	table.insert(self.personagens,aux3)
	
	local aux4 = character:new()
	aux4:carregar(mapaX + 1, mapaY + 1, initialFrame, sprites, matTeam, rival1, rival2, rival3, name)
	table.insert(self.personagens,aux4)
	
end

function Equipe:atualizar(dt)
print("equipe:atualizar")
	for i, v in ipairs(self.personagens) do
		v:movimento(dt)
	end
end

function Equipe:desenhar(imageFile)
print("equipe:desenhar----------------")
print("tamanho do vetor =".. #self.personagens)
	for i, v in ipairs(self.personagens) do
		v:desenhar(imageFile, self.red, self.green, self.blue)
		print(v.nome)
	end
end

return Equipe