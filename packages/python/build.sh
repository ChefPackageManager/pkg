#!/usr/bin/env sh
path="$CHEF_HOME/bin/$PACKAGE_NAME"

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
