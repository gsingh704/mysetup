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

