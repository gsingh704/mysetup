export ZSH="/home/$USER/.oh-my-zsh"
ZSH_THEME="jonathan"
plugins=(git zsh-completions  zsh-completions 
zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search
)
source $ZSH/oh-my-zsh.sh

alias ys="yay -S"
alias yr="yay -R"
alias ps="sudo pacman -Syu"
alias pr="sudo pacman -R"
alias pc="sudo pacman -Qtdq |sudo  pacman -Rns -"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias lp="cat ~/.local/share/gnome-shell/dconf-settings-lp.ini | dconf load / && cp -r ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome-lp.css ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome.css && cp -r ~/.librewolf/mb4zcv2w.default-release/chrome/userChrome-lp.css ~/.librewolf/mb4zcv2w.default-release/chrome/userChrome.css  "

alias dm="cat ~/.local/share/gnome-shell/dconf-settings-dm.ini | dconf load / && cp -r ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome-dm.css ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome.css && cp -r ~/.librewolf/mb4zcv2w.default-release/chrome/userChrome-dm.css ~/.librewolf/mb4zcv2w.default-release/chrome/userChrome.css " 


alias gm="cat ~/.local/share/gnome-shell/dconf-settings-gm.ini | dconf load / && cp -r ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome-lp.css ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome.css && cp -r ~/.librewolf/mb4zcv2w.default-release/chrome/userChrome-lp.css ~/.librewolf/mb4zcv2w.default-release/chrome/userChrome.css  "

alias gdm="cat ~/.local/share/gnome-shell/dconf-settings-gm-dm.ini | dconf load / && cp -r ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome-dm.css ~/.mozilla/firefox/cz8slumt.default-release/chrome/userChrome.css && cp -r ~/.librewolf/mb4zcv2w.default-release/chrome/userChrome-dm.css ~/.librewolf/mb4zcv2w.default-release/chrome/userChrome.css " 
