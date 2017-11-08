#!/bin/sh

# appropriated from https://github.com/thoughtbot/dotfiles
if [ ! -e "$HOME"/.vim/autoload/pathogen.vim ]; then
  curl -fLo "$HOME"/.vim/autoload/pathogen.vim --create-dirs \
      https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
fi

if [ -e "$HOME"/.vim/autoload/plug.vim ]; then
  vim -E -s +PlugUpgrade +qa
else
  curl -fLo "$HOME"/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
vim -u "$HOME"/.vimrc.bundles +PlugUpdate +PlugClean! +qa
