function distanz( x1, y1, x2, y2 )
  a = x1 - x2
  b = y1 - y2
  return( math.sqrt( a^2 + b^2 ) )
end

function love.update()
  mausX = mausX + 7
  if mausX > 800 then
    mausX = -48
    mausY = love.math.random( 20, 400 )
  end
  if distanz( katzeX, katzeY, mausX, mausY ) < 40 then
    quietsch:play()
    mausX = 999
  end
  if distanz( katzeX, katzeY, klickX, klickY ) > 8 then
    diffX = klickX - katzeX
    diffY = klickY - katzeY
    norm = math.sqrt( diffX^2 + diffY^2 )
    einhX = diffX / norm
    einhY = diffY / norm
    katzeX = katzeX + einhX * 5
    katzeY = katzeY + einhY * 5
  end
end

function love.mousepressed( x, y )
  klickX = x
  klickY = y
  miau:play()
end
