love.load = function ()
    print('The game has been loaded')

    width = love.graphics.getWidth()
    height = love.graphics.getHeight()

    x = 0
    y = 150
    r = 30
    current_color = {1, 1, 1}
    foodPosition = {
     foodX = love.math.random() * width,
     foodY = love.math.random() * height
    }   

    seconds = 0
    
    love.draw = function ()
        if seconds < 10 then 
            love.graphics.print('This is a moving circle', 50, 50)
        end
        if seconds > 5 and seconds < 10 then 
            love.graphics.print("Use the arrow keys to move", 50, 75)
        end
        if seconds > 10 and seconds < 16 then
             love.graphics.print("You can change it's color by pressing the first letter of each color", 50, 50)
        end
        if seconds > 16 and seconds < 21 then
            love.graphics.print('Eat the small circles to grow bigger', 50, 50)
        end
        if seconds > 23 and seconds < 28 then
            love.graphics.print('Get to size 200 to win', 50, 50)
        end
        local sizeCounter = 'Your current size is ' .. r
         if seconds > 27 then
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
        elseif pressed_key == 'p' then
            current_color = {1, 0, 1}
        elseif pressed_key == 'o' then
            current_color = {1, 0.64705882352941, 0}
        end
    end

    love.update = function (dt)
    
     dx = x - foodPosition.foodX;
     dy = y - foodPosition.foodY;
     distance = math.sqrt(dx * dx + dy * dy);
     if (distance < r + 10) then 
     r = r + 10

        foodPosition = {
            foodX = love.math.random() * width,
            foodY = love.math.random() * height
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
        
        if r == 200 then
          love.load()
        end
    end
end

