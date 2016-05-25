function love.update()
  bild_aktuell = bild_zu
  if sound:isPlaying() then bild_aktuell = bild_auf end
end

function love.draw()
  love.graphics.draw( bild_aktuell, 0, 0 )
end
