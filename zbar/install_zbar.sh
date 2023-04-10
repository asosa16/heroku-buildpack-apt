#!/bin/sh

set -e

ZBAR_URL="http://downloads.sourceforge.net/project/zbar/zbar/0.10/zbar-0.10.tar.gz"

echo "-----> Downloading and building ZBar from source"
curl -s -o - "$ZBAR_URL" | tar xzf -
cd zbar-0.10

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/app/.apt/usr/lib"
export CPPFLAGS="$CPPFLAGS -I/app/.apt/usr/include"
export LDFLAGS="$LDFLAGS -L/app/.apt/usr/lib"

./configure --prefix=/app/.apt/usr --disable-video --without-gtk --without-qt --without-python --without-imagemagick
make install
cd ..
