# Taran's .zshrc Config :D

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# Zinit plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# zinit light unixorn/fzf-zsh-plugin

## Loading completions
autoload -U compinit && compinit

# Keybindings
bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

## Enabling history via autosuggestions
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

## Setting options via autosuggestions
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#dde3e1,bold,underline"

# Aliases
alias ls='ls --color'
alias cat='bat'
alias ya='yazi'
alias config='zed ~/.config/'

## Arch Linux
### yay
alias yar='yay -R'
alias yas='yay -S'
alias yass='yay -Ss'

## Python Specific Aliases
### uv venv
alias venv='uv venv'
alias pipi='uv pip install'
alias pipl='uv pip list'
alias pipr='uv pip install -r requirements.txt'
alias py='python3'

## Git Specific Aliases
alias gs='git status'
alias ga='git add'
alias gcom='git commit -m'
alias gpom='git push origin main -u'

## Fetches
alias ff='fastfetch'

# Exports
export PATH=/usr/local/texlive/2025/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2025/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2025/texmf-dist/doc/info:$INFOPATH

# Initialising stuff :D
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
. "$HOME/.local/bin/env"
