sudo su


echo "
[g14]
SigLevel = DatabaseNever Optional TrustAll
Server = https://arch.asus-linux.org" >> /etc/pacman.conf

echo "evdev:input:b0003v0B05p1866*
KEYBOARD_KEY_ff31007c=f20 # x11 mic-mute" >> /etc/udev/hwdb.d/90-nkey.hwdb

echo "MOZ_ENABLE_WAYLAND=1
MOZ_USE_XINPUT2=1
MOZ_X11_EGL=1" >> /etc/environment
