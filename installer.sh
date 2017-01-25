#!/bin/bash
alias instll="apt-get install"

cd ~

git clone "https://github.com/sejdm/.xmonad"
git clone "https://github.com/sejdm/dotfiles"
git clone "https://github.com/sejdm/findFiles"
git clone "https://github.com/sejdm/smartWallpaper"
git clone "https://github.com/sejdm/LatexSearch"

instll zsh xmonad emacs24 vim gvim zathura

ln -s ~/dotfiles/.xmobarrc
ln -s ~/dotfiles/.vimrc
ln -s ~/dotfiles/.vimperatorrc
ln -s ~/dotfiles/.zshrc
ln -s ~/dotfiles/.spacemacs
ln -s ~/dotfiles/zathurarc ~/.config/zathura/zathurarc

mkdir ~/.local/bin

## Setting up spacemacs
mv ~/.emacs.d ~/.emacs.d.bak
mv ~/.emacs ~/.emacs.bak
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
(emacs24 --insecure && rm .spacemacs && ln -s ~/dotfiles/.spacemacs && emacs24)&
