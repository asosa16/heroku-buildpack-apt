#!/usr/bin/env bash

# exit on error
set -e

echo "-----> Installing ZBar"

# Download and install zbar
curl -L -o /tmp/zbar.tar.gz https://github.com/ZBar/ZBar/archive/refs/tags/0.23.90.tar.gz
tar -xzf /tmp/zbar.tar.gz -C /tmp/
cd /tmp/ZBar-0.23.90/
autoreconf -i
./configure --prefix=/app/.apt/usr --disable-video --without-python --without-gtk --without-qt
make
make install

# Set environment variables
echo "-----> Setting environment variables"
echo "LD_LIBRARY_PATH=/app/.apt/usr/lib:\$LD_LIBRARY_PATH" >> /app/.profile.d/zbar.sh
echo "CPPFLAGS=-I/app/.apt/usr/include:\$CPPFLAGS" >> /app/.profile.d/zbar.sh
echo "LDFLAGS=-L/app/.apt/usr/lib:\$LDFLAGS" >> /app/.profile.d/zbar.sh
echo "PKG_CONFIG_PATH=/app/.apt/usr/lib/pkgconfig:\$PKG_CONFIG_PATH" >> /app/.profile.d/zbar.sh

