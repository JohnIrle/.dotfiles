# Path to your oh-my-zsh installation.
export ZSH=/Users/john/.oh-my-zsh

ZSH_THEME="avit"
plugins=(npm node)

export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/local/bin/nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# User configuration
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

export PATH=$PATH:~/.local/bin

# Used for status bar versions
iterm2_print_user_vars() {
  iterm2_set_user_var pythonVersion $(python3 -V | awk '{ print $2 }')
  iterm2_set_user_var goVersion $(go version | awk '{print $3}' | cut -b 3-8)
  iterm2_set_user_var nodeVersion $(node -v | cut -b 2-9)
  iterm2_set_user_var javaVersion $(jenv global)
  iterm2_set_user_var rustVersion $(rustc -V | awk '{print $2 }')
}

# Jenv
eval "$(jenv init -)" >>/Users/john/.zshrc
export JENV_ROOT=/usr/local/opt/jenv

source $ZSH/oh-my-zsh.sh

function webstorm {
  open -na "WebStorm.app" --args "$1"
}

#Homebrew
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
alias vim='nvim'
alias zconfig="nvim ~/.zshrc"
alias zsource="source ~/.zshrc"
alias youtube-audio='youtube-dl --ignore-errors --output "%(title)s.%(ext)s" --extract-audio --audio-format mp3 --audio-quality 0'
alias reset-cam='sudo killall VDCAssistant'
alias cd..='cd ..'
alias ..='cd ..'
alias cat='bat'
alias ls='lsd'
alias k="kubectl"
alias pysource="source ./venv/bin/activate"
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Tmux
TMUX_CONFIG="~/.config/tmux/.tmux.conf"
alias tmux="tmux -u -f $TMUX_CONFIG"
alias tn="tmux -u -f $TMUX_CONFIG new"
alias ta="tmux -u -f $TMUX_CONFIG attach"
alias tt="nvim $TMUX_CONFIG"

# Git
alias gs="git status"
alias ga="git add"
alias glo='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias branches='git log --graph --oneline --branches'

# clangd
export PATH="/usr/local/opt/llvm/bin:$PATH"

# Go
export GOPATH="$HOME/Developer/go"
export PATH="$PATH:$GOPATH/bin"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Swift
export TOOLCHAINS=swift

# Composer / valet
export PATH=$PATH:~/.composer/vendor/bin

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source /Users/john/.config/broot/launcher/bash/br

eval "$(rbenv init - zsh)"
