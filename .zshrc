# Path to your oh-my-zsh installation.
export ZSH=/Users/John/.oh-my-zsh

ZSH_THEME="avit"
plugins=(npm node)

export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/local/bin/nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# User configuration
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/mysql/bin"

[ -d "$HOME/Library/Android/sdk" ] && ANDROID_SDK=$HOME/Library/Android/sdk || ANDROID_SDK=$HOME/Android/Sdk
echo "export ANDROID_SDK=$ANDROID_SDK" >> ~/`[[ $SHELL == *"zsh" ]] && echo '.zshrc' || echo '.bash_profile'`

echo "export PATH=$HOME/Library/Android/sdk/platform-tools:\$PATH" >> ~/`[[ $SHELL == *"zsh" ]] && echo '.zshrc' || echo '.bash_profile'`


# Jenv
eval "$(jenv init -)" >> /Users/john/.zshrc
export JENV_ROOT=/usr/local/opt/jenv

source $ZSH/oh-my-zsh.sh

# Hub
eval "$(hub alias -s)"

#Homebrew
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'

alias zshconfig="nvim ~/.zshrc"
alias youtube-audio='youtube-dl --ignore-errors --output "%(title)s.%(ext)s" --extract-audio --audio-format mp3 --audio-quality 0'
alias reset-cam='sudo killall VDCAssistant'
alias work="cd ~/Developer/charterandgo/admin_ui && code . && npm start"
alias cd..='cd ..'
alias ..='cd ..'
alias cat='bat'
alias k="kubectl"

# Tmux
alias tmux="TERM=screen-256color-bce tmux"
alias tn="tmux -u new"
alias ta="tmux -u attach"
alias tt="nvim ~/.tmux.conf"

# Git
alias gs="git status"
alias ga="git add"
alias glo='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias branches='git log --graph --oneline --branches'


alias python=/usr/local/bin/python3
alias pip=/usr/local/opt/python@3.8/bin/pip3

export PATH=/usr/local/php5/bin:$PATH # php
export PATH=$PATH:~/.local/bin

export PATH="/usr/local/sbin:$PATH"

# Go
export GOPATH="$HOME/Developer/go"
export PATH="$PATH:$GOPATH/bin"

# perlbrew
source ~/perl5/perlbrew/etc/bashrc

# rbenv
eval "$(rbenv init -)"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Swift
export TOOLCHAINS=swift

export PATH="/Users/john/Library/Python/3.7/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=/Users/john/Library/Android/sdk
export PATH=/Users/john/Library/Android/sdk/platform-tools:$PATH
alias config='git --git-dir=/Users/john/.cfg/ --work-tree=/Users/john'
