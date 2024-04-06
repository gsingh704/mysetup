
sudo apt update && sudo apt install -y curl git build-essential libgtk-3-dev libpango1.0-dev  libgdk-pixbuf-2.0-dev libglib2.0-dev cmake libclang-dev libudev-dev libayatana-appindicator3-1    cargo

git clone https://gitlab.com/asus-linux/supergfxctl.git
cd supergfxctl
make && sudo make install
sudo systemctl enable supergfxd.service --now

git clone https://gitlab.com/asus-linux/asusctl
cd asusctl
make && sudo make install
sudo systemctl daemon-reload
sudo systemctl restart asusd

#replace snap with flatpak
sudo apt install --no-install-recommends -y gnome-software  gnome-software-plugin-flatpak flatpak zsh gnome-console 

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub org.mozilla.firefox

sudo snap remove --purge firefox
sudo snap remove --purge snap-store
sudo snap remove --purge gnome-42-2204
sudo snap remove --purge gtk-common-themes
sudo snap remove --purge snapd-desktop-integration
sudo snap remove --purge bare
sudo snap remove --purge core22
sudo snap remove --purge snapd

sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket
sudo systemctl disable snapd.seeded.service

sudo apt remove --autoremove snapd gnome-terminal

sudo rm -rf /var/cache/snapd/
rm -rf ~/snap



#firefox
sudo sh -c "echo 'MOZ_ENABLE_WAYLAND=1
MOZ_USE_XINPUT2=1
MOZ_X11_EGL=1' > /etc/environment"

#zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  #install oh-my-zsh

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
cd ~
rm -f .zshrc*
curl -o ~/.zshrc https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/sh/.zshrc


#fusuma
sudo apt install -y libevdev-dev ruby-dev build-essential  libinput-tools ruby
sudo gem install revdev bundler fusuma fusuma-plugin-sendkey
sudo gpasswd -a $USER input

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




#docker
sudo apt install docker-compose docker 
sudo groupadd docker
sudo usermod -aG docker $USER

