#!/bin/sh

for name in *; do
  if [ "$name" != 'install.sh' ] && [ "$name" != 'test.sh' ]; then
    target="$HOME/.$name"
    if [ -e "$target" ]; then
      if [ ! -L "$target" ]; then
        echo "WARNING: $target exists but is not a symlink."
      fi
    else
      if [ "$name" == 'vim' ]; then
        ln -s "$PWD/vim/vimrc" "$HOME/.vimrc"
      fi
      echo "Creating $target"
      ln -s "$PWD/$name" "$target"
    fi
  fi
done
