#!/bin/bash

CLIP=$(xclip -selection clipboard -o)
PATTERN='^https://www\.umimeinformatiku\.cz/[^/]+/([0-9]+)$'

if [[ "$CLIP" =~ $PATTERN ]]; then
  ID="${BASH_REMATCH[1]}"
  HTML="<a href=\"$CLIP\">$ID</a>"
  printf "%s" "[$ID]($CLIP)" | xclip -selection clipboard -t text/plain
  #printf "%s" "$HTML" | xclip -selection clipboard -t text/html
  #kdialog --passivepopup "Clipboard transformed to Umime link" 2

  # Wait briefly to ensure clipboard content is registered
  #sleep 0.2
fi
