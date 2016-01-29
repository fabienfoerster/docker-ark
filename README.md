# docker-ark 
This is docker container running an **ARK Survival Evolved** server (http://www.playark.com/).

Tested on Linux (Ubuntu 14.04)  and Synology DSM 5.2-5644
## Features

- Easy install
- Easy to use
- Automatic backup before server update (soon)
- Work well with synology

## Requirements
- docker installed (see https://docs.docker.com/linux/)
- at least 20GB free disk space (18GB are downloaded for the game server)
- 4GB+ RAM

## Usage
- run ``docker pull fabienfoerster/ark-server``
- create a folder to store the server files with enough space (i.e. /server/ark/)
- run ``docker run -d -e ARK_SERVER_NAME=serverName ARK_SERVER_PASSWORD=password ARK_SERVER_ADMIN_PASSWORD=adminPassword ARK_SERVER_PORT=serverPort ARK_SERVER_QUERYPORT=serverQueryport ARK_MAX_PLAYER=10 fabienfoerster/ark-server``

## Issues

- Server settings should be described in a GameUserSettings.ini but Synology DSM do not seem to aknowledge this file.

## Todo
- force it to use GameUserSettings.ini
- I don't know it work pretty well
