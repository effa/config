#!/bin/bash

# Get the current clipboard content
CLIP=$(xclip -selection clipboard -o)

# Match and extract ID
if [[ "$CLIP" =~ ^https://www\.umimeinformatiku\.cz/[^/]+/([0-9]+)$ ]]; then
  ID="${BASH_REMATCH[1]}"
  HTML="<a href=\"$CLIP\">$ID</a>"

  # Set markdown link in clipboard
  printf "%s" "[$ID]($CLIP)" | xclip -selection clipboard -t text/plain
  #printf "%s" "$ID" | xclip -selection clipboard -t text/plain
  #printf "%s" "$HTML" | xclip -selection clipboard -t text/html

  # Wait briefly to ensure clipboard content is registered
  sleep 0.2
fi

# Simulate Ctrl+V
xdotool key --clearmodifiers ctrl+v
