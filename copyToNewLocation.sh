#!/bin/sh

source=$1
target=$2

mkdir ../tmp
cp -f "$target"/configuration.php ../tmp/
rm -R -f "$target"
cp -R -f "$source" "$target"
cp -f ../tmp/configuration.php "$target"
rm -R ../tmp/
