# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/jwlabs/.docker/bin"
# End of Docker Desktop section.

eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# User-installed binaries
export PATH="$HOME/.local/bin:$PATH"

# Rust toolchains (rustup)
. "$HOME/.cargo/env"

# mise shims for non-interactive shells; .zshrc activates mise fully
eval "$(mise activate zsh --shims)"

# Hugging Face downloads: fetch Xet chunks with full parallelism
export HF_XET_HIGH_PERFORMANCE=1
