#!/bin/sh
MT_MYGAME_MODS_PATH=/usr/share/games/minetest/games/ENLIVEN/mods
try_path=/usr/local/share/minetest/games/ENLIVEN/mods
if [ -d "$try_path" ]; then
  MT_MYGAME_MODS_PATH="$try_path"
fi
if [ ! -d "$MT_MYGAME_MODS_PATH" ]; then
  echo "The subgame $MT_MYGAME_MODS_PATH was not found,"
  echo "so you'll have to install this mod yourself."
  sleep 4
  exit 1
else
  echo "Using '$MT_MYGAME_MODS_PATH'..."
fi
#MTMOD_DEST_NAME=kc_modpack
MTMOD_DEST_NAME=${PWD##*/}
MTMOD_DEST_PATH=$MT_MYGAME_MODS_PATH/$MTMOD_DEST_NAME
if [ ! -d "$MTMOD_DEST_PATH" ]; then
  sudo mkdir "$MTMOD_DEST_PATH"
fi
if [ ! -f "modpack.txt" ]; then
  echo "ERROR: must be run from a modpack but is in `pwd`."
  echo "quitting this terminal session in 4s..."
  sleep 4
  exit 2
fi
sudo cp -R ./* "$MTMOD_DEST_PATH/"
