#arch--------------------------------------
yay -Syu --noconfirm wget extension-manager ruby zsh git

#other
yay -Syu --noconfirm  acestream-engine acestream-launcher
yay -Syu --noconfirm binder_linux-dkms waydroid  
sudo waydroid init
yay -Syu --noconfirm docker docker-compose 

#fedora--------------------------------------------------------------------------------
sudo dnf -y install util-linux-user zsh ruby ruby-devel make automake gcc gcc-c++ kernel-devel 
#better video run in bash
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf swap ffmpeg-free ffmpeg --allowerasing


#other 
sudo dnf remove make automake gcc gcc-c++ kernel-devel
#code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update && sudo dnf install code
#docker
sudo dnf install docker docker-compose  
sudo sh -c "echo 'SELINUX=disabled
SELINUXTYPE=targeted' > /etc/sysconfig/selinux "

#ubuntu---------------------------------------------------------------------------------
sudo apt install -y zsh libevdev-dev ruby-dev build-essential  libinput-tools ruby
#docker 
sudo apt install docker-compose docker 
