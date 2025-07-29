if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Environment variables
set -U fish_greeting
set -gx EDITOR nvim
set -gx SUDO_EDITOR nvim

# Aliases
alias ga='git add'
alias gcom="git commit -m"
alias gpom="git push origin main"

alias reload="source ~/.config/fish/config.fish"
alias ls="eza --icons -l --header"

# Startup functions
zoxide init fish | source
starship init fish | source
