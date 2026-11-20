eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# User-installed binaries
export PATH="$HOME/.local/bin:$PATH"

# Rust toolchains (rustup)
. "$HOME/.cargo/env"

# mise shims for non-interactive shells; .zshrc activates mise fully
eval "$(mise activate zsh --shims)"
