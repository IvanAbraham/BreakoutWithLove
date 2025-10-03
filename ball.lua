local Ball = {}

function Ball.initialize(screenWidth, pallet)
        Ball.radius = screenWidth/80
        Ball.speed = 300
        Ball.x = pallet.x + (pallet.width / 2)
        Ball.y = pallet.y - Ball.radius - 5
    end



function Ball.update(dt, pallet)

    if pallet.iddleBall == true then
        Ball.x = Ball.x + Ball.speed * dt
        Ball.y = Ball.y - Ball.speed * dt
    elseif pallet.iddleBall == false then
        Ball.x = pallet.x + (pallet.width / 2)
        Ball.y = pallet.y - Ball.radius - 5
    end

end

function Ball.draw()

    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("line", Ball.x, Ball.y, Ball.radius)
    love.graphics.setColor(191/255, 191/255, 191/255)
    love.graphics.circle("line", Ball.x, Ball.y, Ball.radius - 3)
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", Ball.x, Ball.y, Ball.radius - 5)

end

return Ball