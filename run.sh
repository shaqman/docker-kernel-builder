#/bin/sh

SOURCE=$(pwd)/src
CCACHE=$(pwd)/ccache

mkdir -p $SOURCE
mkdir -p $CCACHE

sudo docker build . -t eto-aicp-builder
sudo docker container stop /kernel-builder
sudo docker container rm /kernel-builder
sudo docker run -d -v $SOURCE:/usr/src -v $CCACHE:/ccache  --name kernel-builder bluespy/aicp-builder
sudo docker exec -it kernel-builder bash
