#!/bin/sh

for name in .*; do
  if [ "$name" != '.' ] && [ "$name" != '..' ] && [ "$name" != '.git' ]; then
    echo $name
    target="$HOME/$name"
    if [ -e "$target" ]; then
      if [ ! -L "$target" ]; then
        echo "WARNING: $target exists but is not a symlink."
      fi
    else
      echo "Creating $target"
      ln -s "$PWD/$name" "$target"
    fi
  fi
done
