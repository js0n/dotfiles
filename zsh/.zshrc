# Prompt
eval "$(starship init zsh)"

# Editor
alias vim="nvim"

# Listing (eza)
alias l="eza --group-directories-first --icons=auto"
alias ll="eza -la --git --group-directories-first --icons=auto"
alias lt="eza --tree --level=2 --group-directories-first --icons=auto"
alias lm="eza -la --sort=modified --git --icons=auto"

# Disk usage (dua); `command du` reaches the system du
alias du="dua"
alias dui="dua i"
alias dut="darya"   # treemap
alias dux="gdu-go"  # cleanup; D moves to Trash

# Local coding agents on oMLX: `oml <tool> [model] [-- tool flags]`
# Preferred model per tool; any model in ~/.omlx/models can be named instead
typeset -A OML_MODELS=(
  claude   Qwen3.8-Flash-Next-oQ6e-mtp
  codex    Qwen3.8-Flash-Next-oQ6e-mtp
)
oml() {
  local tool=$1; shift
  local model=${OML_MODELS[$tool]}
  if [[ -n $1 && $1 != -* ]]; then model=$1; shift; fi
  [[ $1 == -- ]] && shift
  local -a pick=(); [[ -n $model ]] && pick=(--model "$model")
  omlx launch "$tool" "${pick[@]}" -- "$@"
}
alias olc="oml claude"
alias olx="oml codex"
alias olm="ls ~/.omlx/models"  # models on disk

# mcps (brew): also list MCP servers in repos no agent has opened yet
export MCPS_SCAN="$HOME/Workspace"

# Runtime versions (mise)
eval "$(mise activate zsh)"
