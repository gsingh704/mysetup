#fish ########################################################################################
yay -Syu --noconfirm wget fish
mkdir ~/.config/fish
cd ~/.config/fish
wget https://raw.githubusercontent.com/gsingh704/mysetup/main/dotfiles/config.fish


#symbolic link
ln -s ~/.vscode /mnt/partition/backup/vscode
ln -s ~/.mozilla /mnt/partition/backup/mozilla
ln -s ~/.config/Code /mnt/partition/backup/Code
ln -s ~/.local/share/gnome-shell/extensions /mnt/partition/backup/extensions
