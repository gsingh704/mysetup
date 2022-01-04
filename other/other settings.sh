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

#Autoremove arch
sudo pacman -Qtdq |sudo  pacman -Rns -
 
#figerprint
https://github.com/knauth/goodix-521d-explanation
pysub

#brighness
gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Screen.StepUp
gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Screen.StepDown