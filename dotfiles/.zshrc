export ZSH="/home/$USER/.oh-my-zsh"
ZSH_THEME="jonathan"
plugins=(git zsh-completions  zsh-autosuggestions zsh-history-substring-search zsh-navigation-tools zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh

alias ys="yay -S"
alias yr="yay -R"
alias pc="sudo pacman -Qtdq | sudo  pacman -Rns -"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias lp='gsettings set org.gnome.desktop.interface text-scaling-factor 1 && dconf write /org/gnome/shell/extensions/dash-to-panel/panel-sizes "'\''{\"0\":16,\"1\":16}'\''"'

alias dm='gsettings set org.gnome.desktop.interface text-scaling-factor 1.25 && dconf write /org/gnome/shell/extensions/dash-to-panel/panel-sizes "'\''{\"0\":24,\"1\":24}'\''"'

alias ft="cat ~/.local/share/gnome-shell/dconf-settings-ft.ini | dconf load /"