local Block = {}

function Block.CreateBlock(x, y, screenHeight, screenWidth)
    
    local newBlock = 
    {
        x = x,
        y = y,
        width = screenWidth/ 7,
        height = screenHeight / 25,
        maxHealth = 3,
        currentHealth = 3
    }
    return newBlock

end

function CreateLevel(screenHeight, screenWidth)

    Block.CreateBlock(screenWidth / 2, 30, screenHeight, screenWidth)

end

return Block
