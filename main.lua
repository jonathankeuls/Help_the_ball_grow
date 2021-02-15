love.load = function ()
    print('The game has been loaded')
end

x = 0
r = 30
current_color = {1, 1, 1}

love.draw = function ()
    love.graphics.print('This is a moving and growing circle', 50, 50)
    love.graphics.setColor(current_color)
    love.graphics.circle('fill', x, 150, r)
    x = x + 0.5
end

love.update = function (dt)
    r = r + dt
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