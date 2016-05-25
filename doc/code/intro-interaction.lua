x = 100
y = 200

function love.draw()
  love.graphics.line(100,0,x,y)
  love.graphics.line(0,200,x,y)
  love.graphics.rectangle("fill",x,y,300,150)
end

function love.mousepressed()
  x = x + 10
end
