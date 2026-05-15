#!/usr/bin/env sh
path="$CHEF_HOME/bin/python-$version"

if [ -d "$path" ]; then
    rm -rf "$path"
else
    mkdir "$path"
fi

./configure \
    --enable-optimizations \
    --prefix="$path"

make
make install