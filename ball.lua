local Ball = {}

function Ball.initialize(screenWidth, pallet)
    Ball.radius = screenWidth/12
    Ball.speed = 15
    Ball.x = pallet.x + (pallet.width / 2)
    Ball.y = pallet.y - Ball.radius - 5
    Ball.vx = 0  -- velocidad inicial
    Ball.vy = -Ball.speed  -- velocidad inicial hacia arriba
end

return Ball