#!/usr/bin/env bash

set -eu -o pipefail

eval `ssh-agent`

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo $SCRIPT_DIR

source "$SCRIPT_DIR/env.defaults"
source "$SCRIPT_DIR/env"

REMOTE_HOST="$SSH_USERNAME@$SSH_HOSTNAME"

printf "\nEnvironment variables:\n"
echo "REMOTE_HOST: $REMOTE_HOST"
echo "LOCAL_APPDATA_FOLDER: $LOCAL_APPDATA_FOLDER"
echo "REMOTE_APPDATA_FOLDER: $REMOTE_APPDATA_FOLDER"
echo "LOCAL_STEAMAPP_FOLDER: $LOCAL_STEAMAPP_FOLDER"
echo "REMOTE_STEAMAPP_FOLDER: $REMOTE_STEAMAPP_FOLDER"
echo "REMOTE_SAVEDATA_FOLDER: $REMOTE_SAVEDATA_FOLDER"

printf "\nLoading SSH key\n"
ssh-add $SSH_KEY_LOCATION

set -x
printf "\nSyncing AppData to remote\n"
rsync -Pr -avh --delete "$LOCAL_APPDATA_FOLDER" "$REMOTE_HOST:$REMOTE_APPDATA_FOLDER"

printf "\nSyncing game data to remote\n"
rsync -Pr -avh --delete \
  --exclude "d3dx9_42.log" \
  "$LOCAL_STEAMAPP_FOLDER" "$REMOTE_HOST:$REMOTE_STEAMAPP_FOLDER"

printf "\nSyncing game saves from remote to local\n"
rsync -Pr -avh --delete "$REMOTE_HOST:$REMOTE_SAVEDATA_FOLDER" "$SCRIPT_DIR/saves"