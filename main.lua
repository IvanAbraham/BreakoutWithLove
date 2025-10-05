local Game = require("game")

function love.load()
   Game.initialize()
end

function love.update(dt)
    Game.update(dt)
end

function love.draw()
    Game.draw()
end
    


