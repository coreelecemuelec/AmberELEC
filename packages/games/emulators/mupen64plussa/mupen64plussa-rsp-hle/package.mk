# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="mupen64plussa-rsp-hle"
PKG_VERSION="ca917cec14942470630515e3dd7624cf4dc29154"
PKG_SHA256="2804a867769e3b4e7d2a6381a88bd86b2bd0159ad1c5a2f8a5d9be70d21eb925"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/mupen64plus/mupen64plus-rsp-hle"
PKG_URL="https://github.com/mupen64plus/mupen64plus-rsp-hle/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain ${OPENGLES} libpng SDL2 SDL2_net zlib freetype nasm:host mupen64plussa-core"
PKG_SHORTDESC="mupen64plus-rsp-hle"
PKG_LONGDESC="Mupen64Plus Standalone RSP HLE"
PKG_TOOLCHAIN="manual"

PKG_MAKE_OPTS_TARGET+="USE_GLES=1"

pre_configure_target() {
  sed -i 's/\-O[23]//' ${PKG_BUILD}/projects/unix/Makefile
}

make_target() {
  export HOST_CPU=aarch64
  export APIDIR=$(get_build_dir mupen64plussa-core)/.install_pkg/usr/local/include/mupen64plus
  export USE_GLES=1
  export SDL_CFLAGS="-I$SYSROOT_PREFIX/usr/include/SDL2 -D_REENTRANT"
  export SDL_LDLIBS="-lSDL2_net -lSDL2"
  export CROSS_COMPILE="$TARGET_PREFIX"
  export V=1
  export VC=0
  BINUTILS="$(get_build_dir binutils)/.aarch64-libreelec-linux-gnueabi"
  make -C projects/unix clean
  make -C projects/unix all ${PKG_MAKE_OPTS_TARGET}
}

makeinstall_target() {
  UPREFIX=${INSTALL}/usr/local
  ULIBDIR=${UPREFIX}/lib
  UPLUGINDIR=${ULIBDIR}/mupen64plus
  mkdir -p ${UPLUGINDIR}
  cp ${PKG_BUILD}/projects/unix/mupen64plus-rsp-hle.so ${UPLUGINDIR}
  #$STRIP ${UPLUGINDIR}/mupen64plus-rsp-hle.so
  chmod 0644 ${UPLUGINDIR}/mupen64plus-rsp-hle.so
}

