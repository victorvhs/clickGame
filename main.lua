function love.load()
	target = {}
	target.x = 300
	target.y = 300
	target.radius = 50

	score = 0
	timer = 10
	gameState = 1

	gameFont = love.graphics.newFont(45)

end

function love.update(dt)
	if timer > 0 and gameState == 2  then
		timer = timer - dt
	end

if timer < 0 then
		timer = 0
		gameState = 1
	end
end

function love.draw()
	love.graphics.setFont(gameFont)
	love.graphics.print("Pontos: " .. score)

	if gameState == 2 then
		love.graphics.setColor(0, 1, 0)
		love.graphics.circle("fill", target.x, target.y, target.radius)
	end

	if gameState == 1  and timer <= 0 then
		love.graphics.setColor(1, 0, 0)
		love.graphics.print("\nVocê fez:" .. score.." Pontos",(150) ,(love.graphics.getHeight()/2-50))
	end
	if gameState == 1 then
		love.graphics.setColor(1, 0, 0)
		love.graphics.print("Clique para começar",(150) ,(love.graphics.getHeight()/2-50))
	end
	
	love.graphics.setColor(1, 1, 1)
	love.graphics.print("Tempo: " .. math.ceil(timer), 400, 0)
end

function love.mousepressed(x, y, button, istouch)
	if button == 1 and gameState == 2 then
		if distanceBetween(target.x, target.y, love.mouse.getX(), love.mouse.getY()) < target.radius then
			score = score + 1
			target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
			target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
		end
	end

	if gameState == 1 then
		gameState = 2
		score = 0
		timer = 10
	end
end

function distanceBetween(x1, y1, x2, y2)
	return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end