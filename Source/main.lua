import "CoreLibs/graphics"

local pd <const> = playdate
local gfx <const> = playdate.graphics

local playerX, playerY = 200, 120
local playerRadius = 10
local playerSpeed = 3

function playdate.update()
	gfx.clear()
	local crankAngle = math.rad(pd.getCrankPosition() or 0)
	local screenX = pd.display.getWidth() or 0
	local screenY = pd.display.getHeight() or 0
	playerX += math.sin(crankAngle) * playerSpeed
	playerY -= math.cos(crankAngle) * playerSpeed

	if playerX >= screenX + playerRadius then
		playerX -= screenX + playerRadius
	elseif playerX <= -playerRadius then
		playerX += screenX + playerRadius
	end

	if playerY >= screenY + playerRadius then
		playerY -= screenY + playerRadius
	elseif playerY <= -playerRadius then
		playerY += screenY + playerRadius
	end

	gfx.fillCircleAtPoint(playerX, playerY, playerRadius)
end