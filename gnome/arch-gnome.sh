 #install main applications
 yay -S firefox-appmenu-bin  wget pamac-aur qt5ct papirus-icon-theme adwaita-qt
----------------------------------------------------------------------------------------------------------
# to install global menu
sudo pacman -Syu meson
yay -S gobject-introspection
sudo pamac install xfce4-panel appmenu-gtk-module vala-panel-appmenu-xfce vala-panel-appmenu-budgie vala-panel-appmenu-common vala-panel-appmenu-registrar-git vala-panel-appmenu-valapanel

#create autostart file for global menu 
mkdir ~/.config/autostart/
echo "[Desktop Entry]    
Type=Application
Exec=xfce4-panel
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true" > ~/.config/autostart/xfce4.desktop

---------------------

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


---------------------------------------------------------------
#to install pipewire for good bluetooth support
sudo pamac install pipewire-pulse pipewire-alsa 
-----------------------------------------------------------------
# to get qt5ct working to change qt app theme
echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> ~/.profile
------------------------------------------------------------------
# install netdata
bash <(curl -Ss https://my-netdata.io/kickstart.sh)
------------------------------------------------------------------

#install shell theme and extensions
yay -S adwaita-shell-theme gnome-shell-extensions chrome-gnome-shell gnome-shell-extension-unite gnome-shell-extension-vitals gnome-shell-extension-arc-menu 

# install dash-to-panel-extension
mkdir setup
cd /home/j/setup/
git clone https://github.com/home-sweet-gnome/dash-to-panel.git
cd dash-to-panel
make install

#enable extensions
gnome-extensions enable dash-to-panel@jderose9.github.com
gnome-extensions enable unite@hardpixel.eu
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable Vitals@CoreCoding.com
gnome-extensions enable arcmenu@arcmenu.com

#inscrese size of gnome shell theme
sudo sed -i '22s/.*/  font-size: 16pt;/'   /usr/share/themes/Adwaita/gnome-shell/gnome-shell.css
exit
#change gnome shell theme
gsettings set org.gnome.shell.extensions.user-theme name "Adwaita"
#set wallpaper
wget https://w.wallhaven.cc/full/md/wallhaven-mdjrqy.jpg
gsettings set org.gnome.desktop.background picture-uri file:///home/j/setup/wallhaven-mdjrqy.jpg
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark" #change app themes
gsettings set org.gnome.desktop.interface font-name 'Cantarell Regular 16' #change font size
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark' #change icon theme
------------------------------------------------------------------------------------------------------------

yay -S zsh  #install zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  #install oh-my-zsh
#install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
#make changes to .zshrc file


cd ~
wget https://raw.githubusercontent.com/gsingh704/mysetup/main/.zshrc

----------------------------------------------------------------------------
------------------------------------------------------------------------------
no vbox
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
#enable touchpad of lenovo v-14 ill
sudo su
sed -i '6s/.*/GRUB_CMDLINE_LINUX_DEFAULT="i8042.nopnp=1 pci=nocrs usbcore.autosuspend=-1"/'   /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

#edit environment to get better firefox support
echo "MOZ_ENABLE_WAYLAND=1
MOZ_USE_XINPUT2=1" >> /etc/environment

-----------------------------------------
#enable bluetooth on endevor os
sudo pacman -S --needed bluez bluez-utils 
sudo systemctl enable --now bluetooth
----------------------------------------------
#install and configure libinput-gesture 
sudo gpasswd -a $USER input
yay -S wmctrl xdotool libinput-gestures gestures
wget https://github.com/gsingh704/mysetup/raw/main/libinput-gestures.conf
cp libinput-gestures.conf ~/.config/
libinput-gestures-setup autostart start
------------------------------------------------------
#go to setting and add these costum shortcut
decrease brightness:   
sh -c 'gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Screen.StepDown && gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Screen.StepDown'
increase brightness:
sh -c 'gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Screen.StepUp && gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Screen.StepUp'
-------------------------------------
-------------------------------------
-------------------------------------
#global appmenu in fedora
dnf config-manager --add-repo https://download.opensuse.org/repositories/home:rilian-la-te/Fedora_25/home:rilian-la-te.repo
dnf install vala-panel-appmenu alien
