#!/bin/sh
# List CWYZ tutorials by level (free, no account needed).
# Usage: ./tutorials.sh [beginner|intermediate|advanced]    (default: beginner)
set -eu
level="${1:-beginner}"
curl -fsS https://cwyz.com/llms.txt |
awk -v lvl="[$level]" '
  /^## / { on = ($0 == "## Tutorials") ; next }
  on && index($0, lvl) {
    title = $0; sub(/^- \[/, "", title); sub(/\]\(.*/, "", title)
    url = $0; sub(/^[^(]*\(/, "", url); sub(/\).*/, "", url)
    print "- " title; print "  " url
  }'
