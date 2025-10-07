local Player = {}

function Player.initialize(screenWidth, screenHeight)

    Player.maxHealth = 3
    Player.currentHealth = 3
    Player.healthXPosition = screenWidth * 0
    Player.healthYPosition = screenHeight * 0

end

function Player.update(ball)

    if ball.y - ball.radius > Game.screenHeight then

        Player.currentHealth = Player.currentHealth - 1

    end
    
end

function Player.uiDraw()

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Remaining balls: " .. Player.currentHealth, Player.healthXPosition, Player.healthYPosition)

    
end

return Player   