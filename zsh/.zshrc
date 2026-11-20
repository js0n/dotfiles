# Prompt
eval "$(starship init zsh)"

# Editor
alias vim="nvim"

# Listing (eza)
alias l="eza --group-directories-first --icons=auto"
alias ll="eza -la --git --group-directories-first --icons=auto"
alias lt="eza --tree --level=2 --group-directories-first --icons=auto"
alias lm="eza -la --sort=modified --git --icons=auto"

# Runtime versions (mise)
eval "$(mise activate zsh)"
