local pd <const> = playdate
local gfx <const> = playdate.graphics

local scoreSprite
local score

function createScoreDisplay()
  scoreSprite = gfx.sprite.new()
  score = 0
  updateDisplay()
  if scoreSprite then
    scoreSprite:setCenter(0, 0)
    scoreSprite:moveTo(320, 0)
    scoreSprite:add()
  end
end

function updateDisplay()
  local scoreText = "Score: " .. score
  local textWidth, textHeight = gfx.getTextSize(scoreText)
  local scoreImage = gfx.image.new(textWidth, textHeight)
  gfx.pushContext(scoreImage)
  gfx.drawText(scoreText, 0, 0)
  gfx.popContext()
  scoreSprite:setImage(scoreImage)
end

function incrementScore()
  score += 1
  updateDisplay()
end

function resetScore()
  score = 0
  updateDisplay()
end
