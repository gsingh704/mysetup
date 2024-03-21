fpath=(/usr/share/zsh/site-functions $fpath)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY && setopt hist_ignore_dups && setopt inc_append_history 
autoload -Uz promptinit compinit && promptinit && compinit
prompt fade blue
bindkey "^[[3~" delete-char
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#alias
alias ys="yay -S"
alias yr="yay -R"
alias pc="sudo pacman -Qtdq | sudo  pacman -Rns -"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias lp='gsettings set org.gnome.desktop.interface text-scaling-factor 1 && dconf write /org/gnome/shell/extensions/dash-to-panel/panel-sizes "'\''{\"0\":21,\"1\":21}'\''"'

alias dm='gsettings set org.gnome.desktop.interface text-scaling-factor 1.25 && dconf write /org/gnome/shell/extensions/dash-to-panel/panel-sizes "'\''{\"0\":25,\"1\":25}'\''"'

alias ft="cat ~/.local/share/gnome-shell/dconf-settings-ft.ini | dconf load /"