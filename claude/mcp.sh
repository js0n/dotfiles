#!/bin/bash

# Claude Code MCP servers. Safe to rerun.
#   user_server:    every project (stored in ~/.claude.json)
#   project_server: one repository only, never its worktrees (via mcp-guard)
# Servers that carry tokens (the GitHub server) are added by hand, not here.
set -euo pipefail

GUARD="$(cd "$(dirname "$0")" && pwd)/mcp-guard"

user_server() {
  local name=$1; shift
  claude mcp remove --scope user "$name" >/dev/null 2>&1 || true
  claude mcp add --scope user "$name" -- "$@"
}

project_server() {
  local dir=$1 name=$2; shift 2
  (
    cd "$dir"
    claude mcp remove --scope local "$name" >/dev/null 2>&1 || true
    claude mcp add --scope local "$name" -- "$GUARD" "$dir" "$@"
  )
}

# riker (Firstmate home): 1Password Environments, from the desktop app
project_server "$HOME/Workspace/riker" 1password /Applications/1Password.app/Contents/MacOS/1password-mcp
