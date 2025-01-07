# Path to your oh-my-zsh installation.
export ZSH=/Users/john/.oh-my-zsh
export RUST_BACKTRACE=1
ZSH_THEME=""
plugins=(git npm node kubectl zsh-autosuggestions zsh-syntax-highlighting)

addToPath() {
  if [[ "$PATH" != *"$1"* ]]; then
    export PATH=$PATH:$1
  fi
}

addToPathFront() {
  if [[ "$PATH" != *"$1"* ]]; then
    export PATH=$1:$PATH
  fi
}


export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/local/bin/nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# User configuration
addToPathFront /usr/local/sbin
addToPath $HOME/.local/bin

export LC_ALL=en_US.UTF-8

# Jenv
eval "$(jenv init -)" >>/Users/john/.zshrc
export JENV_ROOT=/usr/local/opt/jenv

source $ZSH/oh-my-zsh.sh


#Homebrew
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
alias vim='nvim'
alias zconfig="nvim ~/.zshrc"
alias zsource="source ~/.zshrc"
alias youtube-audio='yt-dlp --ignore-errors --output "%(title)s.%(ext)s" --extract-audio --audio-format mp3 --audio-quality 0'
alias reset-cam='sudo killall VDCAssistant'
alias cd..='cd ..'
alias ..='cd ..'
alias cat='bat'
alias ls='lsd'
alias la='ls -a'
# alias find='fd' 
alias grep='rg'
alias k="kubectl"
alias kns="kubens"
alias pysource="source ./venv/bin/activate"

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
addToPathFront /usr/local/opt/llvm/bin

# Go
export GOPATH="$HOME/Developer/go"
addToPath $GOPATH/bin

# Rust
addToPathFront $HOME/.cargo/bin:$PATH
export CARGO_TARGET_DIR="$HOME/.cargo-target"

# Swift
export TOOLCHAINS=swift

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# opam configuration
[[ ! -r /Users/john/.opam/opam-init/init.zsh ]] || source /Users/john/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
addToPathFront /Users/john/.opam/default/bin

export DOTNET_ROOT=/usr/local/share/dotnet/
export DOTNET_TOOLS=/Users/john/.dotnet/tools
addToPath $DOTNET_ROOT:$DOTNET_TOOLS


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
addToPath $HOME/.rvm/bin

addToPathFront  ${KREW_ROOT:-$HOME/.krew}/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Asdf
source /usr/local/opt/asdf/libexec/asdf.sh

eval "$(starship init zsh)"

[ -f "/Users/john/.ghcup/env" ] && . "/Users/john/.ghcup/env" # ghcup-env
