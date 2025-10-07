local Pallet = {}

function Pallet.initialize(screenWidth, screenHeight)
    Pallet.idleBall = true
    Pallet.x = screenWidth / 2 - (screenWidth / 6) / 2  
    Pallet.y = screenHeight - 30  
    Pallet.width = screenWidth / 8
    Pallet.height = screenHeight / 35
    Pallet.speed = 400  
    Pallet.screenWidth = screenWidth  
end

function Pallet.update(dt)
    
    if love.keyboard.isDown("left", "a") then
        Pallet.x = Pallet.x - Pallet.speed * dt
    end
    
    if love.keyboard.isDown("right", "d") then
        Pallet.x = Pallet.x + Pallet.speed * dt
    end
    
    if love.keyboard.isDown("space") then
        Pallet.idleBall = false
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