
#hide title bar
kwriteconfig5 --file ~/.config/kwinrc --group Windows --key BorderlessMaximizedWindows true
qdbus org.kde.KWin /KWin reconfigure


#install app
yay -S libinput_gestures_qt plasma5-applets-window-buttons  #plasma only



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
