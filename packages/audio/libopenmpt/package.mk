# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libopenmpt"
PKG_VERSION="0.7.0"
PKG_SHA256="411796b55aef73cab09c7a6e65d33f1d7bf4ee7fc2dade6bc8de5138dedcc6d1"
PKG_LICENSE="BSD"
PKG_SITE="http://lib.openmpt.org/libopenmpt/"
PKG_URL="http://lib.openmpt.org/files/libopenmpt/src/${PKG_NAME}-${PKG_VERSION}+release.autotools.tar.gz"
PKG_DEPENDS_TARGET="toolchain libogg libvorbis zlib"
PKG_LONGDESC="libopenmpt renders mod music files as raw audio data, for playing or conversion."
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --disable-shared \
                           --without-mpg123 \
                           --with-vorbis \
                           --with-vorbisfile \
                           --without-pulseaudio \
                           --without-portaudio \
                           --without-portaudiocpp \
                           --without-sdl \
                           --without-sdl2 \
                           --without-sndfile \
                           --without-flac"
