function love.load()
  love.window.setMode( 1280, 720) -- Changes screen size
  grassImg  = love.graphics.newImage( "grass.png" )
  catImg    = love.graphics.newImage( "cat.png" )
  mouseImg  = love.graphics.newImage( "mouse.png" )
  catX = 400 -- Position of the cat
  catY = 300
  mouseX = 300  -- Position of the mouse
  mouseY = 150
  musik = love.audio.newSource( "music.ogg" )
  musik:setLooping( true )
  musik:play()
end

function love.draw()
  love.graphics.draw( grassImg, 0, 0 )
  love.graphics.draw( catImg, catX, catY )
  love.graphics.draw( mouseImg, mouseX, mouseY )
end
