#!/bin/bash
path="$1"
if [ -z "$1" ]; then
    path="packages"
fi
if [ ! -d "$path" ]; then
  mkdir "$path"
fi
stanza src/*.stanza -pkg "$path" &&
stanza test/test.stanza -o test/bin/test -pkg-path "$path"
