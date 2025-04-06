FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV EULA= VERSION=latest

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y openjdk-21-jdk wget
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

WORKDIR /srv/minecraft

COPY eula.txt /srv/minecraft
COPY install.sh /srv/minecraft

RUN chmod +x install.sh

EXPOSE 25565

ENTRYPOINT [ "./install.sh" ]

CMD [ "java" "-Xmx1024", "-Xms1024", "-jar", "paper.jar", "nogui" ]