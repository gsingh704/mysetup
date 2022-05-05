yay -S adwaita-plus-git
sudo rm -rf /usr/share/icons/ad
mkdir ~/.icons
cd ~/.icons
sudo cp -r /usr/share/icons/Adwaita* .
sudo chmod -R 777 *
git clone https://gitlab.gnome.org/Conspiracy/skeuowaita


cp -rf Adwaita++/mimetypes/scalable/* Adwaita/scalable/mimetypes
cp -rf skeuowaita/scalable/apps/* Adwaita/scalable/apps


mv Adwaita ad 
rm -rf ad/icon-theme.cache
sudo mv ad /usr/share/icons/
rm -rf ~/.icons
yay -R  adwaita-plus-git
