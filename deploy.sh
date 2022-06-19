#! /bin/sh

rm -rf ~/.config/bspwm
ln -s $(pwd)/config/bspwm ~/.config/bspwm

rm -rf ~/.config/picom
ln -s $(pwd)/config/picom ~/.config/picom

rm -rf ~/.core
ln -s $(pwd)/core ~/.core

rm -rf ~/.config/dunst
ln -s $(pwd)/config/dunst ~/.config/dunst

rm -rf ~/.config/rofi
ln -s $(pwd)/config/rofi ~/.config/rofi

rm -rf ~/.config/polybar
ln -s $(pwd)/config/polybar ~/.config/polybar

rm -rf ~/.config/sxhkd
ln -s $(pwd)/config/sxhkd ~/.config/sxhkd

rm -f ~/.Xresources
ln -s $(pwd)/colors/.Xresources ~/.Xresources

rm -f ~/.gitconfig
ln -s $(pwd)/config/.gitconfig ~/.gitconfig

