#!/usr/bin/env bash
set -e
URL="https://emersonspartz.github.io/mono-green-eldrazi-sb-guide/"
html=$(curl -sf "$URL")
for needle in "sicsmoo" "Togores" "aspiringspike" "Claude" "Green Sun" "Trudge Match" "GSZ finds"; do
  grep -q "$needle" <<< "$html" || { echo "FAIL: missing '$needle'"; exit 1; }
done
mus=$(grep -c '<div class="mu\(\s\+open\)\?">' <<< "$html")
[ "$mus" = "17" ] || { echo "FAIL: expected 17 matchups, got $mus"; exit 1; }
echo "PASS: 17 matchups, all key strings present"
