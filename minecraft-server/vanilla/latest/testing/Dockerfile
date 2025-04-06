FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV EULA= VERSION=latest MAX_RAM=1024M MIN_RAM=1024M

WORKDIR /srv/minecraft

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

COPY eula.txt /srv/minecraft
COPY install.sh /srv/minecraft
COPY start.sh /srv/minecraft

RUN chmod +x install.sh start.sh

EXPOSE 25565

ENTRYPOINT [ "/srv/minecraft/install.sh" ]

CMD [ "/srv/minecraft/start.sh" ]
#CMD [ "-Xmx1024", "-Xms1024", "-jar", "server.jar", "nogui" ]