#!/bin/bash

mkdir -p web || true

pushd rogue/sdl1
emmake make
popd

pushd rogue
emmake make
emcc -Os rogue.bc -s EMTERPRETIFY=1 -s EMTERPRETIFY_ASYNC=1 -s ASSERTIONS=2 -o ../web/rogue.html --preload-file pdcfont.bmp
popd



