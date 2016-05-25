function love.update()
  img_current = img_closed
  if sound:isPlaying() then img_current = img_open end
end

function love.draw()
  love.graphics.draw( img_current, 0, 0 )
end
