alias ys 'yay -S'
alias yr 'yay -R'
alias pc 'sudo pacman -Qtdq | sudo  pacman -Rns -'
alias update-grub 'sudo grub-mkconfig -o /boot/grub/grub.cfg'

alias ft "cat ~/.local/share/gnome-shell/dconf-settings-ft.ini | dconf load /"

function __fish_add_history
    set -l cmd (string replace -- \n \\n (string join ' ' $argv) | string replace \\ \\\\)
    if test -z $cmd
        return
    end
    begin
        echo -- '- cmd:' $cmd
        and date +' when: %s'
    end >>$__fish_user_data_dir/fish_history
    and history merge
end
