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

#brighness
gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Screen.StepUp
gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Screen.StepDown

###to run proton games from ntfs
sudo ntfs-3g -o uid=1000,guid=1000 /dev/nvme0n1p6 /mnt/0E72E0784E3878AE



alias lp="gsettings set org.gnome.desktop.interface text-scaling-factor 1.25 && cp -r ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome-lp.css ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome.css"

alias dm="gsettings set org.gnome.desktop.interface text-scaling-factor 1.50 && cp -r ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome-dm.css ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome.css " 
