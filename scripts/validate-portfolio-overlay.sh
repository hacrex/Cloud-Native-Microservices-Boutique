#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OVERLAY="$ROOT/portfolio/overlays/dev"

command -v kubectl >/dev/null 2>&1 || {
  echo "kubectl is required to render the Kustomize overlay." >&2
  exit 127
}

RENDERED="$(mktemp)"
trap 'rm -f "$RENDERED"' EXIT

kubectl kustomize "$OVERLAY" > "$RENDERED"
test -s "$RENDERED"

grep -q 'kind: HorizontalPodAutoscaler' "$RENDERED"
grep -q 'kind: ResourceQuota' "$RENDERED"
grep -q 'namespace: boutique-portfolio' "$RENDERED"

printf 'Portfolio overlay rendered successfully: %s resources.\n' "$(grep -c '^kind:' "$RENDERED")"
