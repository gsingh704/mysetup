sudo su


echo "
[g14]
SigLevel = DatabaseNever Optional TrustAll
Server = https://arch.asus-linux.org" >> /etc/pacman.conf

echo "evdev:input:b0003v0B05p1866*
KEYBOARD_KEY_ff31007c=f20 # x11 mic-mute" >> /etc/udev/hwdb.d/90-nkey.hwdb

echo "MOZ_ENABLE_WAYLAND=1
MOZ_USE_XINPUT2=1
MOZ_X11_EGL=1" >> /etc/environment

exit

#
sudo pacman -Suy
sudo pacman -S gnome-themes-extra asusctl supergfxctl firefox  wget git base-devel nodejs npm nvidia nvidia-dkms nvidia-utils nvidia-prime  mesa mesa-demos linux-g14 linux-g14-headers linux-g14 linux-g14-headers    bluez bluez-utils base-devel #lib32-nvidia-utils
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
yay -Syu  ttf-ms-fonts zsh touchegg touche wmctrl xdotool libinput-gestures gestures pipewire-pulse pipewire-alsa qgnomeplatform chrome-gnome-shell
sudo gpasswd -a $USER input
sudo systemctl enable --now power-profiles-daemon.service
sudo systemctl enable --now supergfxd.service
sudo systemctl enable --now bluetooth
sudo systemctl enable touchegg.service
sudo systemctl start touchegg
echo "export QT_QPA_PLATFORMTHEME='gnome'" >> ~/.profile
cd ~/.config/
wget https://github.com/gsingh704/mysetup/raw/main/dotfiles/gestures/libinput-gestures.conf
libinput-gestures-setup autostart start
mkdir -p ~/.config/touchegg
cd ~/.config/touchegg
wget https://github.com/gsingh704/mysetup/raw/main/dotfiles/gestures/touchegg.conf
mkdir -p ~/.themes/adwaita_big/gnome-shell/
echo "stage {font-size: 16pt;}" >> ~/.themes/adwaita_big/gnome-shell/gnome-shell.css
cd ~/.local/share/gnome-shell
rm -rf extensions
wget https://github.com/gsingh704/mysetup/raw/main/dotfiles/gnome/extensions.zip
unzip extensions.zip
wget https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/gnome/dconf-settings.ini
cat dconf-settings.ini | dconf load / 
git clone https://gitlab.com/asus-linux/asusctl-gex.git /tmp/asusctl-gex && cd /tmp/asusctl-gex
npm install
npm run build && npm run install-user
sudo grub-mkconfig -o /boot/grub/grub.cfg

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  #install oh-my-zsh

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
cd ~
rm -f .zshrc*
wget https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/.zshrc

#reboot        sudo rm -rf /etc/asusd/profile.conf

asusctl fan-curve -m quiet -D 30c:0,40c:0,50c:0,60c:0,70c:35,80c:55,90c:65,100c:65  -e true -f cpu
asusctl fan-curve -m quiet -D 30c:0,40c:0,50c:0,60c:0,70c:35,80c:55,90c:65,100c:65  -e true -f gpu

asusctl fan-curve -m balanced -D 30c:0,40c:0,50c:0,60c:0,70c:35,80c:55,90c:65,100c:65  -e true -f gpu
asusctl fan-curve -m balanced -D 30c:0,40c:0,50c:0,60c:0,70c:35,80c:55,90c:65,100c:65  -e true -f cpu

asusctl fan-curve -m performance -D 30c:0,40c:0,50c:0,60c:10,70c:55,80c:90,90c:100,100c:100 -e true -f cpu
asusctl fan-curve -m performance -D 30c:0,40c:0,50c:0,60c:10,70c:55,80c:90,90c:100,100c:100 -e true -f gpu



or




asusctl fan-curve -m quiet -D 30c:0,40c:0,50c:0,60c:0,70c:0,80c:0,90c:0,100c:0  -e true -f cpu
asusctl fan-curve -m quiet -D 30c:0,40c:0,50c:0,60c:0,70c:0,80c:0,90c:0,100c:0  -e true -f gpu

asusctl fan-curve -m balanced -D 30c:0,40c:0,50c:0,60c:0,70c:0,80c:0,90c:0,100c:0  -e true -f cpu
asusctl fan-curve -m balanced -D 30c:0,40c:0,50c:0,60c:0,70c:0,80c:0,90c:0,100c:0  -e true -f gpu

asusctl fan-curve -m performance -D 30c:0,40c:0,50c:0,60c:10,70c:55,80c:90,90c:100,100c:100 -e true -f cpu
asusctl fan-curve -m performance -D 30c:0,40c:0,50c:0,60c:10,70c:55,80c:90,90c:100,100c:100 -e true -f gpu


