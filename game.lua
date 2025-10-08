Game = {}
local Ball = require("ball")
local Player = require("player")
local Pallet = require("pallet")
local Block = require("block")

function Game.initialize()

    Game.screenWidth = 600
    Game.screenHeight = 400
    Game.playingGame = true
    Game.wonGame = false
    Game.blocks = {}

    love.window.setMode(Game.screenWidth, Game.screenHeight, {resizable = false, vsync = false})

    Pallet.initialize(Game.screenWidth, Game.screenHeight)
    Ball.initialize(Pallet, Game.screenWidth, Game.screenHeight)
    Player.initialize(Game.screenWidth, Game.screenHeight)
    Block.CreateLevel(Game.blocks, Game.screenWidth, Game.screenHeight)

    Game.ball = Ball
    Game.pallet = Pallet
end

function Game.update(dt)
  
    if Game.playingGame == true then

        Pallet.update(dt)
        Ball.update(dt, Pallet, Game.screenWidth, Game.screenHeight)
        Ball.collision(Game.screenWidth, Game.screenHeight, Pallet)
        Player.update(Ball)

        for i = #Game.blocks, 1, -1 do
            local block = Game.blocks[i]
            Block.collision(Ball, block)

            if block.currentHealth <= 0 then
                table.remove(Game.blocks, i)
            end
        end
        
        if Player.currentHealth < 0 then

            Game.playingGame = false
        
        end

        if #Game.blocks == 0 then
        
            Game.playingGame = false
            Game.wonGame = true
        
        end
    
    elseif  love.keyboard.isDown("space") then

        Game.initialize()

    end

end

function Game.draw()
    
    if Game.playingGame == true then 

        love.graphics.setBackgroundColor(0, 0, 0)
        Pallet.draw()
        Ball.draw()
        Player.uiDraw()

        for _, block in ipairs(Game.blocks) do 
        
            Block.draw(block)
        
        end
    
    end
    
    if Game.playingGame == false then
        
        love.graphics.setBackgroundColor(0, 0, 0)
        love.graphics.setColor(1, 1, 1)
                
        if Game.wonGame == true then
        
            local titleFont = love.graphics.newFont(60)
            love.graphics.setFont(titleFont)
            love.graphics.printf("YOU WIN!", 0, Game.screenHeight / 2 - 60, Game.screenWidth, "center")
            
            local subtitleFont = love.graphics.newFont(20)
            love.graphics.setFont(subtitleFont)
            love.graphics.printf("Press space to start again", 0, Game.screenHeight / 2 + 20, Game.screenWidth, "center")

        else 
        
           
            local titleFont = love.graphics.newFont(60)
            love.graphics.setFont(titleFont)
            love.graphics.printf("GAME OVER", 0, Game.screenHeight / 2 - 60, Game.screenWidth, "center")

            local subtitleFont = love.graphics.newFont(20)
            love.graphics.setFont(subtitleFont)
            love.graphics.printf("Press space to start again", 0, Game.screenHeight / 2 + 20, Game.screenWidth, "center")

        end

    end

end

return Game