#!/bin/sh
# Sürüm damgası basıp yayınlar; açık telefonlar yeni sürümü kendiliğinden yükler.
set -e
cd "$(dirname "$0")"
S=$(date +%Y%m%d%H%M%S)
sed -i '' -E "s/const SURUM = \"[^\"]*\";/const SURUM = \"$S\";/" index.html
printf "%s\n" "$S" > surum.txt
git add -A
git commit -qm "${1:-Güncelleme} ($S)

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>"
git push -q
echo "yayında: $S"
