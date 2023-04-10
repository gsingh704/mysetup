


sudo dnf copr enable lukenukem/asus-linux


sudo dnf update -y
sudo dnf install kernel-devel
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda


sudo systemctl enable nvidia-hibernate.service nvidia-suspend.service nvidia-resume.servicej

sudo dnf install asusctl supergfxctl
sudo dnf update --refresh
sudo systemctl start asusd.service
sudo systemctl enable --now supergfxd.service


#zsh
sudo dnf install util-linux-user zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  #install oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
cd ~
rm -f .zshrc*
wget https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/.zshrc



#fusuma
sudo dnf install libinput ruby ruby-devel
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


#adw
sudo dnf copr enable nickavem/adw-gtk3
sudo dnf install adw-gtk3

#code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update
sudo dnf install code


#docker
sudo dnf install docker docker-compose  
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable --now docker 
sudo setenforce 0   

