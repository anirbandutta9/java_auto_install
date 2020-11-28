#!/bin/bash
################################################################################
# Script for installing Oracle JAVA 8 on Ubuntu 16.04, 18.04 and 20.04 
# Author: Anirban Dutta
#-------------------------------------------------------------------------------


if [ "$(whoami)" != 'root' ]; then
        echo "Please run this script as root user only! "
		echo "Use this command to switch to root user:   sudo -i "
        exit 1;
    fi

	
	
banner()
{
  echo "+-----------------------------------------------------------------------+"
  printf "| %-40s |\n" "`date`"
  echo "|                                                                       |"
  printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
  echo "+-----------------------------------------------------------------------+"
}

banner "Automatic JAVA Installation Started.
Please wait !!  This might take several minutes to complete !! "

sleep 7;

echo -e "\n---- Updating Server ----"
sudo apt-get update -y
sudo apt-get install wget 

mkdir /usr/java
cd /usr/java

echo -e "\n---- Downloading and installing Oracle JAVA 8 ----"
wget https://media.githubusercontent.com/media/anirbandutta9/java_auto_install/master/server-jre-8u271-linux-x64.tar.gz

tar -xvf server-jre-8u271-linux-x64.tar.gz

echo 'JAVA_HOME="/usr/java/jdk1.8.0_271/bin/java"'  >> /etc/environment

source /etc/environment

sudo update-alternatives --install "/usr/bin/java" "java" "/usr/java/jdk1.8.0_271/bin/java" 1

sudo update-alternatives --set java /usr/java/jdk1.8.0_271/bin/java









