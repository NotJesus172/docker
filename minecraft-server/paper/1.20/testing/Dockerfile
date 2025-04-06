FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y openjdk-17-jdk wget
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

WORKDIR /srv/minecraft

RUN wget -O paper.jar https://api.papermc.io/v2/projects/paper/versions/1.20/builds/17/downloads/paper-1.20-17.jar
RUN echo "eula=true" > eula.txt

EXPOSE 25565

ENTRYPOINT [ "java" ]

CMD [ "-Xmx1024M", "-Xms1024M", "-jar", "paper.jar", "nogui" ]