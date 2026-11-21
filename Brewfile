# Packages for this machine. Install or update everything with:
#   brew bundle --file ~/Workspace/dotfiles/Brewfile
# Regenerate after installing something new:
#   brew bundle dump --file ~/Workspace/dotfiles/Brewfile --force --cargo --uv --npm
# then drop the `go` lines it adds for mise's own Go binaries.

tap "felixkratz/formulae", "https://github.com/FelixKratz/homebrew-formulae"
tap "jundot/omlx", "https://github.com/jundot/omlx"
tap "js0n/tap"
tap "nikitabobko/tap"

# Shell and editor
brew "eza"
brew "neovim"
brew "ripgrep"
brew "starship"
brew "tmux"

# Languages and tooling (versions themselves live in mise/config.toml)
brew "gh"
brew "gitleaks"
brew "mise"
brew "uv"

# Agent tooling
brew "js0n/tap/mcps"

# Disk and system monitoring
brew "dua-cli"
brew "gdu"
brew "macmon"

# Desktop: bar, borders, tiling
brew "felixkratz/formulae/borders", trusted: true
brew "felixkratz/formulae/sketchybar", trusted: true
cask "nikitabobko/tap/aerospace", trusted: true

# Local AI
brew "jundot/omlx/omlx"

# Apps
cask "1password"
cask "1password-cli"
cask "claude-code"
cask "codex"
cask "docker-desktop"
cask "epic-games"
cask "ghostty"
cask "scrivener"
cask "thebrowsercompany-dia"

# Fonts
cask "font-hack-nerd-font"
cask "font-jetbrains-mono-nerd-font"

# Rust crates; cargo comes from rustup (https://rustup.rs), install it first
cargo "darya"

# uv tools
uv "huggingface-hub"

# Global npm packages, installed with mise's Node
npm "chrome-devtools-axi"
npm "gh-axi"
npm "lavish-axi"
npm "quota-axi"
npm "tasks-axi"
