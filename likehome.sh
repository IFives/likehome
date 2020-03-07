!/bin/bash

echo "Welcome to your new Debian/Ubuntu based OS !"

apt update
apt -y upgrade

#echo "Are you on a High Density of Pixel Display (More than 1080p) ? yes or no"
#read answerSpotify

#echo "Do you use GNOME ? yes or no"
#read answerGnome
#echo "${answerGnome}"

echo "What's your home folder name ? (Ex: /home/username)"
read usrName

#Install and configure VIM
apt -y install vim
cp .vimrc /home/${usrName}/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Install and configure Spotify if you have a HiDPi
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
apt -y install spotify-client
#if [ ${answerSpotify} = "yes" ] 
#then
        sudo cp spotify.desktop /usr/share/applications/
#fi

apt -y install gnome-tweak-tool

add-apt-repository ppa:papirus/papirus
apt -y install papirus-icon-theme

apt -y install thunderbird

apt -y install snapd

sleep 1000

snap install discord

clear

echo "The personalisation is finnished, go see the result by yourself !"
