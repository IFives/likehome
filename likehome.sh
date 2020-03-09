#!/bin/bash
#######################################################################
#Author : IFives
#Date of creation : 01/03/2020
#Last modification date : 09/03/2020
#######################################################################

#Put everything done by the script (tee command) and at the same time put it in the terminal, so it can be read by the user
exec 2>&1 | tee /var/log/likehome.log

#Variables to color the text
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'

#No color
NC='\033[0m'

dateHour=$(date +%d-%m-%Y %H:%M)

#Put date and hour at the beginning of the log file
echo ${dateHour}

echo "${GREEN}Welcome to your new Debian/Ubuntu based OS !${NC}"

echo -e "${CYAN}Adding repo to install papirus icons pack ${NC}"
add-apt-repository ppa:papirus/papirus

echo -e "${CYAN}Adding repo to install spotify${NC}"
curl -sS https://download.spotify.com/debian/pubkey.gpg | apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list

echo -e "${CYAN}Updating the list of repos and upgrading packages of the computer ${NC}"
apt update
apt -y upgrade

#Future Integration for HiDPI
#echo "Are you on a High Density of Pixel Display (More than 1080p) ? yes or no"
#read answerSpotify

#Future Integration to choose between Gnome and KDE
#echo "Do you use GNOME ? yes or no"
#read answerGnome
#echo "${answerGnome}"

echo "${GREEN} What's your home folder's name ? (Ex: /home/username; Username in lower case) ${NC}"
read usrName

echo -e "${CYAN} Installing Graphical for Uncomplicated Firewall ${NC}"
apt -y install gufw

echo -e "${CYAN} Installing and configuring VIM, to install plugins refer to junegunn/vim-plug in Github ${NC}"
apt -y install vim
cp .vimrc /home/${usrName}/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -e "${CYAN} Installing and configuring Spotify if you have a HiDPi ${NC}"
apt -y install spotify-client
#if [ ${answerSpotify} = "yes" ] 
#then
#        sudo cp spotify.desktop /usr/share/applications/
#fi

sudo apt -y install chromium

echo -e "${CYAN} Installing Gnome themes and extensions ${NC}"
apt -y install gnome-tweak-tool
apt -y install gnome-shell-extensions
apt -y install chrome-gnome-shell

echo -e "${CYAN} Installing the papirus icons pack ${NC}"
apt -y install papirus-icon-theme

echo -e "${CYAN} Installing the mail client thunderbird ${CN}"
apt -y install thunderbird

echo -e "${CYAN} Installing snapcraft package manager ${CN}"
apt -y install snapd

#Wait 1 second, there can be some errors if you install snap packages directly after installing another package
sleep 1

echo -e "${CYAN} Installing Discord via snapcraft ${CN}"
snap install discord

echo -e "${CYAN} Installing molotov TV ${CN}"
wget 'https://www.molotov.tv/download' -O molotov.Appimage
chmod +x molotov.Appimage

echo -e "${CYAN} Check if there some old packages that needs to be revomed ${CN}"
apt -y autoremove

echo -e "${CYAN} Checking if there are errors ${CN}"
testerr=cat /var/log/likehome.log | grep err
if [ ! -z ${testerr}  ]
then
	echo "Oh Oh... There are some errors :"
	echo ${testerr}
else
	echo "No errors, everything's fine !"
fi

#End of script
echo "The personalisation is finished, go see the result by yourself !"
