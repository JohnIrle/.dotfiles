# Path to your oh-my-zsh installation.
export ZSH=/Users/john/.oh-my-zsh

ZSH_THEME="avit"
plugins=(npm node)

export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/local/bin/nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# User configuration
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/mysql/bin"

# Used for status bar versions
iterm2_print_user_vars() {
  iterm2_set_user_var pythonVersion $(python3 -V | awk '{ print $2 }')
  iterm2_set_user_var goVersion $(go version | awk '{print $3}' | cut -b 3-6)
  iterm2_set_user_var nodeVersion $(node -v | cut -b 2-7)
  iterm2_set_user_var javaVersion $(jenv global)
}

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
TMUX_CONFIG="~/.config/tmux/.tmux.conf"
# alias tmux="TERM=screen-256color-bce tmux"
alias tn="tmux -u -f $TMUX_CONFIG new"
alias ta="tmux -u -f $TMUX_CONFIG attach"
alias tt="nvim $TMUX_CONFIG"

# Git
alias gs="git status"
alias ga="git add"
alias glo='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias branches='git log --graph --oneline --branches'


alias python=/usr/local/bin/python3
alias pip=/usr/local/opt/python@3.8/bin/pip3

export PATH=$PATH:~/.local/bin

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

# Go
export GOPATH="$HOME/Developer/go"
export PATH="$PATH:$GOPATH/bin"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Swift
export TOOLCHAINS=swift

export PATH="~/Library/Python/3.7/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Android Studio
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
