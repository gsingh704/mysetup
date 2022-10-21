sudo su



echo "evdev:input:b0003v0B05p1866*
KEYBOARD_KEY_ff31007c=f20 # x11 mic-mute" >> /etc/udev/hwdb.d/90-nkey.hwdb

echo "MOZ_ENABLE_WAYLAND=1
MOZ_USE_XINPUT2=1
MOZ_X11_EGL=1" >> /etc/environment

exit

#
sudo pacman -Suy
sudo pacman -S gnome-themes-extra zsh firefox  wget git base-devel nodejs  npm nvidia  nvidia-utils nvidia-prime  vulkan-radeon bluez bluez-utils lib32-nvidia-utils gvfs-google  

yay -Syu ruby-fusuma  ruby-fusuma-plugin-sendkey adw-gtk3 pipewire-pulse pipewire-alsa   asusctl supergfxctl rog-control-center
sudo gpasswd -a $USER input
sudo systemctl enable --now power-profiles-daemon.service
sudo systemctl enable --now supergfxd.service
sudo systemctl enable --now bluetooth
 
echo "export QT_QPA_PLATFORMTHEME='gnome'" >> ~/.profile
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
mkdir -p ~/.themes/adwaita_big/gnome-shell/
echo "stage {font-size: 16pt;}" >> ~/.themes/adwaita_big/gnome-shell/gnome-shell.css

cd ~/.local/share/gnome-shell
rm -rf extensions
wget https://github.com/gsingh704/mysetup/raw/main/dotfiles/gnome/extensions.zip
unzip extensions.zip
wget https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/gnome/dconf-settings-lp.ini
wget https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/gnome/dconf-settings-dm.ini
wget https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/gnome/dconf-settings-gm-dm.ini
wget https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/gnome/dconf-settings-gm.ini

##cat dconf-settings-dm.ini | dconf load /  

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  #install oh-my-zsh

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
cd ~
rm -f .zshrc*
wget https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/.zshrc

git clone https://gitlab.com/asus-linux/asusctl-gex.git /tmp/asusctl-gex && cd /tmp/asusctl-gex
npm install
npm run build && npm run install-user
sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules

#reboot    
asusctl fan-curve -m quiet -D 30c:0,40c:0,50c:0,60c:0,70c:0,80c:0,90c:0,100c:0  -e true -f cpu
asusctl fan-curve -m quiet -D 30c:0,40c:0,50c:0,60c:0,70c:0,80c:0,90c:0,100c:0  -e true -f gpu

asusctl fan-curve -m balanced -D 30c:0,40c:0,50c:0,60c:0,70c:0,80c:0,90c:0,100c:0  -e true -f cpu
asusctl fan-curve -m balanced -D 30c:0,40c:0,50c:0,60c:0,70c:0,80c:0,90c:0,100c:0  -e true -f gpu

asusctl fan-curve -m performance -D 30c:0,40c:0,50c:0,60c:10,70c:55,80c:90,90c:100,100c:100 -e true -f cpu
asusctl fan-curve -m performance -D 30c:0,40c:0,50c:0,60c:10,70c:55,80c:90,90c:100,100c:100 -e true -f gpu

###to run proton games from ntfs
#sudo ntfs-3g -o uid=1000,guid=1000 /dev/nvme0n1p6 /mnt/0E72E0784E3878AE

