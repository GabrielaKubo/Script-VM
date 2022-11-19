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

#Criando jar executável
#cd Desktop
#git clone https://github.com/Gerencie-Monitoramento-de-totens/JAR.git
#cd JAR/gerencie/target
#java -jar gerencie-1.0-SNAPSHOT.jar


if [ $? -eq 0 ];
then
	echo "Arquivo .jar não instalado!"
	echo "Gostaria de instalar arquivo .jar Gerencie! ? (s/n)"
	read inst
	if [ \"$inst\" == \"s\" ];
	then
		cd /home/ubuntu/Desktop
		git clone https://github.com/Gerencie-Monitoramento-de-totens/JAR.git
		echo "Arquivo clonado com sucesso!"
		echo "Executando arquivo"
		cd JAR/gerencie/target
		java -jar gerencie-1.0-SNAPSHOT.jar
	fi
else
	echo "Arquivo .jar já adquirido!"
	echo "Gostaria de remover o arquivo .jar? (s/n)"
	read inst
	if [ \"$inst\" == \"s\" ];
	then
		echo "Removendo arquivo"
		cd /home/ubuntu/Desktop
		sudo rm -r "JAR"
		echo "Gostaria de reinstalar arquivo .jar Gerencie! ? (s/n)"
		read inst
		if [ \"$inst\" == \"s\" ];
		then
			cd /home/ubuntu/Desktop
			git clone https://github.com/Gerencie-Monitoramento-de-totens/JAR.git
			echo "Arquivo clonado com sucesso!"
			echo "Executando arquivo"
			cd JAR/gerencie/target
			java -jar gerencie-1.0-SNAPSHOT.jar
		fi
	fi
fi