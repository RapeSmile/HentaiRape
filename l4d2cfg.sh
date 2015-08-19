#!/bin/sh

echo "Start this script via screen command, example:"
echo "screen -mdSU cfg sh ./l4d2cfg.sh \"install dir\""
echo " "
sleep 3

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi

# Var
delay=60
install=$1

host=
motd=

banid=http://anime4000.github.io/HentaiRape/left4dead2/cfg/banned_user.cfg
admin=http://anime4000.github.io/HentaiRape/left4dead2/addons/sourcemod/configs/admins.cfg

# Run infinite update
echo "Update every 1 minute"

while true; do wget -q $host -O "$install/left4dead2/host.txt"; echo "UPDATED: Banner"; sleep $delay; done &
while true; do wget -q $motd -O "$install/left4dead2/motd.txt"; echo "UPDATED: MOTD"; sleep $delay; done &

while true; do wget -q $banid -O "$install/left4dead2/cfg/banned_user.cfg"; echo "UPDATED: Ban list"; sleep $delay; done &
while true; do wget -q $admin -O "$install/left4dead2/addons/sourcemod/configs/admins.cfg"; echo "UPDATED: Admin list"; sleep $delay; done &

# Linux equivalent to DOS pause
read -n 1 -r -p "Press any key to exit..." key