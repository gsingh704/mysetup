export ZSH="/home/$USER/.oh-my-zsh"
ZSH_THEME="jonathan"
plugins=(git zsh-completions  zsh-autosuggestions  zsh-navigation-tools zsh-history-substring-search zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias ys="yay -S"
alias yr="yay -R"
alias pc="sudo pacman -Qtdq | sudo  pacman -Rns -"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
eval "$(github-copilot-cli alias -- "$0")"

alias lp='gsettings set org.gnome.desktop.interface text-scaling-factor 1.07 && dconf write /org/gnome/shell/extensions/dash-to-panel/panel-sizes "'\''{\"0\":17,\"1\":17}'\''"'

alias dm='gsettings set org.gnome.desktop.interface text-scaling-factor 1.25 && dconf write /org/gnome/shell/extensions/dash-to-panel/panel-sizes "'\''{\"0\":24,\"1\":24}'\''"'

alias ft="cat ~/.local/share/gnome-shell/dconf-settings-ft.ini | dconf load /"