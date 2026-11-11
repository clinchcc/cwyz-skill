#!/bin/sh
# Lessons on a CWYZ learning path, in order (free, no account needed).
# Usage: ./path.sh [beginner|intermediate|advanced] [en|zh]    (default: beginner en)
set -eu
path="${1:-beginner}"; lang="${2:-en}"
prefix=""; [ "$lang" = "zh" ] && prefix="/zh"
curl -fsS "https://cwyz.com$prefix/paths/$path" |
grep -o "href=\"$prefix/\(tutorials\|projects\|news\)/[^\"]*\"" |
sed -e 's/^href="//' -e 's/"$//' -e 's#^#https://cwyz.com#' | awk '!seen[$0]++'
