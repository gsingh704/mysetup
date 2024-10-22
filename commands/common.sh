sudo systemctl enable --now bluetooth

echo '--enable-features=TouchpadOverscrollHistoryNavigation
--ozone-platform=wayland' > ~/.config/chrome-flags.conf
echo '--enable-features=TouchpadOverscrollHistoryNavigation
--ozone-platform=wayland' > ~/.var/app/com.google.Chrome/config/chrome-flags.conf

sudo sed -i '1s/^/nameserver 1.1.1.1\n/' /etc/resolv.conf
sudo sh -c "echo 'export ELECTRON_OZONE_PLATFORM_HINT=auto' >> /etc/environment"

#zsh----------------------------------------------------
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
echo -e 'export ZSH="/home/$USER/.oh-my-zsh"\nZSH_THEME="jonathan"\nplugins=(git zsh-completions zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)\nsource $ZSH/oh-my-zsh.sh\nbindkey "$terminfo[kcuu1]" history-substring-search-up\nbindkey "$terminfo[kcud1]" history-substring-search-down' > ~/.zshrc

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

mkdir -p ~/.config/autostart && echo -e "[Desktop Entry]\nType=Application\nExec=fusuma\nHidden=false\nNoDisplay=false\nX-GNOME-Autostart-enabled=true" > ~/.config/autostart/fusuma.desktop
mkdir ~/.config/fusuma/ && echo -e "swipe:\n  4:\n    left: {sendkey: 'LEFTCTRL+TAB'}\n    right: {sendkey: 'LEFTCTRL+LEFTSHIFT+TAB'}\n    up: {sendkey: 'LEFTCTRL+LEFTSHIFT+T'}\n    down: {sendkey: 'LEFTCTRL+W'}\npinch:\n  3:\n    out: {sendkey: 'LEFTCTRL+T'}\n    in: {sendkey: 'LEFTCTRL+T'}\nthreshold: {swipe: 0.5, pinch: 0.2}\ninterval: {swipe: 1.0, pinch: 0.7}" > ~/.config/fusuma/config.yml

#docker----------------------------------------
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable --now docker 

