love.load = function ()
    print('The game has been loaded')

    x = 0
    y = 150
    r = 30
    current_color = {1, 1, 1}
    foodPosition = {
     foodX = love.math.random() * 500,
     foodY = love.math.random() * 500
    } 
    
    
    seconds = 0
    
    love.draw = function ()
        if seconds < 15 then 
            love.graphics.print('This is a moving circle', 50, 50)
        end
        -- local clock_display = 'seconds ' .. math.floor(seconds)
        -- love.graphics.print(clock_display, 0, 0, 0, 2, 2)
        if seconds > 5 and seconds < 15 then
             love.graphics.print("You can also change it's color by pressing the corresponding buttons", 50, 75)
            end
        if seconds > 17 and seconds < 30 then
            love.graphics.print('Eat the small circles to grow bigger', 50, 50)
        end

        local sizeCounter = 'Your current size is ' .. r
         if seconds > 30 then
             love.graphics.print(sizeCounter, 0, 0, 0, 2, 2)
        end
        love.graphics.setColor(current_color)
        love.graphics.circle('fill', x, y, r)

     

    
    -- Det lilla objektet som ska ätas
        love.graphics.circle('line', foodPosition.foodX, foodPosition.foodY, 10)
           
    end
    
    
    
    
    love.keypressed = function (pressed_key)
        if pressed_key == 'b' then 
            current_color = {0, 0, 1}
        elseif pressed_key == 'g' then
            current_color = {0, 1, 0}
        elseif pressed_key == 'r' then
            current_color = {1, 0, 0}
        elseif pressed_key == 'y' then
            current_color = {1, 1, 0}
        
        end
    end
    
    love.update = function (dt)
     if x == foodPosition.foodX and y == foodPosition.foodY then
        r = r + 10
        foodPosition = {
            foodX = love.math.random() * 500,
            foodY = love.math.random() * 500
           }
     end
    

        seconds = seconds + dt
        if love.keyboard.isDown('right') then
            x = x + 1
        elseif love.keyboard.isDown('left') then
            x = x - 1
        elseif love.keyboard.isDown('up') then
            y = y - 1
        elseif love.keyboard.isDown('down') then
            y = y + 1
        end
        --  funkar ej
        if seconds == 10 then
            love.load()
    end 
    
    
    
end

end