a = {100,200,500}

function love.draw()
  i = 1
  while i <= 3 do
    love.graphics.rectangle("fill",a[i],a[i],10,10)
    i = i + 1
  end
end

