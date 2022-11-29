#!/bin/bash
echo "Você gostaria de alterar a senha? (s/n)"
read inst
if [ \"$inst\" == \"s\" ];
then
	sudo passwd ubuntu
else
	echo "Prosseguindo..."
fi
	sudo apt update && sudo apt upgrade -y

echo "Você gostaria de instalar a interface gráfica? (s/n)"
read inst
if [ \"$inst\" == \"s\" ];
then
		sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y
else
		echo "Prosseguindo..."
fi

java --version
if [ $? -eq 0 ];
then
	echo "Java já está instalado"
else
	echo "Gostaria de instalar o Java? (s/n)"
	read inst
	if [ \"$inst\" == \"s\" ];
	then
		sudo apt install default-jre -y
	else
		echo "Prosseguindo..."
	fi
fi


#Criando docker
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
# sudo docker –-version
sudo docker ps
# Pull ele está baixando o MYSQL.
sudo docker pull mysql:5.7
sudo docker images
# Ele cria as configurações do mysql..
# Caso não consiga executar o banco pelo java descomentar linha abaixo.
sudo docker run -d -p 3306:3306 --name ContainerBD -e "MYSQL_DATABASE=gerencie" -e "MYSQL_ROOT_PASSWORD=#Gfgrupo10" mysql:5.7


#Criando jar executável
if [ $? -eq 0 ];
then
echo "java instalado"
sudo apt install default-jre -y
    sleep 3
git clone https://github.com/GabrielaKubo/SCRIPT-GUI.git
git clone https://github.com/GabrielaKubo/SCRIPT-CLI.git

sudo docker build -t dockerfile .
sudo docker run -d -t --rm --name containerjava dockerfile


else
echo "java nao instalado"
echo "gostaria de instalar o java em sua Máquina Virtual? (s/n)"
read inst
if [ \"$inst\" == \"s\" ];
then
sudo apt install default-jre -y
git clone https://github.com/GabrielaKubo/SCRIPT-GUI.git
git clone https://github.com/GabrielaKubo/SCRIPT-CLI.git

sudo docker build -t dockerfile .
sudo docker run -d -t --name containerjava dockerfile

fi
fi