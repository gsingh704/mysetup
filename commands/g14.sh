https://www.reddit.com/r/ZephyrusG14/comments/qhjxs6/zephyrus_g14_arch_install_guide/

#post install

#with root
sudo su 
echo "
[g14]
SigLevel = DatabaseNever Optional TrustAll
Server = https://arch.asus-linux.org" >> /etc/pacman.conf
exit 

sudo pacman -Suy
sudo pacman -S asusctl supergfxctl
systemctl enable --now power-profiles-daemon.service
systemctl enable --now supergfxd.service



supergfxctl -g #Check  graphics mode; has to be integrated
supergfxctl -m integrated #to switch , logout 
sudo pacman -S linux-g14 linux-g14-headers


#installing nvidia-drivers
  sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils

#hybrid mode----optional
  sudo pacman -S nvidia-prime
  prime-run <application_name>
  sudo pacman -S mesa mesa-demos
  prime-run glxinfo | grep OpenGL #if nvidia,, ok


#gnome extension
  sudo pacman -S nodejs npm
  git clone git@gitlab.com:asus-linux/asusctl-gex.git
  npm install
  npm run build && npm run install-user
  #sudo pacman -R nodejs npm

#mic button
  evdev:input:b0003v0B05p1866*
  KEYBOARD_KEY_ff31007c=f20 # x11 mic-mute
  sudo systemd-hwdb update
  sudo udevadm trigger

  