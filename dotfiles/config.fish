alias ys 'yay -S'
alias yr 'yay -R'
alias pc 'sudo pacman -Qtdq | sudo  pacman -Rns -'
alias update-grub 'sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias lp 'gsettings set org.gnome.desktop.interface text-scaling-factor 1.07 ; and dconf write /org/gnome/shell/extensions/dash-to-panel/panel-sizes (string escape \'{"0":17,"1":17}\')'

alias dm 'gsettings set org.gnome.desktop.interface text-scaling-factor 1.25 ; and dconf write /org/gnome/shell/extensions/dash-to-panel/panel-sizes (string escape \'{"0":24,"1":24}\')'

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

function __copilot_what-the-shell
    set TMPFILE (mktemp)
    trap 'rm -f $TMPFILE' EXIT
    if github-copilot-cli what-the-shell $argv --shellout $TMPFILE
        if test -e $TMPFILE
            set FIXED_CMD (cat $TMPFILE)
            __fish_add_history $FIXED_CMD
            eval $FIXED_CMD
        else
            echo "Apologies! Extracting command failed"
        end
    else
        return 1
    end
end
alias 'gc'='__copilot_what-the-shell'

function __copilot_git-assist
    set TMPFILE (mktemp)
    trap 'rm -f $TMPFILE' EXIT
    if github-copilot-cli git-assist $argv --shellout $TMPFILE
        if test -e $TMPFILE
            set FIXED_CMD (cat $TMPFILE)
            __fish_add_history $FIXED_CMD
            eval $FIXED_CMD
        else
            echo "Apologies! Extracting command failed"
        end
    else
        return 1
    end
end
alias 'ggc'='__copilot_git-assist'

function __copilot_gh-assist
    set TMPFILE (mktemp)
    trap 'rm -f $TMPFILE' EXIT
    if github-copilot-cli gh-assist $argv --shellout $TMPFILE
        if test -e $TMPFILE
            set FIXED_CMD (cat $TMPFILE)
            __fish_add_history $FIXED_CMD
            eval $FIXED_CMD
        else
            echo "Apologies! Extracting command failed"
        end
    else
        return 1
    end
end
alias 'ghgc'='__copilot_gh-assist'