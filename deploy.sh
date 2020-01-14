#! /bin/sh

rm -rf ~/.config/bspwm
ln -s $(pwd)/config/bspwm ~/.config/bspwm

rm -rf ~/.config/picom
ln -s $(pwd)/config/picom ~/.config/picom

rm -rf ~/.core
ln -s $(pwd)/core ~/.core

rm -rf ~/.config/dunst
ln -s $(pwd)/config/dunst ~/.config/dunst

rm -rf ~/.config/fish
ln -s $(pwd)/config/fish ~/.config/fish

rm -rf ~/.config/rofi
ln -s $(pwd)/config/rofi ~/.config/rofi

rm -rf ~/.config/termite
ln -s $(pwd)/config/termite ~/.config/termite

rm -rf ~/.themes
ln -s $(pwd)/colors/themes ~/.themes

rm -rf ~/.config/gtk-3.0/settings.ini
ln -s $(pwd)/colors/gtk/settings.ini ~/.config/gtk-3.0/settings.ini

rm -rf ~/.gtkrc-2.0
ln -s $(pwd)/colors/gtk/.gtkrc-2.0 ~/.gtkrc-2.0

rm -rf ~/.config/polybar
ln -s $(pwd)/config/polybar ~/.config/polybar

rm -f ~/.ssh/config
ln -s $(pwd)/config/ssh/config ~/.ssh/config 

rm -rf ~/.config/sxhkd
ln -s $(pwd)/config/sxhkd ~/.config/sxhkd

rm -f ~/.Xresources
ln -s $(pwd)/colors/.Xresources ~/.Xresources

rm -f ~/.gitconfig
ln -s $(pwd)/config/.gitconfig ~/.gitconfig

rm -f ~/.vimrc
ln -s $(pwd)/config/vim/.vimrc ~/.vimrc
rm -rf ~/.vim/bundle
ln -s $(pwd)/config/vim/bundle ~/.vim/bundle
rm -rf ~/.vim/colors
ln -s $(pwd)/colors/vim ~/.vim/colors

# Sudo part

sudo rm -f /etc/sddm.conf
sudo cp $(pwd)/boot/sddm/sddm.conf /etc/sddm.conf

sudo rm -rf /usr/share/sddm/themes/firark
sudo cp -r $(pwd)/boot/sddm/firark /usr/share/sddm/themes/firark

sudo rm -f /etc/vconsole.conf
sudo ln -s $(pwd)/boot/vconsole.conf /etc/vconsole.conf

sudo rm -f /etc/plymouth/plymouthd.conf
sudo ln -s $(pwd)/boot/plymouth/plymouthd.conf /etc/plymouth/plymouthd.conf

sudo rm -f /etc/mkinitcpio.conf
sudo ln -s $(pwd)/boot/mkinitcpio.conf /etc/mkinitcpio.conf
sudo mkinitcpio -p linux
