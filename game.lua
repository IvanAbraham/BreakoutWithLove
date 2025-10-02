local Game = {}
local Ball = require("ball")
local Pallet = require("pallet")

function Game.initialize()
    Game.screenWidth = 600
    Game.screenHeight = 400
        
    love.window.setMode(Game.screenWidth, Game.screenHeight, {resizable = false, vsync = false})

    -- Inicializar pallet primero
    Pallet.initialize(Game.screenWidth, Game.screenHeight)
    
    -- Luego inicializar ball (necesita las coordenadas del pallet)
    Ball.initialize(Game.screenWidth, Pallet)
    
    -- Guardar referencias para fácil acceso
    Game.ball = Ball
    Game.pallet = Pallet
end

return Game