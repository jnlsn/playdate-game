import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "player"
import "enemySpawner"
import "scoreDisplay"
import "screenShake"

local screenShakeSprite = ScreenShake()

local pd <const> = playdate
local gfx <const> = playdate.graphics

function resetGame()
	resetScore()
	clearEnemies()
	stopSpawner()
	startSpawner()
	setShakeAmount(10)
end

function setShakeAmount(amount)
	screenShakeSprite:setShakeAmount(amount)
end

createScoreDisplay()
Player(30, 120)
startSpawner()

function pd.update()
	gfx.sprite.update()
	pd.timer.updateTimers()
end
