
sudo systemctl enable --now bluetooth
echo '--enable-features=TouchpadOverscrollHistoryNavigation
--ozone-platform=wayland' > ~/.config/chrome-flags.conf
sudo sed -i '1i\[Element Master]\nswitch = mute\nvolume = ignore\n' /usr/share/alsa-card-profile/mixer/paths/analog-output.conf.common
sudo sed -i '1s/^/nameserver 1.1.1.1\n/' /etc/resolv.conf


# gnome dconf ################################################################################
yay -Syu --noconfirm wget adw-gtk3 extension-manager
curl -o ~/.local/share/gnome-shell/dconf-settings-ft.ini https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/dconf-settings-ft.ini --create-dirs
curl -o ~/.local/share/backgrounds/1.jpg https://w.wallhaven.cc/full/md/wallhaven-mdjrqy.jpg --create-dirs
curl -o ~/.local/share/backgrounds/2.jpg https://i.imgur.com/ukrq4Tz.jpeg --create-dirs
curl -o ~/.local/share/fonts/RedHatDisplay-Bold.ttf https://raw.githubusercontent.com/RedHatOfficial/RedHatFont/master/fonts/proportional/static/ttf/RedHatDisplay-Bold.ttf --create-dirs

mkdir -p ~/.themes/my/gnome-shell && echo '.clock {border-width: 0;}' > ~/.themes/my/gnome-shell/gnome-shell.css

#touchpad gestures ###########################################################################
yay -Syu --noconfirm wget ruby-fusuma
gem install fusuma fusuma-plugin-sendkey 
sudo gpasswd -a $USER input

mkdir ~/.config/autostart/
echo "[Desktop Entry]    
Type=Application
Exec=/home/j/.local/share/gem/ruby/3.3.0/bin/fusuma
Hidden=false
NoDisplay=false
Name=fusuma
X-GNOME-Autostart-enabled=true" > ~/.config/autostart/fusuma.desktop

curl -o ~/.config/fusuma/config.yml https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/gestures/config.yml --create-dirs

wget   https://github.com/user-attachments/files/17069476/gestureImprovements47%40gestures.zip
gnome-extensions install -f gestureImprovements47@gestures.zip 


#zsh ########################################################################################
yay -Syu --noconfirm wget zsh git zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting
chsh -s $(which zsh)
curl -o ~/.zshrc https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/sh/.zshrc

#acestream
# curl -o ~/.local/share/applications/acestream.AppImage https://github.com/bro2020/acestream-appimage/releases/download/v2.2/AceStream-3.1.49-v2.2.AppImage
# chmod +x ~/.local/share/applications/acestream.AppImage
yay -Syu --noconfirm  acestream-engine acestream-launcher

#
yay -Syu --noconfirm binder_linux-dkms waydroid  
sudo waydroid init

#docker ######################################################################################
yay -Syu --noconfirm docker docker-compose visual-studio-code-bin  # gvfs-google adwaita-qt5 
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable --now docker 