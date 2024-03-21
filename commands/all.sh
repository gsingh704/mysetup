sudo systemctl enable --now bluetooth

# gnome dconf ################################################################################
yay -Syu --noconfirm wget adw-gtk3 extension-manager
curl -o ~/.local/share/gnome-shell/dconf-settings-ft.ini https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/gnome/dconf-settings-ft.ini --create-dirs
curl -o ~/.local/share/gnome-shell/1.jpg https://w.wallhaven.cc/full/md/wallhaven-mdjrqy.jpg --create-dirs
curl -o ~/.local/share/fonts/RedHatDisplay-Bold.ttf https://raw.githubusercontent.com/RedHatOfficial/RedHatFont/master/fonts/proportional/static/ttf/RedHatDisplay-Bold.ttf --create-dirs

mkdir -p ~/.themes/my/gnome-shell && echo '.clock {border-width: 0;}' > ~/.themes/my/gnome-shell/gnome-shell.css
#touchpad gestures ###########################################################################
yay -Syu --noconfirm wget ruby-fusuma ruby-fusuma-plugin-sendkey
sudo gpasswd -a $USER input

mkdir ~/.config/autostart/
echo "[Desktop Entry]    
Type=Application
Exec=fusuma
Hidden=false
NoDisplay=false
Name=fusuma
X-GNOME-Autostart-enabled=true" > ~/.config/autostart/fusuma.desktop

curl -o ~/.config/fusuma/config.yml https://github.com/gsingh704/mysetup/raw/main/dotfiles/gestures/config.yml --create-dirs

#zsh ########################################################################################
yay -Syu --noconfirm wget zsh git zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting
chsh -s $(which zsh)
curl -o ~/.zshrc https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/.zshrc

#docker ######################################################################################
yay -Syu --noconfirm docker docker-compose visual-studio-code-bin  # gvfs-google adwaita-qt5 
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable --now docker 