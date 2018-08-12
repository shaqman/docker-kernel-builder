FROM rastasheep/ubuntu-sshd:18.04

# Install dependencies
RUN apt-get update               \
 && apt-get -y -q upgrade        \
 && apt-get -y -q install        \
    bc                           \
    binutils-arm-linux-gnueabihf \
    build-essential              \
    ccache                       \
    gcc-arm-linux-gnueabihf      \
    gccgo-8-arm-linux-gnueabi  \
    gcc-aarch64-linux-gnu        \
    git                          \
    libncurses-dev               \
    libssl-dev                   \
    u-boot-tools                 \
    wget                         \
    xz-utils                     \
 && apt-get clean


# Install DTC
RUN wget http://ftp.fr.debian.org/debian/pool/main/d/device-tree-compiler/device-tree-compiler_1.4.0+dfsg-1_amd64.deb -O /tmp/dtc.deb \
 && dpkg -i /tmp/dtc.deb \
 && rm -f /tmp/dtc.deb

# Fetch the kernel
ENV KVER=stable              \
    CCACHE_DIR=/ccache       \
    SRC_DIR=/usr/src         \
    DIST_DIR=/dist           \
    WORK_DIR=/usr/src
WORKDIR ${WORK_DIR}
