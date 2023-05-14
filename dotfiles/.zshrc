export ZSH="/home/$USER/.oh-my-zsh"
ZSH_THEME="jonathan"
plugins=(git zsh-completions  zsh-completions 
zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search
)
source $ZSH/oh-my-zsh.sh

alias ys="yay -S"
alias yr="yay -R"
alias pc="sudo pacman -Qtdq | sudo  pacman -Rns -"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
eval "$(github-copilot-cli alias -- "$0")"

alias lp="gsettings set org.gnome.desktop.interface text-scaling-factor 1.18 "

alias dm="gsettings set org.gnome.desktop.interface text-scaling-factor 1.25" 

alias ft="cat ~/.local/share/gnome-shell/dconf-settings-ft.ini | dconf load /"