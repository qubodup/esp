function love.load()
  la, lg = love.audio, love.graphics
  namen = { "lead", "drums", "drumsb", "clap" }
  instr = {{},{}}        -- Instrumente-Tabelle mit...
  for i = 1, 2 do        -- Zwei Zeilen und...
    for j = 1, #namen do -- Vier Spalten
      instr[i][j] = {}
      instr[i][j].snd = la.newSource( namen[j] .. i .. ".ogg" )
      instr[i][j].snd:setLooping( true ) -- Endlosschleife an
      instr[i][j].snd:setVolume( 0 )     -- Lautstärke auf 0
      instr[i][j].snd:play()             -- Tracks werden abgespielt
      instr[i][j].farbe = { 60*j, love.math.random(200), 200 }
    end
  end
  spalten = #instr[1]       -- 4 Spalten
  zeilen  = #instr          -- 2 Zeilen
  breit   = lg.getWidth()   -- Bildschirm-Größe
  hoch    = lg.getHeight()
  feldB   = breit / spalten -- Schaltfelder-Größe
  feldH   = hoch / zeilen
end

function love.draw()
  for i, zeile in ipairs(instr) do  -- i ist Index, zeile ist Wert
    for j, instrument in ipairs(zeile) do
      lg.setColor(instrument.farbe) -- Instrumente haben eigene Farben
      lg.rectangle( "fill", (j-1)*feldB, (i-1)*feldH, feldB, feldH )
      if instrument.snd:getVolume() == 1 then
        lg.setColor( 255, 255, 255, 95 ) -- An/Aus-Zustand wird gezeigt
        lg.circle( "fill", (j-0.5)*feldB, (i-0.5)*feldH, feldB*0.4 )
      end
    end
  end
end

function love.mousepressed(x, y)   -- Wird von Maus/Touch gestartet
  woBreit = math.ceil( x / feldB ) -- Spaltenberechnung
  woHoch  = math.ceil( y / feldH ) -- Zeilenberechnung
  if instr[woHoch][woBreit].snd:getVolume() == 1 then
    instr[woHoch][woBreit].snd:setVolume(0) -- Lautstärke 0%
  else
    instr[woHoch][woBreit].snd:setVolume(1) -- Lautstärke 100%
  end
end
