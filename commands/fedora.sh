


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
curl -o ~/.zshrc https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/sh/.zshrc



#fusuma
sudo dnf install libinput ruby ruby-devel make automake gcc gcc-c++ kernel-devel 
sudo gem install revdev bundler fusuma fusuma-plugin-sendkey
sudo gpasswd -a $USER input
sudo dnf remove make automake gcc gcc-c++ kernel-devel

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
sudo dnf install adw-gtk3-theme

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

sudo sh -c "echo 'SELINUX=disabled
SELINUXTYPE=targeted' > /etc/sysconfig/selinux "


#better video
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf swap ffmpeg-free ffmpeg --allowerasing