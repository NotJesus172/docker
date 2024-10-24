FROM ubuntu:jammy

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /stoneblock

RUN apt-get update && apt-get install -y \
    openjdk-8-jdk \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O SkyFactory4-server-4.2.4.zip https://mediafilez.forgecdn.net/files/3565/687/SkyFactory-4_Server_4_2_4.zip

RUN unzip SkyFactory4-server-4.2.4.zip

RUN rm SkyFactory4-server-4.2.4.zip

RUN chmod +x Install.sh

RUN ./Install.sh

RUN echo "eula=true" > eula.txt

RUN cp forge-1.12.2-14.23.5.2860.jar forge.jar && rm forge-1.12.2-14.23.5.2860.jar

EXPOSE 25565

ENTRYPOINT [ "java" ]

CMD [ "-Xmx8192M", "-Xms4096M", "-jar", "forge.jar", "nogui" ]