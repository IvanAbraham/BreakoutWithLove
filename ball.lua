local Ball = {}

function Ball.initialize(screenWidth, pallet)
        Ball.radius = screenWidth/80
        Ball.speed = 300
        Ball.x = pallet.x + (pallet.width / 2)
        Ball.y = pallet.y - Ball.radius - 5
        Ball.ySpeed = -Ball.speed
        Ball.xSpeed = -Ball.speed
end

function Ball.update(dt, pallet)

    if  pallet.iddleBall == false then
         Ball.x = Ball.x + Ball.xSpeed * dt
         Ball.y = Ball.y + Ball.ySpeed * dt
    elseif pallet.iddleBall == true then
         Ball.x = pallet.x + (pallet.width / 2)
         Ball.y = pallet.y - Ball.radius - 5
    end

end

function Ball.collision(screenWidth, screenHeight, pallet)
    if pallet.iddleBall == false then

        --Ball colision against pallet
        if  Ball.y + Ball.radius >= pallet.y and
            Ball.y - Ball.radius <= pallet.y and
            Ball.x >= pallet.x and
            Ball.x <= pallet.x + pallet.width
             then
            
            --Black magic that calculates the position of the ball when colliding, 
            local hitPos = (Ball.x - (pallet.x + pallet.width / 2)) / (pallet.width / 2)
            local bounceAngle = -math.pi/2 + hitPos * (math.pi/3)
            local palletFactor = pallet.speed or 0
            
            Ball.xSpeed = math.cos(bounceAngle) * Ball.speed + palletFactor * 0.5
            Ball.ySpeed = math.sin(bounceAngle) * Ball.speed 
            Ball.y = pallet.y - Ball.radius
        end
        
        --Horizontal collision
        if  Ball.x + Ball.radius >= screenWidth then
            Ball.x = screenWidth - Ball.radius
            Ball.xSpeed = -math.abs(Ball.xSpeed)
        
        elseif Ball.x - Ball.radius <= 0 then
            Ball.x = Ball.radius
            Ball.xSpeed = math.abs(Ball.xSpeed)
        end
        --Roof collision 
        if  Ball.y - Ball.radius <= 0 then
            Ball.y = Ball.radius
            Ball.ySpeed = math.abs(Ball.ySpeed)
        end
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