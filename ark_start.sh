#! /bin/bash

# if not empty install the game server
if [ ! "$(ls -A ${SERVERPATH})" ]
then
  echo -e "Installing Ark server ... \n"
  /steamcmd/steamcmd.sh +login anonymous +force_install_dir ${SERVERPATH} +app_update 376030 +quit

  #copy the GameUserSettings.ini file
  echo -e "Copying GameUserSettings.ini file ... \n"
  mkdir -p ${SERVERPATH}/ShooterGame/Saved/Config/LinuxServer/
  mv GameUserSettings.ini ${SERVERPATH}/ShooterGame/Saved/Config/LinuxServer/
fi


if [ "$UPDATE_SERVER" = "true" ]
then
  echo -e "Backups save files before updating ..."
  SAVEDIR=${SERVERPATH}/ShooterGame/Saved/SavedArks
  BACKUPDIR=${SERVERPATH}/ShooterGame/Saved/BackupArks

  #Create backup folder if it doesnt exist
  mkdir -p ${SAVEDIR}
  #Remove old backup
  rm ${SAVEDIR}/*
  #Copy all profile files
  cp `ls ${DIR}/*.arkprofile ` ${SAVEDIR}
  #Copy all tribe files
  cp `ls ${DIR}/*.arktribe` ${SAVEDIR}
  #Copy last game state
  cp `ls -1 ${DIR}/*.ark | tail -3` ${SAVEDIR}

  echo -e "Updating Ark server ...."
  /steamcmd/steamcmd.sh +login anonymous +force_install_dir ${SERVERPATH} +app_update 376030 +quit
fi



#Lauch the game server
echo -e "Lauching Ark Server ...."
${SERVERPATH}/ShooterGame/Binaries/Linux/ShooterGameServer TheIsland?listen?SessionName=${ARK_SERVER_NAME:=[FR]Brookie-Ark}?ServerPassword=${ARK_SERVER_PASSWORD:=ark}?ServerAdminPassword=${ARK_SERVER_ADMIN_PASSWORD:=admin}?Port=${ARK_SERVER_PORT:=7777}?QueryPort=${ARK_SERVER_QUERYPORT:=27015}?allowThirdPersonPlayer=${ARK_BOOLEAN:=true}?alwaysNotifyPlayerLeft=${ARK_BOOLEAN:=true}?alwaysNotifyPlayerJoined=${ARK_BOOLEAN:=true}?serverPVE=${ARK_BOOLEAN:=true}?MaxPlayers=${ARK_MAX_PLAYER:=10} -nosteamclient -game -server -log
