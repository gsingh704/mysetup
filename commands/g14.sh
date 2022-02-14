https://www.reddit.com/r/ZephyrusG14/comments/qhjxs6/zephyrus_g14_arch_install_guide/

#post install

#with root-------------
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

sudo pacman -S nodejs npm
git clone https://gitlab.com/asus-linux/asusctl-gex.git /tmp/asusctl-gex && cd /tmp/asusctl-gex
npm install
npm run build && npm run install-user 
#sudo pacman -R nodejs npm

supergfxctl -g #Check  graphics mode; has to be integrated
supergfxctl -m integrated #to switch , logout 
sudo pacman -S linux-g14 linux-g14-headers
sudo grub-mkconfig -o /boot/grub/grub.cfg

#installing nvidia-drivers
  sudo pacman -S nvidia nvidia-dkms nvidia-utils lib32-nvidia-utils

#hybrid mode----optional
  sudo pacman -S nvidia-prime
  prime-run <application_name>
  sudo pacman -S mesa mesa-demos
  prime-run glxinfo | grep OpenGL #if nvidia,, ok




#mic button
sudo su 
echo "evdev:input:b0003v0B05p1866*
KEYBOARD_KEY_ff31007c=f20 # x11 mic-mute" >> /etc/udev/hwdb.d/90-nkey.hwdb
exit
sudo systemd-hwdb update
sudo udevadm trigger


#fan profile
sudo rm -rf /etc/asusd/profile.conf
asusctl fan-curve -m quiet -D 30c:0,40c:0,50c:0,60c:0,70c:35,80c:55,90c:65,100c:65  -e true -f cpu
asusctl fan-curve -m quiet -D 30c:0,40c:0,50c:0,60c:0,70c:35,80c:55,90c:65,100c:65  -e true -f gpu
asusctl fan-curve -m balanced -D 30c:0,40c:0,50c:0,60c:0,70c:35,80c:55,90c:65,100c:65  -e true -f gpu
asusctl fan-curve -m balanced -D 30c:0,40c:0,50c:0,60c:0,70c:35,80c:55,90c:65,100c:65  -e true -f cpu
asusctl fan-curve -m performance -D 30c:0,40c:0,50c:0,60c:10,70c:55,80c:90,90c:100,100c:100 -e true -f cpu
asusctl fan-curve -m performance -D 30c:0,40c:0,50c:0,60c:10,70c:55,80c:90,90c:100,100c:100 -e true -f gpu


  
