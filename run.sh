#!/usr/bin/env -S bash -euEo pipefail
cd "$(dirname "$0")/project"
for v in 2.5.14 2.5.15 2.6.4; do
  echo "== @biomejs/biome@$v"
  npx --yes "@biomejs/biome@$v" lint 2>&1 || true
done
