#!/bin/bash

rm -rf build
rm -rf web

pushd pdcurses/sdl1
emmake make clean
popd

pushd rogue
emmake make clean
popd


