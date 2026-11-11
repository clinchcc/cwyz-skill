#!/bin/sh
# Refresh the skill files from cwyz.com (the site is the source of truth).
set -eu
cd "$(dirname "$0")/.."
for s in cwyz-learn cwyz-ask; do
  curl -fsS "https://cwyz.com/api/skills/$s-en/raw" -o "skills/$s/SKILL.md"
  curl -fsS "https://cwyz.com/api/skills/$s/raw" -o "skills/$s/SKILL.zh-CN.md"
  echo "$s updated: $(wc -c < "skills/$s/SKILL.md") / $(wc -c < "skills/$s/SKILL.zh-CN.md") bytes"
done
