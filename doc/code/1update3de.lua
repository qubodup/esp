  bild_aktuell = bild_zu
  for i,u in pairs(soundliste) do
    if u:isPlaying() then bild_aktuell = bild_auf end
  end
