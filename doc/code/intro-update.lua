x = 100
y = 200

function love.draw()
  love.graphics.rectangle("fill",x,y,300,150)
end

function love.update()
  y = y - 1
end
