---------------------------------------------------------------------------------------------------------
# to install global menu
sudo pacman -Syu meson
yay -S gobject-introspection
sudo pamac install xfce4-panel appmenu-gtk-module vala-panel-appmenu-xfce  vala-panel-appmenu-common vala-panel-appmenu-registrar-git vala-panel-appmenu-valapanel
#create autostart file for global menu 
mkdir ~/.config/autostart/
echo "[Desktop Entry]    
Type=Application
Exec=xfce4-panel
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true" > ~/.config/autostart/xfce4.desktop

---------------------------

#fildem
sudo pacman -S dbus-python bamf appmenu-gtk-module libkeybinder3 libdbusmenu-gtk2 libdbusmenu-gtk3 libdbusmenu-qt5 git python-pip #install dependecies
python3 -m pip install --user fuzzysearch
#install the filedem
wget https://github.com/gonzaarcr/Fildem/archive/refs/tags/0.6.7.zip
unzip 0.6.7.zip
cd Fildem*
sudo python3 setup.py install --optimize=1
cp -r fildemGMenu@gonza.com ~/.local/share/gnome-shell/extensions/
#load gtk modules
echo "gtk-modules="appmenu-gtk-module" >> ~/.gtkrc-2.0
echo "[Settings]
gtk-modules="appmenu-gtk-module" > ~/.config/gtk-3.0/settings.ini
#make a desktop file for fildem
echo "[Desktop Entry]
Type=Application
Exec=fildem
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=Fildem
Name=Fildem
Comment[en_US]=Fildem Global Menu and HUD
Comment=Fildem Global Menu and HUD" > ~/.config/autostart/fildem.desktop

-----------------------------------------------------------------
# to get qt5ct working to change qt app theme
echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> ~/.profile
------------------------------------------------------------------

#install shell theme and extensions
yay -S adwaita-shell-theme gnome-shell-extensions chrome-gnome-shell
#inscrese size of gnome shell theme
sudo sed -i '22s/.*/  font-size: 16pt;/'   /usr/share/themes/Adwaita/gnome-shell/gnome-shell.css
exit

#set wallpaper
cd ~/setup
wget https://w.wallhaven.cc/full/md/wallhaven-mdjrqy.jpg
-----------------------------------------------------------------------------------------
#load dconf data (gnome cong fig)
#dconf dump / > dconf-settings.ini
wget https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/dconf-settings.ini
cat dconf-settings.ini | dconf load /    
----------------------------------
#extensions
cd ~/.local/share/gnome-shell
rm -rf extensions
wget https://github.com/gsingh704/mysetup/raw/main/dotfiles/extensions.zip
unzip extensions.zip
----------------------------------------------------------------------------

-------------------------------------
-------------------------------------
#global appmenu in fedora
dnf config-manager --add-repo https://download.opensuse.org/repositories/home:rilian-la-te/Fedora_25/home:rilian-la-te.repo
dnf install vala-panel-appmenu 
---