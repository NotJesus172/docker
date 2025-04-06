FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV EULA=false
ENV MAXRAM="1024M"
ENV MINRAM="1024M"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y openjdk-21-jdk wget
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

WORKDIR /srv/minecraft

RUN wget -O paper.jar https://api.papermc.io/v2/projects/paper/versions/1.21.1/builds/128/downloads/paper-1.21.1-128.jar
RUN echo "eula=$EULA" > eula.txt

EXPOSE 25565

ENTRYPOINT [ "java" ]
    CMD [ -Xmx${MAXRAM}, "-Xms${MINRAM}", "-jar", "paper.jar", "nogui" ]