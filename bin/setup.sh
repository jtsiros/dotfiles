#!/bin/bash

# only run if vim-plug is not installed
if ! [ -f $HOME/.local/share/nvim/site/autoload/plug.vim ]; then
	echo 'Plug installation not detected. Installing...'
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# only run if omf is not installed
if ! [ -d $HOME/.local/share/omf ]; then
	echo 'omf installation not detected. Installing...'
	sh -c 'curl -L https://get.oh-my.fish > install-fish && fish install-fish --noninteractive --yes --path=~/.local/share/omf --config=~/.config/omf'
	sh -c 'rm -f install-fish'
fi
