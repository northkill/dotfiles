export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=nvim-qt
# export RANGER_LOAD_DEFAULT_RC=FALSE

export GTK_IM_MODULE=xim
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

alias sl="sl | lolcat"
alias mpc="mpc --host=${HOME}/.config/mpd/socket"

export PATH="${PATH}:/home/asdf/.npm-global/bin"

eval "$(thefuck --alias)"

export GOPATH="${HOME}/go"
export PATH="${PATH}:${GOPATH}/bin"

source /usr/share/nvm/init-nvm.sh

export PAGER=nvimpager
