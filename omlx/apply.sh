#!/bin/bash

# Merge these oMLX overrides into ~/.omlx/settings.json and restart the server.
# Not a symlink: oMLX rewrites that file and keeps its generated secret_key there.
#   port 8800: Unreal's MCP server already uses oMLX's default 8000
#   228 GB ceiling: stays under the GPU wired limit set by macos/setup.sh (~234 GB)
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
LIVE="$HOME/.omlx/settings.json"

mkdir -p "$(dirname "$LIVE")"
[ -f "$LIVE" ] || echo '{}' > "$LIVE"
jq -s '.[0] * .[1]' "$LIVE" "$DIR/settings.json" > "$LIVE.tmp"
mv "$LIVE.tmp" "$LIVE"

omlx restart
