
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
