#!/bin/bash

rm -rf web

pushd rogue/sdl1
emmake make clean
popd

pushd rogue
emmake make clean
popd


