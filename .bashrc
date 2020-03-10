#
# ~/.bashrc
#
PS1='${debian_chroot:+($debian_chroot)}\[\e[1;38;5;105m\]\u@\h\[\e[1;38;5;105m\]:\[\e[1;38;5;132m\]\w\[\033[00m\]\$ '

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

LS_COLORS=$LS_COLORS:'di=1;035:ex=1;036' ; export LS_COLORS

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias vim="nvim"
alias tmux="env TERM=xterm-256color tmux"

export TODOTXT_DEFAULT_ACTION=ls
alias t='todo.sh -d ~/.todo/config'

alias config="vim ~/.config/nvim/init.vim"

export EDITOR=nvim

complete -F todo t

# for rust
export PATH="$HOME/.cargo/bin:$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

xset b off
