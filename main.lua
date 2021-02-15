love.load = function ()
    print('The game has been loaded')
end

x = 0
r = 30
y = 150
current_color = {1, 1, 1}

seconds = 0

love.draw = function ()
    love.graphics.print('This is a moving and growing circle', 50, 50)
    local clock_display = 'seconds ' .. math.floor(seconds)
    love.graphics.print(clock_display, 0, 0, 0, 2, 2)
        if seconds > 5 then
            love.graphics.print("You can also change it's color", 50, 75)
        end
    love.graphics.setColor(current_color)
    love.graphics.circle('fill', x, y, r)
 
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
    r = r + dt
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
end