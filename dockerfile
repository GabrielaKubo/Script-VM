FROM openjdk:11-jre
COPY . /Script-VM/SCRIPT-CLI/gerencie/target
WORKDIR /usr/src/myapp
RUN chmod 777 . /Script-VM/SCRIPT-CLI/gerencie/target
CMD ["java", "-jar", "gerencie-1.0-SNAPSHOT-jar-with-dependencies.jar"]