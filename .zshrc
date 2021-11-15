export ZSH="/home/j/.oh-my-zsh"
ZSH_THEME="agnoster"
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
