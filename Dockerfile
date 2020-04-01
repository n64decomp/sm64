FROM ubuntu:latest

RUN apt update
RUN apt install -y wget build-essential pkg-config git binutils-mips-linux-gnu python3 zlib1g-dev libaudiofile-dev bsdmainutils

RUN wget https://github.com/n64decomp/qemu-irix/releases/download/v2.11-deb/qemu-irix-2.11.0-2169-g32ab296eef_amd64.deb
RUN dpkg -i qemu-irix-2.11.0-2169-g32ab296eef_amd64.deb

RUN mkdir /sm64
WORKDIR /sm64
ENV PATH="/sm64/tools:${PATH}"

CMD echo 'usage: docker run --rm --mount type=bind,source="$(pwd)",destination=/sm64 sm64 make VERSION=<version> -j4'
