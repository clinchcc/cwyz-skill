#!/bin/sh
# Ask the CWYZ Q&A assistant (free accounts: 1 question a day; members: 30).
# Create a key at https://cwyz.com/settings/apikeys first.
# Usage: CWYZ_API_KEY=... ./ask.sh "What is MCP?"
set -eu
[ $# -ge 1 ] || { echo "usage: $0 \"<question>\"" >&2; exit 64; }
key="${CWYZ_API_KEY:-$(python3 -c 'import json,os; print(json.load(open(os.path.expanduser("~/.cwyz/config.json")))["apiKey"])')}"
python3 -c 'import json,sys; print(json.dumps({"question": " ".join(sys.argv[1:])}))' "$@" |
curl -fsS -X POST https://cwyz.com/api/v1/ask \
  -H "Authorization: Bearer $key" -H "Content-Type: application/json" --data-binary @- |
python3 -c '
import sys, json
d = json.load(sys.stdin)["data"]
print(d["answer"]); print()
for i, s in enumerate(d.get("sources") or [], 1):
    print("[%d] %s  https://cwyz.com%s" % (i, s["title"], s["href"]))
print("\nquestions left today:", d.get("remaining"))'
