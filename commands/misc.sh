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

