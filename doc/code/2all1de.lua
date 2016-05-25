function love.load()
  love.window.setMode( 1280, 720) -- Ändert Bildschirmgröße
  grasBild  = love.graphics.newImage( "grass.png" )
  katzeBild = love.graphics.newImage( "cat.png" )
  mausBild  = love.graphics.newImage( "mouse.png" )
  katzeX = 400 -- Position der Katze
  katzeY = 300
  mausX = 300  -- Position der Maus
  mausY = 150
  musik = love.audio.newSource( "music.ogg" )
  musik:setLooping( true )
  musik:play()
end

function love.draw()
  love.graphics.draw( grasBild, 0, 0 )
  love.graphics.draw( katzeBild, katzeX, katzeY )
  love.graphics.draw( mausBild, mausX, mausY )
end
