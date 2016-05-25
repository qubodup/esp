a = 100
b = 200

function love.draw()
  love.graphics.rectangle("fill",a,b,300,150)
end

function love.mousepressed(mx, my)
  local dir = "right"
  if mx < 400 then dir = "left" end
  if dir == "right" then a = a + 10 end
end
