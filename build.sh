#!/bin/sh

set -e

VERSION=$1
if [ -z "$VERSION" ]; then
    VERSION=`uname -r`
fi

cd "$(dirname "$(readlink -f "$0")")"

# just to be sure the path is good
export QUILT_PATCHES=patches

if quilt unapplied >/dev/null; then
	quilt push -a
fi

exec make -C "/lib/modules/$VERSION/build" M="$(pwd)"
