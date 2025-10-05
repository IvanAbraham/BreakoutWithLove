Game = {}
local Ball = require("ball")
local Pallet = require("pallet")
local Block = require("block")

function Game.initialize()
    Game.screenWidth = 600
    Game.screenHeight = 400
    Game.playingGame = false

    love.window.setMode(Game.screenWidth, Game.screenHeight, {resizable = false, vsync = false})

    Pallet.initialize(Game.screenWidth, Game.screenHeight)
    Ball.initialize(Pallet, Game.screenWidth, Game.screenHeight)
    
    Game.ball = Ball
    Game.pallet = Pallet
end

function Game.update(dt)
    Pallet.update(dt)
    Ball.update(dt, Pallet, Game.screenWidth, Game.screenHeight)
    Ball.collision(Game.screenWidth, Game.screenHeight, Pallet)
end

function Game.draw()
    
    Pallet.draw()
    Ball.draw()

end

return Game