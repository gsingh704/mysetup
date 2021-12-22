
#hide title bar
kwriteconfig5 --file ~/.config/kwinrc --group Windows --key BorderlessMaximizedWindows true
qdbus org.kde.KWin /KWin reconfigure


#install app
yay -S firefox-appmenu-bin  pamac-aur 
yay -S libinput_gestures_qt plasma5-applets-window-buttons  #plasma only
sudo pamac install pipewire-pulse pipewire-alsa 


#netdata
bash <(curl -Ss https://my-netdata.io/kickstart.sh)

#install zsh & oh-my-zsh
yay -S zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

#######no vbox


# environment
echo "MOZ_ENABLE_WAYLAND=1
MOZ_USE_XINPUT2=1" >> /etc/environment

# gestures
sudo gpasswd -a $USER input
yay -S wmctrl xdotool libinput-gestures
wget https://github.com/gsingh704/mysetup/raw/main/libinput-gestures.conf
cp libinput-gestures.conf ~/.config/
libinput-gestures-setup autostart start
-------------------------------------------------------
#Insall touchegg and touch 
yay -S touchegg touchegg
sudo systemctl enable touchegg.service  #enble and start the service
sudo systemctl start touchegg
#config file
mkdir -p ~/.config/touchegg
cd ~/.config/touchegg
wget https://github.com/gsingh704/mysetup/raw/main/dotfiles/touchegg.conf


-----------------------------
echo "headerbar button.titlebutton image, .titlebar button.titlebutton image {
  color: transparent;
}

headerbar button.titlebutton, .titlebar button.titlebutton {
  background-position: center;
  background-repeat: no-repeat;
  min-height: 27px;
  min-width: 27px;
  background-size: 27px 27px;
}" >> ~/.config/gtk-3.0/gtk.css
