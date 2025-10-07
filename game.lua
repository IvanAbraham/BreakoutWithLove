Game = {}
local Ball = require("ball")
local Player = require("player")
local Pallet = require("pallet")
local Block = require("block")

function Game.initialize()
    Game.screenWidth = 600
    Game.screenHeight = 400
    Game.playingGame = false
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
end

function Game.draw()
    
    Pallet.draw()
    Ball.draw()
    Player.uiDraw()

    for _, block in ipairs(Game.blocks) do 
    
        Block.draw(block)
    
    end

end

return Game