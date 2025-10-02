local Ball = {}

function Ball.initialize(screenWidth, pallet)
        Ball.radius = screenWidth/12
        Ball.speed = 15
        Ball.x = pallet.x + (pallet.width / 2)
        Ball.y = pallet.y - Ball.radius - 5
    end



function Ball.update(dt)

    if pallet.iddleBall = true then
        Ball.x = Ball.x + Ball.speed * dt
        Ball.y = Ball.y + Ball.speed * dt
    elseif
        Ball.x = pallet.x + (pallet.width / 2)
        Ball.y = pallet.y - Ball.radius - 5
    end

end

return Ball