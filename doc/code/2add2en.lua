function distance( x1, y1, x2, y2 )
  a = x1 - x2
  b = y1 - y2
  return( math.sqrt( a^2 + b^2 ) )
end

function love.update()
  mouseX = mouseX + 7
  if mouseX > 800 then
    mouseX = -48
    mouseY = love.math.random( 20, 400 )
  end
  if distance( catX, catY, mouseX, mouseY ) < 40 then
    squeak:play()
    mouseX = 999
  end
  if distance( catX, catY, clickX, clickY ) > 8 then
    diffX = clickX - catX
    diffY = clickY - catY
    norm = math.sqrt( diffX^2 + diffY^2 )
    unitX = diffX / norm
    unitY = diffY / norm
    catX = catX + unitX * 5
    catY = catY + unitY * 5
  end
end

function love.mousepressed( x, y )
  clickX = x
  clickY = y
  meow:play()
end
