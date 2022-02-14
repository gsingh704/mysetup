#install yay, 
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si



#install main applications
yay -S   wget pamac-aur qt5ct adwaita-qt  gvfs-google tt-ms-fonts 

#enable bluetooth on endevor os
sudo pacman -S --needed bluez bluez-utils 
sudo systemctl enable --now bluetooth
#to install pipewire for good bluetooth support
yay -S pipewire-pulse pipewire-alsa 



#download wallpaper
cd ~/setup
wget https://w.wallhaven.cc/full/md/wallhaven-mdjrqy.jpg


# install netdata
bash <(curl -Ss https://my-netdata.io/kickstart.sh)


#edit environment to get better firefox support
sudo su
echo "MOZ_ENABLE_WAYLAND=1
MOZ_USE_XINPUT2=1
MOZ_X11_EGL=1" >> /etc/environment
exit 

########################################33

#Gestures
#Libinput-Gestures 
sudo gpasswd -a $USER input
yay -S wmctrl xdotool libinput-gestures gestures
#config file
cd ~/.config/
wget https://github.com/gsingh704/mysetup/raw/main/dotfiles/gestures/libinput-gestures.conf
libinput-gestures-setup autostart start

#Touchegg
yay -S touchegg touche
sudo systemctl enable touchegg.service  #enble and start the service
sudo systemctl start touchegg
#config file
mkdir -p ~/.config/touchegg
cd ~/.config/touchegg
wget https://github.com/gsingh704/mysetup/raw/main/dotfiles/gestures/touchegg.conf

##############################


#install zsh        
yay -S zsh  
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  #install oh-my-zsh
#install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
#make changes to .zshrc file
cd ~
rm -f .zshrc*
wget https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/.zshrc
