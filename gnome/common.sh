#install yay 
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si


#install main applications
yay -S firefox-appmenu-bin  wget pamac-aur qt5ct adwaita-qt gvfs-goa gvfs-google #online accounts google drive   #tt-ms-fonts for arch

#to install pipewire for good bluetooth support
sudo pamac install pipewire-pulse pipewire-alsa 
#enable bluetooth on endevor os
sudo pacman -S --needed bluez bluez-utils 
sudo systemctl enable --now bluetooth

# install netdata
bash <(curl -Ss https://my-netdata.io/kickstart.sh)

yay -S zsh  #install zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  #install oh-my-zsh
#install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
#make changes to .zshrc file
cd ~
rm -rf .zshrc*
wget https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/.zshrc

#edit environment to get better firefox support
echo "MOZ_ENABLE_WAYLAND=1
MOZ_USE_XINPUT2=1" >> /etc/environment
-----------------------------------------

#install and configure libinput-gestures 
sudo gpasswd -a $USER input
yay -S wmctrl xdotool libinput-gestures gestures
cd ~/.config/
wget https://github.com/gsingh704/mysetup/raw/main/dotfiles/libinput-gestures.conf
libinput-gestures-setup autostart start
----------------------------------------------------
#Insall touchegg and touch 
yay -S touchegg touchegg
sudo systemctl enable touchegg.service  #enble and start the service
sudo systemctl start touchegg
#config file
mkdir -p ~/.config/touchegg
cd ~/.config/touchegg
wget https://github.com/gsingh704/mysetup/raw/main/dotfiles/touchegg.conf
