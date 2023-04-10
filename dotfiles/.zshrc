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

alias lp="gsettings set org.gnome.desktop.interface text-scaling-factor 1.25 && cp -r ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome-lp.css ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome.css"

alias dm="gsettings set org.gnome.desktop.interface text-scaling-factor 1.50 && cp -r ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome-dm.css ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome.css " 

alias ft="cat ~/.local/share/gnome-shell/dconf-settings-ft.ini | dconf load / && cp -r ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome-lp.css ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome.css  "