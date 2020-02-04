FROM ubuntu:latest
ARG version=us
RUN apt update
RUN apt install -y wget build-essential pkg-config git binutils-mips-linux-gnu python3 zlib1g-dev libaudiofile-dev bsdmainutils
RUN git clone https://github.com/n64decomp/sm64.git
RUN wget https://github.com/n64decomp/qemu-irix/releases/download/v2.11-deb/qemu-irix-2.11.0-2169-g32ab296eef_amd64.deb
RUN dpkg -i qemu-irix-2.11.0-2169-g32ab296eef_amd64.deb
WORKDIR ./sm64
COPY "./baserom.${version}.z64" .
RUN make VERSION=${version} -j4 
