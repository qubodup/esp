  img_current = img_closed
  for i,u in pairs(soundlist) do
    if u:isPlaying() then img_current = img_open end
  end
