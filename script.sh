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

#saber versão java
# VERSION=”$(java -version 2>&1 | grep version | cut -d’”’ -f2)”
# if [ “${VERSION}” ];
# then
#   echo “Cliente possui java instalado: ${VERSION}”
# else
#   echo “Cliente não possui java instalado”
# fi

#instalação java default
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
docker --version
if [ $? -eq 0 ];
then
	echo "Docker já está instalado"
else
	echo "Gostaria de instalar o Docker e Banco Gerencie! ? (s/n)"
	read inst
	if [ \"$inst\" == \"s\" ];
	then
		sudo apt install docker.io -y

		echo "Iniciando Docker"
		echo "Caminho: "
		pwd
		sudo systemctl start docker
		sudo systemctl enable docker
		sudo docker pull mysql:5.7
		sudo docker images
		sudo docker run -d -p 3306:3306 --name ContainerBD -e "MYSQL_DATABASE=gerencie" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7

		echo Banco de dados Criado com Sucesso!
	fi
fi

#Criando jar executável
git clone https://github.com/Gerencie-Monitoramento-de-totens/JAR.git
cd JAR/gerencie/target
java -jar gerencie-1.0-SNAPSHOT.jar


dir