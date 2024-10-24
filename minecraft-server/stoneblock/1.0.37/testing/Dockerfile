FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /srv/stoneblock

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    openjdk-8-jdk \
    wget \
    unzip && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
RUN wget -O stoneblock-server-1.0.37.zip https://mediafilez.forgecdn.net/files/3016/966/stoneblock_1.0.37-server.zip
RUN unzip stoneblock-server-1.0.37.zip && \
    rm stoneblock-server-1.0.37.zip
RUN chmod +x Install.sh && \
    chmod +x LaunchServer.sh
RUN ./Install.sh
RUN ./LaunchServer.sh
RUN cp forge-1.12.2-14.23.5.2854.jar forge.jar && \
    rm forge-1.12.2-14.23.5.2854.jar
RUN echo "eula=true" > eula.txt

EXPOSE 25565

ENTRYPOINT [ "java" ]

CMD [ "-Xmx10240M", "-Xms4096M", "-jar", "forge.jar", "nogui" ]
