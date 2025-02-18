#!/bin/bash

# Updating System
sudo dnf update -y

# Making .config and Moving dotfiles and Background to .config
mkdir ~/.config
chown $(whoami): ~/.config
mv ./dotconfig/* ~/.config
mv ./bg.jpg ~/.config

# Installing Essential Programs 
sudo dnf install -y sddm bspwm htop sxhkd fastfetch kitty rofi polybar picom thunar nitrogen lxpolkit xorg-x11-drv-intel
# Installing Other less important Programs
sudo dnf install -y  gedit feh variety xrandr  lxappearance 
# Installing Custom ocs-url package
sudo dnf install -y ./rpm-packages/ocs-url-3.1.0-1.fc20.x86_64.rpm

# Installing fonts
sudo dnf install -y papirus* epapirus* fontawesome-fonts fontawesome-fonts-web
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
sudo unzip FiraCode.zip -d /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
sudo unzip Meslo.zip -d /usr/share/fonts
cd /usr/share/themes/
sudo git clone https://github.com/EliverLara/Nordic.git
cd ~
git clone https://github.com/vinceliuice/Layan-cursors.git
cd ~/Layan-cursors/
sudo ./install.sh

#Installing my apps
curl -fsS https://dl.brave.com/install.sh | sh
# Reloading Font
fc-cache -vf
# Removing zip Files
rm ./FiraCode.zip ./Meslo.zip

# Enabling Services and Graphical User Interface
sudo systemctl enable sddm
sudo systemctl set-default graphical.target
sudo systemctl enable libvirtd --now
sudo usermod -aG libvirt $(whoami)

