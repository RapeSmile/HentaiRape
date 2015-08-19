#!/bin/sh

# Variable and command-line
install="`pwd`/Steam/steamapps/common/Left 4 Dead 2 Dedicated Server"
global="-nobreakpad +precache_all_survivors 1 +maxplayers 12 +sv_pure 1 +sv_lan 0 +allow_all_bot_survivor_team 1 +sv_allow_lobby_connect_only 1 +map \"c1m1_hotel versus\""
# Append more to add more server
server1="-console -debug -game left4dead2 -port 12000 +hostname \"Hentai Rape! Chino-chan\""

id="l4d2"
lvl="-20"

# Notice
echo -e "\033[37m"
echo -e "\033[32mStarting server in 5 second... Please Wait..."
echo -e "\033[37m"
echo -e "\033[37mto list all sessions, type: \033[33mscreen -ls"
echo -e "\033[37mto exit screen, press: \033[33mCTRL+A+D"
echo -e "\033[37mto view it, type: \033[33mscreen -r $id"
echo -e "\033[37m"
echo -e "\033[37mRunning nice level (require sudo): \033[33m$lvl"
echo -e "\033[37m"
sleep 5

# Global config
screen -mdSU cfg sh ./l4d2cfg.sh "$install"

# Enter server folder
cd "$install"

# Start server
screen -mdSU $id nice -n $lvl ./srcds_run $global $server1

# Back last path
cd "`pwd`"

# Hold
sleep 1

# Enter Screen
screen -rd $id