# Path to your oh-my-zsh installation.
export ZSH=/Users/john/.oh-my-zsh
export RUST_BACKTRACE=1
ZSH_THEME=""
plugins=(git npm node zsh-autosuggestions zsh-syntax-highlighting)

export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/local/bin/nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# User configuration
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

export PATH=$PATH:~/.local/bin

export PKG_CONFIG_PATH="$(brew --prefix glib)/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(brew --prefix libffi)/lib/pkgconfig"
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
# alias find='fd'
alias grep='rg'
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
export CARGO_TARGET_DIR="$HOME/.cargo-target"

# Swift
export TOOLCHAINS=swift

# Composer / valet
export PATH=$PATH:~/.composer/vendor/bin

export DOTNET_ROOT="$HOMEBREW_PREFIX/opt/dotnet/libexec"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source /Users/john/.config/broot/launcher/bash/br

eval "$(rbenv init - zsh)"
eval "$(starship init zsh)"

# Asdf
. /usr/local/opt/asdf/libexec/asdf.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# opam configuration
[[ ! -r /Users/john/.opam/opam-init/init.zsh ]] || source /Users/john/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

[ -f "/Users/john/.ghcup/env" ] && . "/Users/john/.ghcup/env" # ghcup-env
