#/usr/bin/env bash

set -o xtrace

MANIFEST=$(mktemp)

set -o errexit
which exiv2
which convert
set +o errexit

ls --color=none *.{JPG,jpg} 2>/dev/null | xargs -I{} convert {} -auto-orient {}
exiv2 -T rename *.{JPG,jpg}
ls --color=none *.{JPG,jpg} 2>/dev/null | xargs -I{} date -r {} +{}\ %Y/%m-%d/ > $MANIFEST
awk '{print $2}' < $MANIFEST | xargs mkdir -p
xargs -d '\n' -I{} echo mv {} < $MANIFEST | bash
