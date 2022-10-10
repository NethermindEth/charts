#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

set -x

VERSION=${1}

docker buildx build --progress=plain --platform=linux/amd64,linux/arm64 --build-arg VERSION="${VERSION}" -t nethermindeth/prysm-beacon-chain:"${VERSION}" --push -f Dockerfile.beacon --push .
