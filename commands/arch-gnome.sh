# to install global menu
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
#get vala-panel config panels
mkdir -p ~/.config/vala-panel
cd ~/.config/vala-panel/
wget https://github.dev/gsingh704/mysetup/main/dotfiles/vala-panel/default

##############################################################
#fildem
#programs to install
sudo pacman -S dbus-python bamf appmenu-gtk-module libkeybinder3 libdbusmenu-gtk2 libdbusmenu-gtk3 libdbusmenu-qt5 git python-pip #install dependecies
python3 -m pip install --user fuzzysearch
#install the fildem
wget https://github.com/gonzaarcr/Fildem/archive/refs/tags/0.6.7.zip
unzip 0.6.7.zip
cd Fildem*
sudo python3 setup.py install --optimize=1
cp -r fildemGMenu@gonza.com ~/.local/share/gnome-shell/extensions/
#load gtk modules 
echo "gtk-modules='appmenu-gtk-module'" >> ~/.gtkrc-2.0
echo "[Settings]
gtk-modules='appmenu-gtk-module'" > ~/.config/gtk-3.0/settings.ini

#make a desktop file for fildem
echo "[Desktop Entry]
Type=Application
Exec=fildem
X-GNOME-Autostart-enabled=true" > ~/.config/autostart/fildem.desktop

###########################################################################3
#icon theme 
yay -S adwaita-plus-git
mkdir ~/.icons
cd ~/.icons
sudo cp -r /usr/share/icons/Adwaita* .
sudo chmod -R 777 *
cp -rf Adwaita++-Dark/mimetypes/16/* Adwaita/16x16/mimetypes
cp -rf Adwaita++-Dark/mimetypes/22/* Adwaita/22x22/mimetypes
cp -rf Adwaita++-Dark/mimetypes/24/* Adwaita/24x24/mimetypes
cp -rf Adwaita++-Dark/mimetypes/32/* Adwaita/32x32/mimetypes
cp -rf Adwaita++-Dark/mimetypes/48/* Adwaita/48x48/mimetypes
cp -rf Adwaita++-Dark/mimetypes/scalable/* Adwaita/scalable/mimetypes
mv Adwaita ad 
rm -rf ad/icon-theme.cache
sudo mv ad /usr/share/icons/
rm -rf ~/.icons
yay -R  adwaita-plus-git


##################################################################################################33
# to get qt5ct working to change qt app theme
echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> ~/.profile
#or
yay -S qgnomeplatform
echo "export QT_QPA_PLATFORMTHEME='gnome'" >> ~/.profile
 

#install shell theme and extensions
yay -S   chrome-gnome-shell
#inscrese size of gnome shell theme
mkdir -p ~/.themes/adwaita_big/gnome-shell/
echo "stage {font-size: 16pt;}" >> ~/.themes/adwaita_big/gnome-shell/gnome-shell.css
dconf write /org/gnome/shell/extensions/user-theme/name "'adwaita_big'"

#load dconf data (gnome config)
#dconf dump / > dconf-settings.ini
wget https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/gnome/dconf-settings.ini
cat dconf-settings.ini | dconf load /    
 
#extensions
cd ~/.local/share/gnome-shell
rm -rf extensions
wget https://github.com/gsingh704/mysetup/raw/main/dotfiles/gnome/extensions.zip
unzip extensions.zip

#global appmenu in fedora
dnf config-manager --add-repo https://download.opensuse.org/repositories/home:rilian-la-te/Fedora_25/home:rilian-la-te.repo
dnf install vala-panel-appmenu 
    ---

#decrease brightness:   
sh -c 'gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Screen.StepDown && gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Screen.StepDown'
#increase brightness:
sh -c 'gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Screen.StepUp && gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Screen.StepUp'
