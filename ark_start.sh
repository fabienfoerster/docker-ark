#! /bin/bash

# if not empty install the game server
if [ ! "$(ls -A ${SERVERPATH})" ]
then
  echo -e "Installing ARK  in ${SERVERPATH}... \n"
  /steamcmd/steamcmd.sh +login anonymous +force_install_dir ${SERVERPATH} +app_update 376030 +quit

  #copy the GameUserSettings.ini file
  echo -e "Copying GameUserSettings.ini file ... \n"
  mkdir -p ${SERVERPATH}/ShooterGame/Saved/Config/LinuxServer/
  mv GameUserSettings.ini ${SERVERPATH}/ShooterGame/Saved/Config/LinuxServer/
fi




#Lauch the game server
echo -e "Lauching Ark Server"
${SERVERPATH}/ShooterGame/Binaries/Linux/ShooterGameServer TheIsland?listen?SessionName=${ARK_SERVER_NAME:=[FR]Brookie-Ark}?ServerPassword=${ARK_SERVER_PASSWORD:=ark}?ServerAdminPassword=${ARK_SERVER_ADMIN_PASSWORD:=admin}?Port=${ARK_SERVER_PORT:=7777}?QueryPort=${ARK_SERVER_QUERYPORT:=27015}?allowThirdPersonPlayer=1?alwaysNotifyPlayerLeft=1?alwaysNotifyPlayerJoined=1?serverPVE=1?MaxPlayers=${ARK_MAX_PLAYER:=10} -nosteamclient -game -server -log
