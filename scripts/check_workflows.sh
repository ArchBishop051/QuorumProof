#!/usr/bin/env bash
set -euo pipefail

workflow_files=(.github/workflows/*.yml)

for workflow in "${workflow_files[@]}"; do
  if ! grep -q '^permissions:' "$workflow"; then
    echo "::error file=${workflow}::Missing top-level permissions block"
    exit 1
  fi
done

echo "All workflows declare top-level permissions."
