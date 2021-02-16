@echo off
where docker 1>nul 2>nul || (
  echo Docker is not installed.
  echo Please go to https://www.docker.com/get-started and install it first.
  pause
  exit
)

if not exist baserom.??.z64 (
  echo A Super Mario 64 ROM is required to extract the assets and build the game.
  echo Please place one in the same directory as this script, it should be named:
  echo  - baserom.us.z64 for the USA version - recommended
  echo  - baserom.eu.z64 for the European version
  echo  - baserom.jp.z64 for the Japanese version
  echo  - baserom.sh.z64 for the Japanese rumble pak edition
  pause
  exit
)

docker build -t sm64dsi .
docker run --rm --mount type=bind,source="%cd%",destination=/sm64 sm64dsi make VERSION=us COMPILER=gcc -j4
pause