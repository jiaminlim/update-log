#!/usr/bin/env bash
# Appends a timestamped entry to the log in index.html and bumps the update counter.
set -euo pipefail

FILE="index.html"
NOW="$(date -u +"%Y-%m-%d %H:%M:%S UTC")"
RUN_INFO="${GITHUB_RUN_NUMBER:+ (run #$GITHUB_RUN_NUMBER)}"

# Insert the newest entry directly after the marker so the list stays newest-first.
awk -v entry="    <li>Updated at ${NOW}${RUN_INFO}</li>" '
  { print }
  /<!-- LOG_ENTRIES -->/ { print entry }
' "$FILE" > "$FILE.tmp" && mv "$FILE.tmp" "$FILE"

COUNT="$(grep -c '<li>Updated at' "$FILE")"
sed -i.bak -E "s|<span id=\"count\">[0-9]+</span>|<span id=\"count\">${COUNT}</span>|" "$FILE"
rm -f "$FILE.bak"

echo "Appended entry #${COUNT}: ${NOW}"
