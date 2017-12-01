local Character = {

	frames = {},
	activeFrame,
	currentFrame = 1,
	coordenadaMatricialX=1,
	coordenadaMatricialY=1,
	currentX,
	currentY,
	contadorIncremento = 0,
	elapsedTime = 0,
	acao,
	emMovimento= false,
	contador= 0,
	nome,
	deadlock = false,
	turno = 0,
	forca = 1,
	taxa,
	--team = {},
	rival1,
	rival2,
	rival3,


	--bitmap = {
	--	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	--	{1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1},
	--	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	--	{1,0,0,0,1,0,1,1,1,1,0,0,0,0,0,0,1,0,0,1},
	--	{1,0,0,0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,0,1},
	--	{1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,1},
	--	{1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,1,0,0,0,1},
	--	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	--	{1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1},
	--	{2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	--	},
		
	
	costmap	
		}
		
		
		
	local charmap = {
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		}
		
	
	function Character:new(o)
		o =  {}
		setmetatable(o,self)
		self.__index = self
		return o
	end
	
	local function matricialToGlobal(n)
		local aux = ((n -1)*64) + 16
		return aux
	end
	
	local team = {}
	
	function Character:carregar(coorMatricialX, coorMatricialY, initialFrame, sprites, parTeam, parRival1, parRival2, parRival3)
	print("character:carregar")	
		
		self.frames = sprites
		self.currentFrame = initialFrame
		self.activeFrame = self.frames[self.currentFrame]
		self.coordenadaMatricialX= coorMatricialX
		self.coordenadaMatricialY = coorMatricialY
		self.currentX = matricialToGlobal(coorMatricialY)
		self.currentY = matricialToGlobal(coorMatricialX)
		--self.team = parTeam
		team = parTeam
		self.rival1 = parRival1
		self.rival2 = parRival2
		self.rival3 = parRival3
		
		charmap[self.coordenadaMatricialX][self.coordenadaMatricialY] = 1
		
	end
	
	--function Character:most(x,y)
	--	local maximo = self.team[x][y]
	--	if (x < 10) then
	--		if (maximo < self.team[x + 1][y]) then
	--			maximo = self.team[x + 1][y]
	--		end
	--	end
	--	if (x > 1) then
	--		if (maximo < self.team[x - 1][y]) then
	--			maximo = self.team[x - 1][y]
	--		end
	--	end
	--	if (y < 20) then
	--		if (maximo < self.team[x][y + 1]) then
	--			maximo = self.team[x][y + 1]
	--		end
	--	end
	--	if ( y > 1) then 
	--		if (maximo < self.team[x][y - 1]) then
	--			maximo = self.team[x][y - 1]
	--		end
	--	end
	--	return maximo
	--end
	
	function Character:most(x,y)
		local maximo = team[x][y]
		if (x < 10) then
			if (maximo < team[x + 1][y]) then
				maximo = team[x + 1][y]
			end
		end
		if (x > 1) then
			if (maximo < team[x - 1][y]) then
				maximo = team[x - 1][y]
			end
		end
		if (y < 20) then
			if (maximo < team[x][y + 1]) then
				maximo = team[x][y + 1]
			end
		end
		if ( y > 1) then 
			if (maximo < team[x][y - 1]) then
				maximo = team[x][y - 1]
			end
		end
		return maximo
	end
	
	function Character:atualizar()
	print("character:atualizar")
		local r1= self.rival1[self.coordenadaMatricialX][self.coordenadaMatricialY] 
		local r2= self.rival2[self.coordenadaMatricialX][self.coordenadaMatricialY] 
		local r3= self.rival3[self.coordenadaMatricialX][self.coordenadaMatricialY] 

		if ((self.rival1[self.coordenadaMatricialX][self.coordenadaMatricialY] - (self.taxa* self.forca/3)) > 0 ) then 
			self.rival1[self.coordenadaMatricialX][self.coordenadaMatricialY] = self.rival1[self.coordenadaMatricialX][self.coordenadaMatricialY] - (self.taxa* self.forca/3)
		else	
			self.rival1[self.coordenadaMatricialX][self.coordenadaMatricialY] = 0 
		end
		
		if ((self.rival2[self.coordenadaMatricialX][self.coordenadaMatricialY] - (self.taxa* self.forca/3)) > 0 ) then 
			self.rival2[self.coordenadaMatricialX][self.coordenadaMatricialY] = self.rival2[self.coordenadaMatricialX][self.coordenadaMatricialY] - (self.taxa* self.forca/3)
		else	
			self.rival2[self.coordenadaMatricialX][self.coordenadaMatricialY] = 0 
		end
		
		if ((self.rival3[self.coordenadaMatricialX][self.coordenadaMatricialY] - (self.taxa* self.forca/3)) > 0 ) then 
			self.rival3[self.coordenadaMatricialX][self.coordenadaMatricialY] = self.rival3[self.coordenadaMatricialX][self.coordenadaMatricialY] - (self.taxa* self.forca/3)
		else	
			self.rival3[self.coordenadaMatricialX][self.coordenadaMatricialY] = 0 
		end
		
		self.team[coordenadaMatricialX][coordenadaMatricialY] = self.team[coordenadaMatricialX][coordenadaMatricialY] + (r1 - self.rival1[self.coordenadaMatricialX][self.coordenadaMatricialY])
		self.team[coordenadaMatricialX][coordenadaMatricialY] = self.team[coordenadaMatricialX][coordenadaMatricialY] + (r2 - self.rival2[self.coordenadaMatricialX][self.coordenadaMatricialY])
		self.team[coordenadaMatricialX][coordenadaMatricialY] = self.team[coordenadaMatricialX][coordenadaMatricialY] + (r3 - self.rival3[self.coordenadaMatricialX][self.coordenadaMatricialY])
		
		self.forca = self.team[coordenadaMatricialX][coordenadaMatricialY]
		
	end
	
	function Character:movimento(dt)
	
		print("character:movimento")
	
		if (not (self.emMovimento)) then
			movimentoPossivel = {}
			local coin = math.random(2)
		
			if (coin == 1) then -- random move  
			
				if (self.coordenadaMatricialX < 10) then
					if (charmap[self.coordenadaMatricialX+1][self.coordenadaMatricialY ] == 0)then
						table.insert(movimentoPossivel, 'down')
					end
				end
				if (self.coordenadaMatricialX > 1) then
					if (charmap[self.coordenadaMatricialX-1][self.coordenadaMatricialY ] == 0)then
						table.insert(movimentoPossivel, 'up')
					end
				end
				if (self.coordenadaMatricialY < 20) then
					if (charmap[self.coordenadaMatricialX][self.coordenadaMatricialY + 1 ] == 0)then
						table.insert(movimentoPossivel, 'right')
					end
				end
				if (self.coordenadaMatricialY > 1) then
					if (charmap[self.coordenadaMatricialX][self.coordenadaMatricialY + 1 ] == 0)then
						table.insert(movimentoPossivel, 'right')
					end
				end
				
			else -- greedy move
			
				local maximo = self:most(self.coordenadaMatricialX, self.coordenadaMatricialY)
				
				if (self.coordenadaMatricialX < 10) then
					if ((charmap[self.coordenadaMatricialX+1][self.coordenadaMatricialY ] == 0) and (self.team[self.coordenadaMatricialX+1][self.coordenadaMatricialY ] == maximo)) then
						table.insert(movimentoPossivel, 'down')
					end
				end
				if (self.coordenadaMatricialX > 1) then
					if ((charmap[self.coordenadaMatricialX-1][self.coordenadaMatricialY ] == 0) and (self.team[self.coordenadaMatricialX-1][self.coordenadaMatricialY ] == maximo)) then
						table.insert(movimentoPossivel, 'up')
					end
				end
				if (self.coordenadaMatricialY < 20) then
					if ((charmap[self.coordenadaMatricialX][self.coordenadaMatricialY + 1 ] == 0) and (self.team[self.coordenadaMatricialX][self.coordenadaMatricialY +1 ] == maximo)) then
						table.insert(movimentoPossivel, 'right')
					end
				end
				if (self.coordenadaMatricialY > 1) then
					if ((charmap[self.coordenadaMatricialX][self.coordenadaMatricialY + 1 ] == 0) and (self.team[self.coordenadaMatricialX][self.coordenadaMatricialY -1] == maximo))then
						table.insert(movimentoPossivel, 'right')
					end
				end
		
			end -- fim do else
			
			local movimentoEscolhido = movimentoPossivel[math.random(#movimentoPossivel)]		
		
			if movimentoEscolhido == 'down' then
				self.acao = self.moveDown
			elseif (movimentoEscolhido == 'up') then
				self.acao = self.moveUp
			elseif movimentoEscolhido == 'right' then
				self.acao = self.moveRight
			elseif movimentoEscolhido == 'left' then
				self.acao = self.moveLeft
			else
				self.acao = self.stand
			end
			
		end
		
		self:acao(dt)	
	end
	
	function Character:stand(dt)
		emMovimento = false
		charmap[self.coordenadaMatricialX][self.coordenadaMatricialY] = 1
	end

	function Character:moveDown(dt)
		self.elapsedTime = self.elapsedTime +dt
		self.emMovimento = true
		
		if (self.contadorIncremento == 0) then
			self.currentFrame = 1
			charmap[self.coordenadaMatricialX][self.coordenadaMatricialY] = 0
			charmap[self.coordenadaMatricialX + 1][self.coordenadaMatricialY] = 1
		end
		
		if (self.contadorIncremento<64) then
			if(self.elapsedTime > 0.15) then
				if (self.currentFrame < 3) then
					self.currentFrame = self.currentFrame + 1
				else
					self.currentFrame = 1
				end
				self.activeFrame = self.frames[self.currentFrame]
				self.elapsedTime = 0
			end
	
			self.currentY = self.currentY + 1
			self.contadorIncremento = self.contadorIncremento + 1
			
		
		else
			self.emMovimento = false
			self.contadorIncremento = 0
			self.coordenadaMatricialX = self.coordenadaMatricialX + 1
			self:atualizar()
		end
		
	end
	
	
	function Character:moveUp(dt)
		
		self.elapsedTime = self.elapsedTime +dt
		self.emMovimento = true
		
		if (self.contadorIncremento == 0) then
			self.currentFrame = 10
			charmap[self.coordenadaMatricialX][self.coordenadaMatricialY] = 0
			charmap[self.coordenadaMatricialX - 1][self.coordenadaMatricialY] = 1
		end
		
		if (self.contadorIncremento<64) then
			if(self.elapsedTime > 0.15) then
				if (self.currentFrame < 12) then
					self.currentFrame = self.currentFrame + 1
				else
					self.currentFrame = 10
				end
				self.activeFrame = self.frames[self.currentFrame]
				self.elapsedTime = 0
			end
	
			self.currentY = self.currentY - 1
			self.contadorIncremento = self.contadorIncremento + 1
		
		else
			self.emMovimento = false
			self.contadorIncremento = 0
			self.coordenadaMatricialX = self.coordenadaMatricialX - 1
			self:atualizar()
		end
		
	end
	
	
	function Character:moveRight(dt)
	
		self.elapsedTime = self.elapsedTime +dt
		self.emMovimento = true
		
		if (self.contadorIncremento == 0) then
			self.currentFrame = 7
			charmap[self.coordenadaMatricialX][self.coordenadaMatricialY] = 0
			charmap[self.coordenadaMatricialX][self.coordenadaMatricialY + 1] = 1
		end
		
		if (self.contadorIncremento<64) then
			if(self.elapsedTime > 0.15) then
				if (self.currentFrame < 9) then
					self.currentFrame = self.currentFrame + 1
				else
					self.currentFrame = 7
				end
				self.activeFrame = self.frames[self.currentFrame]
				self.elapsedTime = 0
			end
	
			self.currentX = self.currentX + 1
			self.contadorIncremento = self.contadorIncremento + 1
		
		else
			self.emMovimento = false
			self.contadorIncremento = 0
			self.coordenadaMatricialY = self.coordenadaMatricialY + 1
			self:atualizar()
		end
		
	end
	
	
	function Character:moveLeft(dt)
	
		self.elapsedTime = self.elapsedTime +dt
		self.emMovimento = true
		
		if (self.contadorIncremento == 0) then
			self.currentFrame = 4
			charmap[self.coordenadaMatricialX][self.coordenadaMatricialY] = 0
			charmap[self.coordenadaMatricialX][self.coordenadaMatricialY - 1] = 1
		end
		
		if (self.contadorIncremento<64) then
			if(self.elapsedTime > 0.15) then
				if (self.currentFrame < 6) then
					self.currentFrame = self.currentFrame + 1
				else
					self.currentFrame = 4
				end
				self.activeFrame = self.frames[self.currentFrame]
				self.elapsedTime = 0
			end
	
			self.currentX = self.currentX - 1
			self.contadorIncremento = self.contadorIncremento + 1
		
		else
			self.emMovimento = false
			self.contadorIncremento = 0
			self.coordenadaMatricialY = self.coordenadaMatricialY - 1
			self:atualizar()
		end
		
	end

	
	function Character:desenhar(imageFile, red, green, blue)
		--love.graphics.setColor(red,green,blue,150)
		love.graphics.setColor(red,green,blue,255*self.forca)
		love.graphics.circle("fill", self.currentX+16, self.currentY+ 16, 20)
		love.graphics.setColor(255,255,255,255)
		love.graphics.draw(imageFile, self.activeFrame, self.currentX, self.currentY)
	end
	
	return Character