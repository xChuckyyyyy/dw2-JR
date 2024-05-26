@echo off
Build de Docker image
docker build -t demo-site .

Stop en verwijder een bestaande container (indien aanwezig)
docker stop demo-site-container
docker rm demo-site-container

Start een nieuwe container op poort 81
docker run -d -p 81:80 --name demo-site-container demo-site
