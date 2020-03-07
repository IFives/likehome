!/bin/bash

exec 1 && exec 2 > /var/log/likehome.log

echo "Welcome to your new Debian/Ubuntu based OS !"

apt update
apt -y upgrade

#Future Integration for HiDPI
#echo "Are you on a High Density of Pixel Display (More than 1080p) ? yes or no"
#read answerSpotify

#Future Integration to choose between Gnome and KDE
#echo "Do you use GNOME ? yes or no"
#read answerGnome
#echo "${answerGnome}"

echo "What's your home folder's name ? (Ex: /home/username)"
read usrName

#Install and configure VIM
apt -y install vim
cp .vimrc /home/${usrName}/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Install and configure Spotify if you have a HiDPi
curl -sS https://download.spotify.com/debian/pubkey.gpg | apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
apt -y install spotify-client
#if [ ${answerSpotify} = "yes" ] 
#then
        sudo cp spotify.desktop /usr/share/applications/
#fi

sudo apt -y install chromium

#Install Gnome themes and extensions
apt -y install gnome-tweak-tool
apt -y install gnome-shell-extensions
apt -y install chrome-gnome-shell

#Install the papirus icons pack
add-apt-repository ppa:papirus/papirus
apt -y install papirus-icon-theme

#Install the mail client thunderbird
apt -y install thunderbird

#Install snapcraft package manager
apt -y install snapd

#Wait 1 second, there can be some errors if you install snap packages directly after installing another package
sleep 1000

snap install discord

#Check if there some old packages that needs to be revomed
apt -y autoremove

#Checking if there are errors
echo "Oh Oh... There are some errors :"
cat /var/log/likehome.log | grep err

echo "The personalisation is finished, go see the result by yourself !"
