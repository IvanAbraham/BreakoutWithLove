local Pallet = {}

function Pallet.initialize(screenWidth, screenHeight)
    Pallet.iddleBall = false
    Pallet.x = screenWidth / 2 - (screenWidth / 6) / 2  -- centrado
    Pallet.y = screenHeight - 30  -- cerca del fondo
    Pallet.width = screenWidth / 8
    Pallet.height = screenHeight / 35
    Pallet.speed = 300  -- velocidad en píxeles por segundo
    Pallet.screenWidth = screenWidth  -- guardamos para límites
end

function Pallet.update(dt)
    
    if love.keyboard.isDown("left", "a") then
        Pallet.x = Pallet.x - Pallet.speed * dt
    end
    
    if love.keyboard.isDown("right", "d") then
        Pallet.x = Pallet.x + Pallet.speed * dt
    end
    
    if love.keyboard.isDown("space") then
        Pallet.iddleBall = true
    end

    if Pallet.x <= 0 then
        Pallet.x = 0
    
    elseif Pallet.x + Pallet.width >= Pallet.screenWidth then
        Pallet.x = Pallet.screenWidth - Pallet.width
    end
end

function Pallet.draw()
    love.graphics.setColor(1, 1, 1) 
    love.graphics.rectangle("line", Pallet.x, Pallet.y, Pallet.width, Pallet.height)
end

return Pallet