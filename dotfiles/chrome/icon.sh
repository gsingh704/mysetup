yay -S papirus-icon-theme
sudo rm -rf  /usr/share/icons/ap
mkdir ~/.icons
cd ~/.icons
sudo cp -r /usr/share/icons/Adwaita .
sudo cp -r /usr/share/icons/Papirus* .
sudo chmod -R 777 *

cp -rf  Papirus-Dark/16x16/mimetypes/* Adwaita/16x16/mimetypes
cp -rf  Papirus-Dark/22x22/mimetypes/* Adwaita/22x22/mimetypes
cp -rf  Papirus-Dark/24x24/mimetypes/* Adwaita/24x24/mimetypes
cp -rf  Papirus-Dark/32x32/mimetypes/* Adwaita/32x32/mimetypes
cp -rf  Papirus-Dark/48x48/mimetypes/* Adwaita/48x48/mimetypes
cp -rf  Papirus-Dark/64x64/mimetypes/* Adwaita/64x64/mimetypes
cp -rf  Papirus-Dark/96x96/mimetypes/* Adwaita/96x96/mimetypes

cp -rf  Papirus-Dark/16x16/apps/* Adwaita/16x16/apps
cp -rf  Papirus-Dark/22x22/apps/* Adwaita/22x22/apps
cp -rf  Papirus-Dark/24x24/apps/* Adwaita/24x24/apps
cp -rf  Papirus-Dark/32x32/apps/* Adwaita/32x32/apps
cp -rf  Papirus-Dark/48x48/apps/* Adwaita/48x48/apps
cp -rf  Papirus-Dark/64x64/apps/* Adwaita/64x64/apps
cp -rf  Papirus-Dark/96x96/apps/* Adwaita/96x96/apps

mv Adwaita ap 
rm -rf ap/icon-theme.cache
sudo mv ap /usr/share/icons/

rm -rf ~/.icons
yay -R papirus-icon-theme


#adwaita---------------------------------------------------
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
