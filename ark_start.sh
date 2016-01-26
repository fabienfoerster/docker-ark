#! /bin/bash

# if not empty install the game server
if [ ! "$(ls -A ${SERVERPATH})" ]
then
  echo -e "Installing ARK  in ${SERVERPATH}... \n"
  /steamcmd/steamcmd.sh +login anonymous +force_install_dir ${SERVERPATH} +app_update 376030 +quit
fi

#copy the GameUserSettings.ini file
echo -e "Copying GameUserSettings.ini file ... \n"
mkdir -p ${SERVERPATH}/ShooterGame/Saved/Config/LinuxServer/
mv GameUserSettings.ini ${SERVERPATH}/ShooterGame/Saved/Config/LinuxServer/

#Lauch the game server
echo -e "Lauching Ark Server"
${SERVERPATH}/ShooterGame/Binaries/ShooterGameServer TheIsland -server -log
