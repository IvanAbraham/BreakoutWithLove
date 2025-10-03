local Ball = {}

function Ball.initialize(screenWidth, pallet)
        Ball.radius = screenWidth/80
        Ball.speed = 500
        Ball.x = pallet.x + (pallet.width / 2)
        Ball.y = pallet.y - Ball.radius - 5
        Ball.ySpeed = -Ball.speed
        Ball.xSpeed = 0
end

function Ball.update(dt, pallet)

    if  pallet.idleBall == false then
         Ball.x = Ball.x + Ball.xSpeed * dt
         Ball.y = Ball.y + Ball.ySpeed * dt
    elseif pallet.idleBall == true then
         Ball.x = pallet.x + (pallet.width / 2)
         Ball.y = pallet.y - Ball.radius - 5
    end

end

function Ball.collision(screenWidth, screenHeight, pallet)
    if pallet.idleBall == false then

        local function NormalizeSpeed()
            
            local currentSpeed = math.sqrt(Ball.xSpeed^2 + Ball.ySpeed^2)
            
            if currentSpeed > 0 then
                local factor = Ball.speed / currentSpeed
                Ball.xSpeed = Ball.xSpeed * factor
                Ball.ySpeed = Ball.ySpeed * factor
            end
        end

        --Ball colision against pallet
        if  Ball.y + Ball.radius >= pallet.y and Ball.y - Ball.radius <= pallet.y and   
            Ball.x >= pallet.x and Ball.x <= pallet.x + pallet.width then
            
                --Calculate the angle and position in which the ball colides against the pallet
                local hitPos = (Ball.x - (pallet.x + pallet.width / 2)) / (pallet.width / 2)
                local bounceAngle = -math.pi/2 + hitPos * (math.pi/3)
                
                --The ball bounces taking into account the position of the pallet in which it collides 
                Ball.xSpeed = math.cos(bounceAngle) * Ball.speed
                Ball.ySpeed = math.sin(bounceAngle) * Ball.speed 
                Ball.y = pallet.y - Ball.radius
                NormalizeSpeed()
               
        end
        
        --Horizontal collision
        if  Ball.x + Ball.radius >= screenWidth then
            Ball.x = screenWidth - Ball.radius
            Ball.xSpeed = Ball.xSpeed * -1
            NormalizeSpeed()
        
        elseif Ball.x - Ball.radius <= 0 then
            Ball.x = Ball.radius
            Ball.xSpeed = Ball.xSpeed * -1
            NormalizeSpeed()
        end
        --Roof collision 
        if  Ball.y - Ball.radius <= 0 then
            Ball.y = Ball.radius
            Ball.ySpeed = Ball.ySpeed * -1
            NormalizeSpeed()
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