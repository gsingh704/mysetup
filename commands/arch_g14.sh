#graphics related ############################################################################
yay -R --confirm nvidia-dkms
yay -Syu --noconfirm  base-devel nvidia  nvidia-utils nvidia-prime  vulkan-radeon lib32-nvidia-utils asusctl supergfxctl 
sudo systemctl start asusd
sudo systemctl enable --now supergfxd.service
sudo systemctl enable --now bluetooth
sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules

asusctl fan-curve -m balanced -D 30c:0,40c:0,50c:0,60c:0,70c:0,80c:0,90c:0,100c:0  -e true -f cpu
asusctl fan-curve -m balanced -D 30c:0,40c:0,50c:0,60c:0,70c:0,80c:0,90c:0,100c:0  -e true -f gpu
asusctl fan-curve -m balanced -e true  

# gnome dconf ################################################################################
yay -Syu --noconfirm wget adw-gtk3 extension-manager
wget -O ~/.local/share/gnome-shell/dconf-settings-ft.ini https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/gnome/dconf-settings-ft.ini
wget -O ~/.local/share/gnome-shell/1.jpg https://w.wallhaven.cc/full/md/wallhaven-mdjrqy.jpg

# mkdir -p ~/.themes/my/gnome-shell && echo '.clock {
#     border-width: 0;
#  }' > ~/.themes/my/gnome-shell/gnome-shell.css

mkdir ~/.local/share/fonts
cd  ~/.local/share/fonts
wget https://raw.githubusercontent.com/RedHatOfficial/RedHatFont/master/fonts/proportional/static/ttf/RedHatDisplay-Bold.ttf

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

mkdir -p ~/.config/fusuma
cd ~/.config/fusuma
wget https://github.com/gsingh704/mysetup/raw/main/dotfiles/gestures/config.yml

#zsh ########################################################################################
yay -Syu --noconfirm wget zsh git zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting
chsh -s $(which zsh)
curl -o ~/.zshrc https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/sh/.zshrc

#docker ######################################################################################
yay -Syu --noconfirm docker docker-compose visual-studio-code-bin  # gvfs-google adwaita-qt5 
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable --now docker 