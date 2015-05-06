#!/bin/bash

mkdir -p build || true
mkdir -p web || true

pushd pdcurses/sdl1
emmake make
cp libpdcurses.a ../../build
popd

pushd rogue
emmake make
cp rogue.bc ../build
popd

cp data/pdcfont.bmp build/pdcfont.bmp

pushd build
emcc -O2 rogue.bc -s ASYNCIFY=1 -o ../web/rogue.html --preload-file pdcfont.bmp
popd



