function love.load()
  sound = love.audio.newSource( "meow1.ogg" )
end

function love.mousepressed()
  sound:play()
end
