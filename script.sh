#!/bin/bash

echo "fred" > users.txt
echo "daphnie" >> users.txt
echo "velma" >> users.txt
echo "shaggy" >> users.txt
echo "scooby" >> users.txt

Lines=$(cat users.txt)
Line=$(sed -n $count\p users.txt)
declare -i count=0
for Line in $Lines
do
        ((count++))
        useradd -m $Line
	usermod -aG sudo $Line

	mkdir /home/$Line/Desktop
	mkdir /home/$Line/Documents
	mkdir /home/$Line/Pictures
	mkdir /home/$Line/Videos
	mkdir /home/$Line/Music
	mkdir /home/$Line/3D_Objects

	for i in {1..5}
	do
		mkdir /home/$Line/Documents/Folder$i
 	done
done

apt update -y
apt upgrade -y

apt install network-manager -y
apt install nginx-core -y
apt install iftop -y
apt install lolcat -y 
apt install fortune-mod -y

apt-get update
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update

apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

docker run hello-world
