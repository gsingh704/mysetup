sudo systemctl enable --now bluetooth

echo '--enable-features=TouchpadOverscrollHistoryNavigation
--ozone-platform=wayland' > ~/.config/chrome-flags.conf
echo '--enable-features=TouchpadOverscrollHistoryNavigation
--ozone-platform=wayland' > ~/.var/app/com.google.Chrome/config/chrome-flags.conf

sudo sed -i '1s/^/nameserver 1.1.1.1\n/' /etc/resolv.conf
sudo sh -c "echo 'export ELECTRON_OZONE_PLATFORM_HINT=auto' >> /etc/environment"

#zsh----------------------------------------------------
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  #install oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

echo 'export ZSH="/home/$USER/.oh-my-zsh"
ZSH_THEME="jonathan"
plugins=(git zsh-completions  zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)
source $ZSH/oh-my-zsh.sh
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down' > ~/.zshrc


#gnome config------------------------------------------
curl -o ~/.local/share/gnome-shell/dconf-settings-ft.ini https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/dconf-settings-ft.ini --create-dirs
curl -o ~/.local/share/backgrounds/1.jpg https://w.wallhaven.cc/full/md/wallhaven-mdjrqy.jpg --create-dirs
curl -o ~/.local/share/backgrounds/2.jpg https://i.imgur.com/ukrq4Tz.jpeg --create-dirs

mkdir -p ~/.themes/my/gnome-shell && echo '.clock {border-width: 0;}' > ~/.themes/my/gnome-shell/gnome-shell.css
wget   https://github.com/user-attachments/files/17069476/gestureImprovements47%40gestures.zip
gnome-extensions install -f gestureImprovements47@gestures.zip 

#fusuma--------------------------------------
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

#docker----------------------------------------
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable --now docker 

