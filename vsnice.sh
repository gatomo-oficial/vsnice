#! /usr/bin/bash
PID=$(pidof code)

param=$1

if [ -z "$param" ] || [ "$param" == "-" ]; then
	echo -e "\033[34m\033[1m<<< vsnice >>>\033[0m\t\033[2mMade by Gátomo - GPL3 License\033[0m"
	echo -e "\033[32mChange the vscode priority if works slow \033[0m"
	echo -e "\033[1mUsage: \033[0m\033[3m$0 <priority>\033[0m"
	echo -e "\033[1mExample: \033[0m\033[3m$0 -10\033[0m"
	echo -e "\033[1mLicense notice: \033[0m\033[3m$0 -l\033[0m"
	echo -e "\n\033[1mRepo: \033[0m\033[3mhttps://github.com/gatomo-oficial/vsnice\033[0m"
	exit 0
fi


# license notice
if [ "$param" == "-l" ]; then
	echo -e "\033[34m\033[1m<<< vsnice >>>\033[0m\t\033[2mMade by Gátomo - GPL3 License\033[0m"
	echo "vsnice  Copyright (C) 2022  Gátomo"
    echo "This program comes with ABSOLUTELY NO WARRANTY; for details type \`$0 -w\`."
    echo "This is free software, and you are welcome to redistribute it"
    echo "under certain conditions; type \`$0 -c\` for details."
	exit 0
fi

# license notice
if [ "$param" == "-w" ]; then
	echo -e "\033[34m\033[1m<<< vsnice >>>\033[0m\t\033[2mMade by Gátomo - GPL3 License\033[0m"
	echo "This program come with absolutely no warranty, so you are the responsible for the use of this program."
	echo -e "More info about the license: \033[3mhttps://www.gnu.org/licenses/gpl-3.0.en.html\033[0m"
	exit 0
fi

# license notice
if [ "$param" == "-c" ]; then
	echo -e "\033[34m\033[1m<<< vsnice >>>\033[0m\t\033[2mMade by Gátomo - GPL3 License\033[0m"
	echo -e "More info about the license: \033[3mhttps://www.gnu.org/licenses/gpl-3.0.en.html\033[0m"
	exit 0
fi


# check if priority is between -20 and 19
if [ $param -lt -20 ] || [ $param -gt 19 ]; then
	echo -e "\033[31m\033[1m Error > \033[0m Please enter a valid priority between \033[1m-20\033[0m \033[2mmore priority\033[0m and \033[1m19\033[0m \033[2mless priority\033[0m"
	exit 1
fi
# sudo password required
if [ $UID -ne 0 ]; then
	echo -e "\033[31m\033[1m Error > \033[0m Please run this script as root"
	exit 1
fi

sudo renice -20 -p $PID

echo -e "\033[34m\033[1m<<< vsnice >>>\033[0m Done."
