#!/bin/bash
# pdf
for run in {1..2}; do
  for i in *tex; do
    # pdflatex clean
    infile=`readlink -f "$i"`
    inpath=`dirname "$infile"`
    tmpath="/tmp/pdflatex`echo "$inpath" | sed -e 's/\//-/g'`"

    mkdir "$tmpath"
    pdflatex -output-directory "$tmpath" "$i"
    mv "$tmpath"/*pdf "$inpath"
  done
done

# html

rm -r en/ de/ 
mkdir -p de/intro/
mkdir -p de/game/
mkdir -p en/intro/
mkdir -p en/game/
cp "Einstieg Spiele-Programmierung Einführung.pdf"      de/intro/index.pdf
cp "Einstieg Spiele-Programmierung Mache ein Spiel.pdf" de/game/index.pdf
cp "Start Gamedev Introduction.pdf"                     en/intro/index.pdf
cp "Start Gamedev Make a Game.pdf"                      en/game/index.pdf

for i in en/*/ de/*/; do
  cd "$i"
  pdf2htmlEX --process-outline 0 --zoom 1.6 index.pdf
  rm index.pdf
  cd ../../
done

# html titles

sed -i 's/<title><\/title>/<title>Einstieg Spiele-Programmierung LÖVE Einführung<\/title>/' de/intro/index.html
sed -i 's/<title><\/title>/<title>Einstieg Spiele-Programmierung in LÖVE<\/title>/' de/game/index.html
sed -i 's/<title><\/title>/<title>Start Gamedev Introduction to LÖVE<\/title>/' en/intro/index.html
sed -i 's/<title><\/title>/<title>Start Gamedev - LÖVE Game Programming<\/title>/' en/game/index.html