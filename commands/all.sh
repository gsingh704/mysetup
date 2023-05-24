#
sudo sh -c "echo 'MOZ_ENABLE_WAYLAND=1
MOZ_USE_XINPUT2=1
MOZ_X11_EGL=1
QT_STYLE_OVERRIDE=adwaita-dark' > /etc/environment"


#
sudo pacman -Syu --noconfirm   zsh firefox  wget git base-devel nvidia  nvidia-utils nvidia-prime  vulkan-radeon bluez bluez-utils lib32-nvidia-utils gvfs-google  
yay -Syu --noconfirm ruby-fusuma  ruby-fusuma-plugin-sendkey adw-gtk3 adwaita-qt5 pipewire-pulse pipewire-alsa   asusctl supergfxctl
sudo gpasswd -a $USER input
sudo systemctl start asusd.service
sudo systemctl enable --now supergfxd.service
sudo systemctl enable --now bluetooth
 
mkdir ~/.config/autostart/
echo "[Desktop Entry]    
Type=Application
Exec=fusuma
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true" > ~/.config/autostart/fusuma.desktop


mkdir -p ~/.config/fusuma
cd ~/.config/fusuma
wget https://github.com/gsingh704/mysetup/raw/main/dotfiles/gestures/config.yml

cd ~/.local/share/gnome-shell
rm -rf extensions
wget https://github.com/gsingh704/mysetup/raw/main/dotfiles/gnome/extensions.zip
unzip extensions.zip
wget https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/gnome/dconf-settings-ft.ini

#fish
mkdir ~/.config/fish
cd ~/.config/fish
wget https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/config.zsh

sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules

#reboot    
asusctl fan-curve -m quiet -D 30c:0,40c:0,50c:0,60c:0,70c:0,80c:0,90c:0,100c:0  -e true -f cpu
asusctl fan-curve -m quiet -D 30c:0,40c:0,50c:0,60c:0,70c:0,80c:0,90c:0,100c:0  -e true -f gpu
asusctl fan-curve -m balanced -D 30c:0,40c:0,50c:0,60c:0,70c:0,80c:0,90c:0,100c:0  -e true -f cpu
asusctl fan-curve -m balanced -D 30c:0,40c:0,50c:0,60c:0,70c:0,80c:0,90c:0,100c:0  -e true -f gpu
asusctl fan-curve -m performance -D 30c:0,40c:0,50c:0,60c:10,70c:55,80c:90,90c:100,100c:100 -e true -f cpu
asusctl fan-curve -m performance -D 30c:0,40c:0,50c:0,60c:10,70c:55,80c:90,90c:100,100c:100 -e true -f gpu
