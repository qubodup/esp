function love.load()
  la, lg = love.audio, love.graphics
  names = { "lead", "drums", "drumsb", "clap" }
  instr = {{},{}}        -- Table of instruments with...
  for i = 1, 2 do        -- two rows and...
    for j = 1, #names do -- four columns
      instr[i][j] = {}
      instr[i][j].snd = la.newSource( names[j] .. i .. ".ogg" )
      instr[i][j].snd:setLooping( true ) -- Endless looping on
      instr[i][j].snd:setVolume( 0 )     -- Loudness to 0
      instr[i][j].snd:play()             -- Track playback starts
      instr[i][j].color = { 60*j, love.math.random(200), 200 }
    end
  end
  columns = #instr[1]       -- 4 columns
  rows    = #instr          -- 2 rows
  width   = lg.getWidth()   -- Screen size
  height  = lg.getHeight()
  fieldW  = width / columns -- Touch field size
  fieldH  = height / rows
end

function love.draw()
  for i, row in ipairs(instr) do    -- i is the index, row is the value
    for j, instrument in ipairs(row) do
      lg.setColor(instrument.color) -- Instruments have own colors
      lg.rectangle( "fill", (j-1)*fieldW, (i-1)*fieldH, fieldW, fieldH )
      if instrument.snd:getVolume() == 1 then
        lg.setColor( 255, 255, 255, 95 ) -- on/off state is displayed
        lg.circle( "fill", (j-0.5)*fieldW, (i-0.5)*fieldH, fieldW*0.4 )
      end
    end
  end
end

function love.mousepressed(x, y)   -- Gets started by mouse/touch
  whereW = math.ceil( x / fieldW ) -- Calculating column
  whereH = math.ceil( y / fieldH ) -- Calculating row
  if instr[whereH][whereW].snd:getVolume() == 1 then
    instr[whereH][whereW].snd:setVolume(0) -- Loudness 0%
  else
    instr[whereH][whereW].snd:setVolume(1) -- Loudness 100%
  end
end
