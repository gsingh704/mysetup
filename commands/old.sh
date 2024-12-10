#Linux 
efibootmgr -v
sudo efibootmgr -b 0003 -B #example
---------------------------------------------------------------
#change kernel settings 
sudoedit /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="i8042.nopnp=1 pci=nocrs"
sudo update-grub   *orororororor* sudo grub-mkconfig -o /boot/grub/grub.cfg
reboot

Pop os 
sudo kernelstub -o "i8042.nopnp=1 pci=nocrs"
----------------------------------------------------

export QT_QPA_PLATFORMTHEME=qt5ct
QT_SCALE_FACTOR=1.4
----------------------------------------------

#figerprint
https://github.com/knauth/goodix-521d-explanation
pysub


###to run proton games from ntfs
sudo ntfs-3g -o uid=1000,guid=1000 /dev/nvme0n1p6 /mnt/0E72E0784E3878AE

#Gestures
#Libinput-Gestures 
sudo gpasswd -a $USER input
yay -S wmctrl xdotool libinput-gestures gestures
#config file
cd ~/.config/
wget https://github.com/gsingh704/mysetup/raw/main/dotfiles/gestures/libinput-gestures.conf
libinput-gestures-setup autostart start

#Touchegg
yay -S touchegg touche
sudo systemctl enable touchegg.service  #enble and start the service
sudo systemctl start touchegg
#config file
mkdir -p ~/.config/touchegg
cd ~/.config/touchegg
wget https://github.com/gsingh704/mysetup/raw/main/dotfiles/gestures/touchegg.conf


#fish ########################################################################################
yay -Syu --noconfirm wget fish
mkdir ~/.config/fish
cd ~/.config/fish
wget https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/sh/config.fish


##############################################################################
 to install global menu
#programs to install 
sudo pacman -Syu meson
yay -S gobject-introspection
sudo pamac install vala-panel appmenu-gtk-module vala-panel-appmenu-registrar vala-panel-appmenu-common  vala-panel-appmenu-valapanel
#create autostart file for global menu 
mkdir ~/.config/autostart/
echo "[Desktop Entry]    
Type=Application
Exec=vala-panel
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true" > ~/.config/autostart/xfce4.desktop

##############################################################
#fildem
#programs to install
 yay -Syu --noconfirm bamf appmenu-gtk-module libkeybinder3 libdbusmenu-gtk2 libdbusmenu-gtk3 libdbusmenu-qt5 python-setuptools python3 -m pip install --user fuzzysearch
#install the fildem
git clone https://github.com/Sominemo/Fildem-Gnome-45.git
cd Fildem-Gnome-45
cp -r fildemGMenu@gonza.com ~/.local/share/gnome-shell/extensions/
# sudo python3 setup.py install --optimize=1
#load gtk modules 
echo "gtk-modules='appmenu-gtk-module'" >> ~/.gtkrc-2.0
echo "[Settings]
gtk-modules='appmenu-gtk-module'" > ~/.config/gtk-3.0/settings.ini

#make a desktop file for fildem
echo "[Desktop Entry]
Type=Application
Exec=fildem
X-GNOME-Autostart-enabled=true" > ~/.config/autostart/fildem.desktop


##################################################################################################33
# to get qt5ct working to change qt app theme
echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> ~/.profile
#or
yay -S qgnomeplatform
echo "export QT_QPA_PLATFORMTHEME='gnome'" >> ~/.profile

##############################kde######################################################33

#hide title bar
kwriteconfig5 --file ~/.config/kwinrc --group Windows --key BorderlessMaximizedWindows true
qdbus org.kde.KWin /KWin reconfigure

#install apps
yay -S  plasma5-applets-window-buttons libdbusmenu-gtk3 material-kwin-decoration-git plasma5-applets-supergfxctl appmenu-gtk-module libdbusmenu-glib #plasma only

#Kde settings root
pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY KDE_SESSION_VERSION=5 KDE_FULL_SESSION=true dbus-launch systemsettings5  

-----------------------------
echo "headerbar button.titlebutton image, .titlebar button.titlebutton image {
  color: transparent;
}

headerbar button.titlebutton, .titlebar button.titlebutton {
  background-position: center;
  background-repeat: no-repeat;
  min-height: 27px;
  min-width: 27px;
  background-size: 27px 27px;
}" >> ~/.config/gtk-3.0/gtk.css

#--------------------------G14-------------------
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


#fedora
sudo dnf copr enable lukenukem/asus-linux
sudo dnf update -y
sudo dnf install kernel-devel
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda
sudo systemctl enable nvidia-hibernate.service nvidia-suspend.service nvidia-resume.servicej
sudo dnf install asusctl supergfxctl
sudo dnf update --refresh
sudo systemctl start asusd.service
sudo systemctl enable --now supergfxd.service

#ubuntu
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

################3
curl -s "https://af1cionados.vercel.app/AcEStREAM%20iDs.w3u" | jq -r '(.groups[] | (.stations[]? | "<li><img src=\"\(.image)\" alt=\"\(.name)\" style=\"max-width:40px; \"><a href=\"\(.url)\">\(.name)</a></li>"))' > 1.html 
curl -s "https://af1c1onados.vercel.app/02.Menu.Iptvs.w3u" | jq -r '.groups[].url' | sort -u | awk -F/ '!seen[$3]++ {print $0}' | while read -r URL; do curl -s "$URL" >> "1.m3u"; done > "1.m3u"