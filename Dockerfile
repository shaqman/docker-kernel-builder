FROM rastasheep/ubuntu-sshd:18.04

# Install dependencies
RUN export DEBIAN_FRONTEND=noninteractive \
 && dpkg --add-architecture i386 \
 && apt update                   \
 && apt -y -q upgrade            \
 && apt -y -q install            \
    bc                           \
    binutils-arm-linux-gnueabihf \
    bison                        \ 
    build-essential              \
    bzip2                        \ 
    ccache                       \ 
    curl                         \
    flex                         \
    gcc-multilib                 \
    git                          \
    g++-multilib                 \ 
    gnupg                        \
    gperf                        \
    imagemagick                  \
    lib32ncurses5-dev            \
    lib32z1                      \
    lib32z1-dev                  \
    lib32z-dev                   \
    libbz2-1.0                   \
    libbz2-1.0:i386              \
    libbz2-dev                   \
    libbz2-dev:i386              \
    libc6-dev                    \
    libc6-dev-i386               \
    libghc-bzlib-dev             \
    libgl1-mesa-dev              \
    libncurses5-dev              \
    libncurses-dev               \
    libsdl1.2-dev                \
    libssl-dev                   \
    libx11-dev                   \
    libx11-dev:i386              \
    libxml2-utils                \
    lzop                         \
    mingw-w64                    \
    openjdk-8-jdk                \
    pngcrush schedtool           \
    python                       \
    python-markdown              \
    readline-common              \
    software-properties-common   \
    squashfs-tools               \
    tmux                         \
    tofrodos                     \
    u-boot-tools                 \
    unzip                        \
    x11proto-core-dev            \
    xsltproc                     \
    xz-utils                     \
    zip                          \
    zlib1g-dev                   \
# Install additional packages which are useful for building Android
    android-tools-adb \
    android-tools-fastboot \
    bash-completion \
    bsdmainutils \
    file \
    nano \
    rsync \
    screen \
    tig \
    vim \
	wget

RUN mkdir -p /usr/local/bin \
    && curl -o /usr/local/bin/repo https://commondatastorage.googleapis.com/git-repo-downloads/repo \
	&& chmod 755 /usr/local/bin/repo

ENV CCACHE_DIR=/ccache       \
	CCACHE_SIZE=50G 		 \
	USE_CCACHE=1 			 \
    CCACHE_COMPRESS=1 		 \
    WORK_DIR=/usr/src        \
    USER=${whoami}			 \
    PATH=$PATH:/usr/local/bin/
    
WORKDIR ${WORK_DIR}

VOLUME [${WORK_DIR}, ${CCACHE_DIR}]

EXPOSE 22
