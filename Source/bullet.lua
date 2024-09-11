local pd <const> = playdate
local gfx <const> = playdate.graphics

class('Bullet').extends(gfx.sprite)

function Bullet:init(x, y, speed)
  local bulletSize = 4
  local bulletImage = gfx.image.new(bulletSize * 2, bulletSize * 2)
  gfx.pushContext(bulletImage)
  gfx.drawCircleAtPoint(bulletSize, bulletSize, bulletSize)
  gfx.popContext()
  self:setImage(bulletImage)
  self:setCollideRect(0, 0, self:getSize())
  self:moveTo(x, y)
  self:add()

  self.speed = speed
end

function Bullet:update()
  local actualX, actualY, collisions, length = self:moveWithCollisions(self.x + self.speed, self.y)
  if length > 0 then
    for index, collisions in pairs(collisions) do
      if collisions['other']:isa(Enemy) then
        collisions['other']:remove()
        incrementScore()
        setShakeAmount(5)
      end
    end
    self:remove()
  elseif actualX > pd.display.getWidth() then
    self:remove()
  end
end
