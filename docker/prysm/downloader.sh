#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

set -x

EXECUTABLE=${1}
echo "VERSION, ${VERSION}"
echo "TARGETPLATFORM, ${TARGETPLATFORM}"


wget -q https://github.com/prysmaticlabs/prysm/releases/download/${VERSION}/${EXECUTABLE}-${VERSION}-${TARGETPLATFORM/\//\-}
wget -q https://github.com/prysmaticlabs/prysm/releases/download/${VERSION}/${EXECUTABLE}-${VERSION}-${TARGETPLATFORM/\//\-}.sha256
ls -la .
sha256sum -c ${EXECUTABLE}-${VERSION}-${TARGETPLATFORM/\//\-}.sha256

mkdir -p /app/cmd/${EXECUTABLE}/
mv ${EXECUTABLE}-${VERSION}-${TARGETPLATFORM/\//\-} /app/cmd/${EXECUTABLE}/${EXECUTABLE}

chmod +x /app/cmd/${EXECUTABLE}/${EXECUTABLE}