# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=/Users/john/.oh-my-zsh
export RUST_BACKTRACE=1
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git npm node zsh-autosuggestions zsh-syntax-highlighting)

export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/local/bin/nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# User configuration
export PATH="/usr/local/sbin:$PATH"

export PATH=$PATH:~/.local/bin

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
alias find='fd'
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
