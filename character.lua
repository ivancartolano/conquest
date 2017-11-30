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


	bitmap = {
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1},
		{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
		{1,0,0,0,1,0,1,1,1,1,0,0,0,0,0,0,1,0,0,1},
		{1,0,0,0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,0,1},
		{1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,1},
		{1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,1,0,0,0,1},
		{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
		{1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1},
		{2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		},
		
	
	costmap	
		}
		
		
		
	local charmap = {
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
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
	
	function Character:carregar(coorMatricialX, coorMatricialY, initialFrame, sprites,imageFile)
	--function Character:carregar(mapaX,mapaY, coorMatricialX, coorMatricialY, initialFrame, sprites,imageFile, onome, individualMap)
		
		self.frames = sprites
		self.currentFrame = initialFrame
		self.activeFrame = self.frames[self.currentFrame]
		self.coordenadaMatricialX= coorMatricialX
		self.coordenadaMatricialY = coorMatricialY
		self.currentX = matricialToGlobal(coorMatricialY)
		self.currentY = matricialToGlobal(coorMatricialX)
		--self.nome = onome
		--self.costmap = individualMap
		
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
		end
		
	end

	
	function Character:desenhar(imageFile, red, green, blue)
		love.graphics.setColor(red,green,blue,150)
		love.graphics.circle("fill", self.currentX+16, self.currentY+ 16, 20)
		love.graphics.setColor(255,255,255,255)
		love.graphics.draw(imageFile, self.activeFrame, self.currentX, self.currentY)
	end
	
	return Character