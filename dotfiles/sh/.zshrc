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
alias ft="cat ~/.local/share/gnome-shell/dconf-settings-ft.ini | dconf load /"
alias ace='function _ace() { mpv "http://127.0.0.1:6878/ace/getstream?id=${1#acestream://}"; }; _ace'
alias dace='docker run -it  --rm -p 6878:6878 blaiseio/acelink'