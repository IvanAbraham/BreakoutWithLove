local Block = {}

function Block.CreateBlock(x, y, screenWidth, screenHeight)
    
    local newBlock = 
    {
        x = x,
        y = y,
        width = screenWidth/ 7,
        height = screenHeight / 25,
        maxHealth = 3,
        currentHealth = 3
    }
    return newBlock

end

function CreateLevel(screenWidth, screenHeight)

    Block.CreateBlock(screenWidth / 2, 30, screenHeight, screenWidth)

end

function Block.collision(ball, block)

    if block.currentHealth <= 0 then
    
        return
    
    end

    if ball.x + ball.radius >=  block.x and ball.x - ball.radius <= block.x + block.width and 
    ball.y  + ball.radius >= block.y and ball.y - ball.radius <= block.y + block.height then

        block.currentHealth = block.currentHealth -1
    
        if ball.x <  block.x or ball.x > block.x + block.width then
            
            ball.xSpeed = ball.xSpeed * -1 

        end

        if ball.y > block.y or ball.y > block.y + block.height then

            ball.ySpeed = ball.ySpeed * -1    
        
        end 

    end
end

function Block.draw(block)
    
    if block.currentHealth > 0 then
        
        if block.currentHealth == 3 then
        
            love.graphics.setColor(102/255, 1, 1)
        
        elseif block.currentHealth == 2 then
        
            love.graphics.setColor(1, 1, 0)

        elseif block.currentHealth == 1 then

            love.graphics.setColor(1, 0, 0)

        end

        love.graphics.rectangle("line", block.x, block.y, block.width, block.height)
    
    end
end

return Block
