### DEEL 1: instructies voor het BUILDEN van de IMAGE
FROM ubuntu:20.04

# We starten vanaf de bestaande “ubuntu”-image (tag: 20.04)
# deze image wordt van de registry (Docker Hub) gehaald.
RUN apt update
ENV DEBIAN_FRONTEND=noninteractive

# Bovenstaande lijn is nodig omdat er anders naar de timezone gevraagd wordt
# tijdens de installatie van Apache
RUN apt install -y apache2
RUN apt install -y php

# Kopieer de inhoud van “html”(op de host) naar “/var/www/html”(in de image).
COPY html /var/www/html/

# Maak buildtime.txt aan met de huidige tijd
RUN date -u +"%a %b %d %T UTC %Y" > /var/www/html/buildtime.txt

### DEEL 2: extra details voor bij het RUNNEN van een CONTAINER
WORKDIR /var/www/html/
# Directory waar je terecht komt als je inlogt op een draaiende container

EXPOSE 80/tcp
# Binnen deze image/container zal poort 80 (over TCP) gebruikt worden.

CMD service apache2 start && bash
# Met CMD geef je het commando op dat moet uitgevoerd worden bij het STARTEN (of RUNNEN) van de CONTAINER.
# De “&& bash” is belangrijk omdat de container anders zou stoppen na het uitvoeren van “service apache2 start”.
# Het commando “bash” blijft immers “hangen”, tot je binnen bash “exit” tikt.
