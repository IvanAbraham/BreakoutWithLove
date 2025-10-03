Game = {}
local Ball = require("ball")
local Pallet = require("pallet")

function Game.initialize()
    Game.screenWidth = 600
    Game.screenHeight = 400
    Game.playingGame = false

    love.window.setMode(Game.screenWidth, Game.screenHeight, {resizable = false, vsync = false})

    Pallet.initialize(Game.screenWidth, Game.screenHeight)
    Ball.initialize(Game.screenWidth, Pallet)
    
    Game.ball = Ball
    Game.pallet = Pallet
end

function Game.update(dt)
    Pallet.update(dt)
    Ball.update(dt, Pallet)
    Ball.collision(Game.screenWidth, Game.screenHeight, Pallet)
end

function Game.draw()
    
    Pallet.draw()
    Ball.draw()

end

return Game