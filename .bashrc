#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR='emacs'
export TERMINAL='urxvt'

# natural scrolling
xinput --set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" 1
#xinput --set-prop "SynPS/2 Synaptics TouchPad" "libinput Accel Speed" +1

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi

alias open='xdg-open'
alias ls='ls --color=auto'
alias ll='ls -lah'
#PS1='[\u@\h \W]\$ '
PS1="[\u@\h]\$ "

# initiate xorg stuff that don't get done correctly for some reasons
xrdb -merge ~/.Xresources
