x = 0

function love.draw()
  y = 0
  
  while y < 500 do
    love.graphics.rectangle("fill",x,y,300,150)
    y = y + 200
  end
end

function love.mousepressed(mx, my)
  x = x + 50
end
