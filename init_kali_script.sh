#!/bin/bash

#Check if connected to network
if ! nc -zw1 github.com 443;
then
	echo -e "\n Uh oh... There seems to be no internet connection. Please connect to a network and try again\n"
	exit 0
fi

#Check if git exists
if ! [ -x "$(command -v git)" ];
then
	echo -e "\nPlease install git before continuing...\n"
	exit 0
fi

echo -e "\nStarting the process of making Kali usable\n________ ___ _______ __ ______ ____ ______\n"

#initializing variables
if [ $SUDO_USER ]
then
	username=$SUDO_USER
else
	username=$USER
fi
current_directory=$(dirname $(readlink -f "$0"))

#To make bash remember history forever
echo -e "\n1.\tMaking bash remember history forever...\n"
sudo sed -i 's/HISTSIZE=1000/HISTSIZE=-1/g' /home/$username/.bashrc
sudo sed -i 's/HISTFILESIZE=2000/HISTFILESIZE=-1/g' /home/$username/.bashrc
echo -e "\tKali's bash will now remember history forever.\n"

#To use Google and Cloudflare DNS
echo -e "\n2.\tUse Google and Cloudflare DNS...\n"
sudo echo -e "nameserver 8.8.8.8\nnameserver 1.1.1.1\nnameserver 8.8.4.4\nnameserver 1.0.0.1" > /etc/resolv.conf
echo -e "\tKali now uses Google and Cloudflare DNS.\n"

#To make apt use HTTPS
echo -e "\n3.\tMaking apt transport through https...\n"
sudo apt clean
sudo apt update
sudo apt install -y apt-transport-https
echo -e "\n\tKali's apt now transports through https.\n"

#To modify sources.list to use fastest repositories
echo -e "\n4.\tModifying sources.list so as to use the fastest repos...\n"
git clone https://github.com/IceM4nn/mirrorscript-v2.git $current_directory/mirrorscript-v2
python3 $current_directory/mirrorscript-v2/mirrorscript-v2.py -v -https -src
sudo echo -e "deb http://ftp.debian.org/debian unstable main contrib non-free\ndeb http://deb.debian.org/debian experimental main" > /etc/apt/sources.list.d/debian.list
sudo echo -e "deb http://http.kali.org/kali kali-bleeding-edge main contrib non-free" > /etc/apt/sources.list.d/bleeding-edge.list
sudo echo -e "APT::Default-Release \"kali-bleeding-edge\";" > /etc/apt/apt.conf.d/local
sudo rm -rf $current_directory/mirrorscript-v2
sudo rm -rf /var/lib/apt/lists
sudo apt install -y kali-archive-keyring
sudo apt install -y dirmngr
sudo apt-key adv --keyserver hkp://keys.gnupg.net --recv-key 7D8D0BF6
sudo wget -q -O - https://www.kali.org/archive-key.asc | apt-key add
sudo wget -q -O - https://www.kali.org/archive-key.asc | gpg --import
sudo gpg --keyserver hkp://keys.gnupg.net --recv-key 7D8D0BF6
sudo apt clean
sudo apt update
echo -e "\n\tKali now uses the fastest repos.\n"

#To enable add-apt-repository
echo -e "\n5.\tEnabling add-apt-repository to include ubuntu ppa's...\n" 
sudo mv $current_directory/add-apt-repository /usr/sbin/
sudo chmod o+x /usr/sbin/add-apt-repository
sudo chown root:root /usr/sbin/add-apt-repository
echo -e "\tUbuntu repositories can now be added using /usr/sbin/add-apt-repository."

#In the end, it doesn't even matter
echo -e "\tFinal Steps..."
sudo apt clean
sudo apt update
sudo apt -y upgrade
sudo apt -y dist-upgrade
sudo apt -y full-upgrade
sudo apt -y autoremove
echo -e "\n\nDone! Enjoy Kali in all it's glory!\n"
