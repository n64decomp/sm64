FROM devkitpro/devkitarm:latest as build

RUN apt update
RUN apt -y install build-essential bsdmainutils
RUN mkdir /sm64
WORKDIR /sm64

CMD echo 'usage: docker run --rm --mount type=bind,source="$(pwd)",destination=/sm64 sm64dsi make VERSION=us COMPILER=gcc -j4\n' \
         'see https://github.com/Hydr8gon/sm64/blob/nds/README.md for advanced usage'
